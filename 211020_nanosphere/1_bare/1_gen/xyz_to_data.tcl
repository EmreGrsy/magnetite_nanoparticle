package require topotools
package require pbctools

mol new Fe3O4_mp-19306_conventional_standard_04022021115816.xyz

pbc set {50.0 50.0 50.0}

set element_fe [atomselect top "name Fe"]

$element_fe set type 2
$element_fe set mass 55.845001
$element_fe set charge 1.050000

set element_O [atomselect top "name O"]

$element_O set type 1
$element_O set mass 15.9994
$element_O set charge -1.050000 

set sys [atomselect top all]
topo writelammpsdata initial_structure_before_charge_redistribution.data full
