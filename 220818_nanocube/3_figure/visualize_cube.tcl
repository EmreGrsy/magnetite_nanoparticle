# Global parameters
color Display Background white
display Backgroundgradient off
axes location off

package require topotools
package require pbctools

topo readlammpsdata coord_cubMin.data 

topo guessatom lammps data

#set formate_full [atomselect top all]

# Allign the sufrace to X-Y axis so it would be easier to define cut plane
#set transfer_matrix [transaxis z 135]
#$formate_full move $transfer_matrix

display resetview

rotate x by 90
rotate z by 180

# Delete default representation
mol delrep 0 top

#set formate_only [atomselect top "all and y>-6 and y<6 and z>19"]
#set magnetite [atomselect top "all and y>-6 and y<6 and z<19"]

# Define representations 
#mol representation DynamicBonds 2.4 0.08 500
#mol color Type
#mol selection {all and y>-6 and y<6 and z<19}
#mol addrep top

#mol representation DynamicBonds 2.0 0.08 500
#mol color Type
#mol selection {all and y>-6 and y<6 and z>19}
#mol addrep top

mol representation vdw 0.7 500
mol color Type
mol selection {all and y<48 and not type 3}
mol addrep top

display	update

display height 4

#[atomselect top all] moveby {0 0 -7}

#rotate y by 1
#rotate x by 2

# Rendeing options
render Tachyon nanocube_ysmaller "/usr/local/lib/vmd/tachyon_LINUXAMD64" -fullshade -aasamples 12 %s -format TARGA -res 7680 4800 -o %s.tga
