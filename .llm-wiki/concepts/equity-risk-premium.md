---
type: Concept
title: Aktienrisikoprämie (Equity Risk Premium - ERP)
description: Definition, mathematische Berechnungsmodelle (DDM, FCFE, Earnings Yield) und historische Kompression im September 2026.
sources: [/raw/processed/markt_einflussfaktoren_11_sept_2026.md]
timestamp: 2026-09-11T23:00:00Z
---

# Aktienrisikoprämie (Equity Risk Premium - ERP)

Die **Aktienrisikoprämie (ERP)** ist die zusätzliche Rendite, die Investoren für das Risiko einer Aktienanlage im Vergleich zu einer völlig risikofreien Anlage (z. B. 10-jährige [[concepts/us-treasury-yields|US-Staatsanleihen]]) fordern.

$$\text{ERP} = \text{Erwartete Rendite des Aktienmarktes} - \text{Risikofreier Zinssatz } (R_f)$$

## Mathematische Berechnungsmodelle (Implizite/Zukunftsgerichtete ERP)

Institutionelle Anleger nutzen vor allem zukunftsgerichtete, implizite Modelle, um zu ermitteln, welche Risikoprämie aktuell im Markt eingepreist ist:

### 1. Dividend Discount Model (DDM) / Gordon Growth Model
Der Wert des Aktienindex entspricht dem Barwert aller künftigen Dividenden.
$$r = \frac{\text{Erwartete Dividende}_{t+1}}{\text{Aktueller Indexkurs}} + g$$
$$\text{Implizite ERP} = r - R_f$$
*(wobei $g$ die langfristige Wachstumsrate bezeichnet)*.

### 2. Free Cash Flow to Equity (FCFE) Modell
Zweistufiges Modell für Märkte mit hohen Aktienrückkäufen (*Buybacks*):
* **Schritt 1:** Erfassung der erwarteten Cashflows (Dividenden + Buybacks) für die nächsten 5 Jahre.
* **Schritt 2:** Abzinsung mit Terminal-Growth ($g$). Der ermittelte interne Zinsfuß abzüglich $R_f$ ergibt die implizite ERP.

### 3. Earnings Yield Modell (Der schnelle Überschlag der Händler)
Nutzung des inversen Kurs-Gewinn-Verhältnisses (KGV):
$$\text{Gewinnrendite} = \frac{1}{\text{KGV}}$$
$$\text{Implizite ERP} \approx \text{Gewinnrendite} - R_f$$

## Historische Durchschnitte vs. Situation September 2026

### Historische Benchmarks (US-Markt S&P 500)
* **Arithmetisches Mittel (1926–heute):** **5,4 % – 6,2 %**
* **Geometrisches Mittel (Zinseszins-Effekt):** **4,0 % – 5,0 %**
* **Impliziter Median (Damodaran):** **4,0 % – 5,0 %**

### Aktuelle historische Kompression (September 2026)
Aufgrund der auf **4,96 %** gestiegenen 10-jährigen US-Rendite bei gleichzeitig hohem KGV des S&P 500 (~22) befindet sich die US-Aktienrisikoprämie auf Tiefständen seit 2002:

* **DDM / FCFE Modell (Prof. Damodaran):** **~4,17 % – 4,42 %** (Reife Märkte).
* **Earnings Yield Modell:**
  $$\text{Gewinnrendite S\&P 500} = \frac{1}{22} \approx 4,54 \% \quad (\text{nominell})$$
  $$\text{ERP (Earnings Yield)} = 4,54 \% - 4,96 \% = -0,42 \% \quad (\text{leicht negativ!})$$

## Wirtschaftliche Konsequenzen der niedrigen Prämie
1. **Asset Allocation / Kapitalumschichtung:** Institutionelle Anleger reduzieren Aktienquoten und schichten in risikofreie Anleihen um, da das Risiko bei Aktien unzureichend vergütet wird.
2. **Druck auf Unternehmensbewertungen:** Um die ERP wieder auf ein attraktives Niveau anzuheben, müssen entweder die Aktienkurse sinken (KGV fällt) oder die Unternehmensgewinne stark wachsen.

## Verknüpfte Konzepte
* [[concepts/us-treasury-yields|US-Anleiherenditen (Treasury Yields)]]
* [[concepts/consumer-price-index|Consumer Price Index (CPI)]]
* [[concepts/regional-market-divergence-usa-europe|Regionale Markt-Divergenz USA vs. Europa]]
* [[concepts/fomc-decision|FOMC Zinsentscheidung]]
