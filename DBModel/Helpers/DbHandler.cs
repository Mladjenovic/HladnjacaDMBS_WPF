using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBModel.Helpers
{
    public class DbHandler
    {
        private static DbHandler instance;
        public static DbHandler Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DbHandler();
                    return instance;
                }
                else
                {
                    return instance;
                }
            }
        }

        public List<int?> GetAllNadredjenaIds()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from oj in db.OrganizacionaJedinicas select oj.OrganizacionaJedinicaId_nadredjena).ToList();
            }
        }
        public List<int> GetAllKlIds()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from k in db.Klijents select k.Id).ToList();
            }
        }
        public List<int> GetAllUgovorIds()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from k in db.Ugovors select k.Id).ToList();
            }
        }
        public List<int> GetAllOJIDS()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from oj in db.OrganizacionaJedinicas select oj.Id).ToList();
            }
        }
        public List<int> GetAllHlIds()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from hl in db.Hladnjacas select hl.Id).ToList();
            }
        }


        #region Klijent

        //Create
        public void CreateKlijent(string adresa, string ime, string prezime, int jmbg)
        {
            Klijent klijent = new Klijent()
            {
                Adresa = adresa,
                Ime = ime,
                Prezime = prezime,
                Jmbg = jmbg
            };

            using (var db = new HladnjacaDBContext())
            {
                db.Klijents.Add(klijent);
                db.SaveChanges();
            }
        }

        //Read
        public List<Klijent> GetAllKlijents()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from klijent in db.Klijents select klijent).ToList();
            }
        }

        //Update
        public void UpdateKlijent(int id, string adresa, string ime, string prezime, int jmbg)
        {
            Klijent klijent;
            using (var db = new HladnjacaDBContext())
            {
                klijent = db.Klijents.Where(k => k.Id == id).FirstOrDefault();
            }

            bool haveChanges = false;

            if (!klijent.Adresa.Equals(adresa))
            {
                klijent.Adresa = adresa;
                haveChanges = true;
            }
            if (!klijent.Ime.Equals(ime))
            {
                klijent.Ime = ime;
                haveChanges = true;
            }
            if (!klijent.Prezime.Equals(prezime))
            {
                klijent.Prezime = prezime;
                haveChanges = true;
            }
            if (!klijent.Jmbg.Equals(jmbg))
            {
                klijent.Jmbg = jmbg;
                haveChanges = true;
            }

            if (haveChanges)
            {
                using (var db = new HladnjacaDBContext())
                {
                    db.Entry(klijent).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
            }
        }

        //Remove
        public void DeleteKlijent(int klijentID)
        {
            Klijent klijent;
            using (var db = new HladnjacaDBContext())
            {
                klijent = db.Klijents.Where(k => k.Id == klijentID).FirstOrDefault();
                db.Entry(klijent).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
            }
        }



        #endregion

        #region Organizaciona jedinica

        //Create
        public void CreateOrganizacionaJedinica(string naziv, int? nadredjena)
        {
            OrganizacionaJedinica oj = new OrganizacionaJedinica()
            {
                Naziv = naziv,
                OrganizacionaJedinicaId_nadredjena = nadredjena
            };

            using (var db = new HladnjacaDBContext())
            {
                db.OrganizacionaJedinicas.Add(oj);
                db.SaveChanges();
            }
        }


        //Read
        public List<OrganizacionaJedinica> GetAllOrganizacionaJedinicas()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from oj in db.OrganizacionaJedinicas select oj).ToList();
            }
        }

        //Update
        public void UpdateOrganizacionaJedinica(int id, string naziv, int? nadredjena)
        {
            OrganizacionaJedinica oj;
            using (var db = new HladnjacaDBContext())
            {
                oj = db.OrganizacionaJedinicas.Where(k => k.Id == id).FirstOrDefault();
            }

            bool haveChanges = false;

            if (!oj.Naziv.Equals(naziv))
            {
                oj.Naziv = naziv;
                haveChanges = true;
            }
            if (!oj.OrganizacionaJedinicaId_nadredjena.Equals(nadredjena))
            {
                oj.OrganizacionaJedinicaId_nadredjena = nadredjena;
                haveChanges = true;
            }

            if (haveChanges)
            {
                using (var db = new HladnjacaDBContext())
                {
                    db.Entry(oj).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
            }
        }

        //Remove
        public void DeleteOrganizacionaJedinica(int ojID)
        {
            OrganizacionaJedinica oj;
            using (var db = new HladnjacaDBContext())
            {
                oj = db.OrganizacionaJedinicas.Where(k => k.Id == ojID).FirstOrDefault();
                db.Entry(oj).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
            }
        }
        #endregion

        #region Hladnjaca

        //Create

        public void CreateHladnjaca(string naziv, int idOj)
        {
            Hladnjaca hladnjaca = new Hladnjaca()
            {
                NazivHladnjace = naziv,
                OrganizacionaJedinicaId = idOj
            };

            using (var db = new HladnjacaDBContext())
            {
                db.Hladnjacas.Add(hladnjaca);
                db.SaveChanges();
            }
        }

        //Read
        public List<Hladnjaca> GetAllHladnjacas()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from hl in db.Hladnjacas select hl).ToList();
            }
        }

        //Update

        public void UpdateHladnnjaca(int id, string nazivHladnjace, int ojId)
        {
            Hladnjaca hladnjaca;
            using (var db = new HladnjacaDBContext())
            {
                hladnjaca = db.Hladnjacas.Where(k => k.Id == id).FirstOrDefault();
            }

            bool haveChanges = false;

            if (!hladnjaca.NazivHladnjace.Equals(nazivHladnjace))
            {
                hladnjaca.NazivHladnjace = nazivHladnjace;
                haveChanges = true;
            }
            if (!hladnjaca.OrganizacionaJedinicaId.Equals(ojId))
            {
                hladnjaca.OrganizacionaJedinicaId = ojId;
                haveChanges = true;
            }

            if (haveChanges)
            {
                using (var db = new HladnjacaDBContext())
                {
                    db.Entry(hladnjaca).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
            }
        }


        public void DeleteHladnjaca(int hl_ID)
        {
            Hladnjaca hladnjaca;
            using (var db = new HladnjacaDBContext())
            {
                hladnjaca = db.Hladnjacas.Where(k => k.Id == hl_ID).FirstOrDefault();
                db.Entry(hladnjaca).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
            }
        }

        #endregion

        #region Komora

        //Create

        public void CreateKomora(string naziv, int hladnjacaID)
        {
            Komora komora = new Komora()
            {
                NazivKomore = naziv,
                HladnjacaId = hladnjacaID
            };

            using (var db = new HladnjacaDBContext())
            {
                db.Komoras.Add(komora);
                db.SaveChanges();
            }
        }
        //Read

        public List<Komora> GetAllKomoras()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from komora in db.Komoras select komora).ToList();
            }
        }

        //Update
        public void UpdateKomora(int id, string naziv, int hladnjacaID)
        {
            Komora komora;
            using (var db = new HladnjacaDBContext())
            {
                komora = db.Komoras.Where(k => k.Id == id).FirstOrDefault();
            }

            bool haveChanges = false;

            if (!komora.NazivKomore.Equals(naziv))
            {
                komora.NazivKomore = naziv;
                haveChanges = true;
            }
            if (!komora.HladnjacaId.Equals(hladnjacaID))
            {
                komora.HladnjacaId = hladnjacaID;
                haveChanges = true;
            }

            if (haveChanges)
            {
                using (var db = new HladnjacaDBContext())
                {
                    db.Entry(komora).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
            }
        }

        //Remove
        public void DeleteKomora(int komoraID)
        {
            Komora komora;
            using (var db = new HladnjacaDBContext())
            {
                komora = db.Komoras.Where(k => k.Id == komoraID).FirstOrDefault();
                db.Entry(komora).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
            }
        }


        #endregion

        #region Voce

        //Read
        public List<Voce> getAllVoces()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from voce in db.Voces select voce).ToList();
            }
        }

        
        //Create
        public void CreateVoce(string vrsta)
        {
            Voce voce = new Voce()
            {
                Vrsta = vrsta
            };

            using (var db = new HladnjacaDBContext())
            {
                db.Voces.Add(voce);
                db.SaveChanges();
            }
        }

        

        //Update
        public void UpdateVoce(int id, string vrsta)
        {
            Voce voce;
            using (var db = new HladnjacaDBContext())
            {
                voce = db.Voces.Where(k => k.Id == id).FirstOrDefault();
            }

            bool haveChanges = false;

            if (!voce.Vrsta.Equals(vrsta))
            {
                voce.Vrsta = vrsta;
                haveChanges = true;
            }

            if (haveChanges)
            {
                using (var db = new HladnjacaDBContext())
                {
                    db.Entry(voce).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
            }
        }
        //Remove
        public void DeleteVoce(int voceID)
        {
            Voce voce;
            using (var db = new HladnjacaDBContext())
            {
                voce = db.Voces.Where(k => k.Id == voceID).FirstOrDefault();
                db.Entry(voce).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
            }
        }

        #endregion

        #region Ugovor
        //Create
        public void CreateUgovor(string tip, int klijentID, int hladnjacaID)
        {
            Ugovor ugovor = new Ugovor()
            {
                Tip = tip,
                DatumPotpisivanja = DateTime.Now,
                KlijentId = klijentID,
                HladnjacaId = hladnjacaID
            };

            using (var db = new HladnjacaDBContext())
            {
                db.Ugovors.Add(ugovor);
                db.SaveChanges();
            }
        }

        //Read
        public List<Ugovor> GetAllUgovors()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from u in db.Ugovors select u).ToList();
            }
        }

        //Update
        public void UpdateUgovor(int id, string tip)
        {
            Ugovor ugovor;
            using (var db = new HladnjacaDBContext())
            {
                ugovor = db.Ugovors.Where(k => k.Id == id).FirstOrDefault();
            }

            bool haveChanges = false;

            if (!ugovor.Tip.Equals(tip))
            {
                ugovor.Tip = tip;
                haveChanges = true;
            }

            if (haveChanges)
            {
                using (var db = new HladnjacaDBContext())
                {
                    db.Entry(ugovor).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
            }
        }

        //Remove
        public void DeleteUgovor(int ugovorID)
        {
            Ugovor ugovor;
            using (var db = new HladnjacaDBContext())
            {
                ugovor = db.Ugovors.Where(k => k.Id == ugovorID).FirstOrDefault();
                db.Entry(ugovor).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
            }
        }


        #endregion

        #region Transport


        //Create
        public void CreateTransport()
        {
            Transport t = new Transport() { };

            using (var db = new HladnjacaDBContext())
            {
                db.Transports.Add(t);
                db.SaveChanges();
            }
        }
        //Read
        public List<Transport> GetAllTransports()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from t in db.Transports select t).ToList();
            }
        }

        //Remove
        public void DeleteTransport(int transID)
        {
            Transport transport;
            using (var db = new HladnjacaDBContext())
            {
                transport = db.Transports.Where(k => k.Id == transID).FirstOrDefault();
                db.Entry(transport).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
            }
        }

        //Update
        public void UpdateTransprot() { }


        #endregion

        #region Karton

        //Read
        public List<Karton> GetAllKartons()
        {
            using (var db = new HladnjacaDBContext())
            {
                return (from k in db.Kartons select k).ToList();
            }
        }

        //Create
        public void CreateKarton(string vrsta, int ugovorID, int klijentID, int hladnjacaID)
        {
            Karton karton = new Karton() {
                Vrsta = vrsta
            };

            using (var db = new HladnjacaDBContext())
            {
                db.Kartons.Add(karton);
                db.SaveChanges();
            }
        }

        //Update
        public void UpdateKarton(int id, string vrsta)
        {
            Karton karton;
            using (var db = new HladnjacaDBContext())
            {
                karton = db.Kartons.Where(k => k.Id == id).FirstOrDefault();
            }

            bool haveChanges = false;

            if (!karton.Vrsta.Equals(vrsta))
            {
                karton.Vrsta = vrsta;
                haveChanges = true;
            }
            if (haveChanges)
            {
                using (var db = new HladnjacaDBContext())
                {
                    db.Entry(karton).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
            }
        }

        //Remove
        public void DeleteKarton(int kartonID)
        {
            Karton karton;
            using (var db = new HladnjacaDBContext())
            {
                karton = db.Kartons.Where(k => k.Id == kartonID).FirstOrDefault();
                db.Entry(karton).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
            }
        }

        #endregion

    }
}
