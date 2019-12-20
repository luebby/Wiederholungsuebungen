###########################
## Hinweise:
# Im Rahmen einer freiwilligen Onlineumfrage wurden zu Beginn des Semsters den Studierenden folgende Fragen gestellt:

# Am 28.05.2019 nahmen auch wieder FOM Studierende, zusammen mit einigen Dozent*innen und Mitarbeiter*innen der FOM 
# am B2Run in Dortmund teil. Die Laufstrecke betrug dabei 6,2 km. 

# Was schätzen Sie, wie lang war die durchschnittliche Laufzeit der FOM-Männer in Minuten? 
# Was schätzen Sie, wie lang war die durchschnittliche Laufzeit der FOM-Frauen in Minuten? 
# Welches Geschlecht haben Sie? ###########################
## Hinweise:
# Im Rahmen einer freiwilligen Onlineumfrage wurden zu Beginn des Semsters den Studierenden folgende Fragen gestellt:

# Am 28.05.2019 nahmen auch wieder FOM Studierende, zusammen mit einigen Dozent*innen und Mitarbeiter*innen der FOM 
# am B2Run in Dortmund teil. Die Laufstrecke betrug dabei 6,2 km. 

# Was schätzen Sie, wie lang war die durchschnittliche Laufzeit der FOM-Männer in Minuten? 
# Was schätzen Sie, wie lang war die durchschnittliche Laufzeit der FOM-Frauen in Minuten? 
# Welches Geschlecht haben Sie? 
# Wie regelmäßig waren Sie letztes Jahr joggen? 

# Siehe https://statistix.org/limesurvey/index.php/635569/


###########################
## Vorbereitung:
# mosaic laden
library(mosaic)

###########################
## Laufzeit B2Run 2019
B2Run <- read.csv2("http://statistix.org/Data/B2run.csv")
B2Run2019 <- B2Run %>%
  filter(jahr == 2019)

gf_boxplot(zeit ~ geschlecht, data = B2Run2019)
favstats(zeit ~ geschlecht, data = B2Run2019)


###########################
## Vorbereitung:

# Daten herunterladen:
B2RunGuess <- read.csv2("http://statistix.org/Data/results-survey635569.csv", na.strings = "")

# Vorverarbeitung:
# 1. Variablen umbenennen
# 2. Beobachtungen mit fehlenden Werten löschen
# 3. joggen als ordinale Variable definieren
# 4. Relevante Variablen auswählen

B2RunGuess <- B2RunGuess %>%
  rename(geschlecht = Welches.Geschlecht.haben.Sie.) %>%
  rename(joggen = Wie.regelmäßig.waren.Sie.letztes.Jahr.joggen.) %>%
  rename(lauf_m = Was.schätzen.Sie..wie.lang.war.die.durchschnittliche.Laufzeit.der.FOM.Männer.in.Minuten.) %>%
  rename(lauf_w = Was.schätzen.Sie..wie.lang.war.die.durchschnittliche.Laufzeit.der.FOM.Frauen.in.Minuten.) %>%
  na.omit() %>%
  mutate(joggen = factor(joggen, ordered = TRUE, levels=c("Ich war nicht joggen", "Nicht monatlich, aber ich war dieses Jahr schon joggen.",
                                                          "Nicht wöchentlich, aber mindestens 1x im Monat", "Mindestens 1x die Woche"))) %>%
  select(geschlecht, joggen, lauf_w, lauf_m)

inspect(B2RunGuess)

###########################
## Aufgabe:
# Überlegen Sie sich eine Fragestellung die Sie mit diesen Daten analysieren können - und führen Sie die Analyse durch.
# Mögliche Fragestellungen sind z.B.:
# - Unterscheidet sich der geschätzte Zusammenhang der Laufzeiten zwischen den Geschlechtern?
# - Gibt es einen Unterschied in der geschätzten Laufzeitdifferenz zwischen den Geschlechtern?
# - Kann das eigene Geschlecht besser eingeschätzt werden?
# - Können "regelmäßige" Jogger die Laufzeit besser einschätzen?
# - ...



