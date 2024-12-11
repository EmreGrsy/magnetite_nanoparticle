# change background color to green for better post-processing
color Display Background white
display Backgroundgradient off
axes location off

package require topotools
package require pbctools

topo readlammpsdata 001-dbt_2x2_33L_fa_tet_full_qeq.data

topo guessatom lammps data

# Explicitly define Carbon's color
color add item Name C gray
color Name C gray

# Explicitly define oxidated Fe ions color
color add item Name F iceblue
color Name F iceblue

display resetview

# Rotate for better visuals
rotate x by -90
rotate y by -45
rotate x by 9

# Delete default representation
mol delrep 0 top

# Cartoon display
material add Cartoon
material change ambient Cartoon 0.00
material change diffuse Cartoon 0.90
material change specular Cartoon 0.00
material change shininess Cartoon 0.00
material change mirror Cartoon 0.00
material change opacity Cartoon 1.00
material change outline Cartoon 4.00
material change outlinewidth Cartoon 0.35

# Trans1 display
material add Trans1
material change ambient Trans1 0.00
material change diffuse Trans1 0.75
material change specular Trans1 0.00
material change shininess Trans1 0.00
material change mirror Trans1 0.00
material change opacity Trans1 0.20
material change outline Trans1 0.10
material change outlinewidth Trans1 0.35

# Magnetite Slab
#mol representation vdw 0.5 1000
#mol color Charge
#mol material Cartoon
#mol selection {type 6 7 8 9 and z>10 and not index 247}
#mol addrep top

# Formate
#mol representation vdw 0.5 1000
#mol color Name
#mol material Cartoon
#mol selection {same fragment as index 488}
#mol addrep top

# Surface hydroxyl
#mol representation vdw 0.5 1000
#mol color Name
#mol material Cartoon
#mol selection {index 978 757}
#mol addrep top

# Oxidated Fe ion
mol representation vdw 0.5 1000
mol color Name
mol material Cartoon
mol selection {index 247}
mol addrep top

mol representation vdw 0.5 1000
mol color Charge
mol material Cartoon
mol selection {index 494}
mol addrep top

# Center the system
set sys [atomselect top all]
# Original displacment 0 0 -15
$sys moveby {0 0 -15}

# Display settings
display depthcue off
display cuemode Exp2
display cuestart 0.50
display cueend 10.00
display cuedensity 0.32
display eyesep 0.07
display focalLength 2.00
display height 1.5
display distance -2.00
display culling off
display fps off
display stereoswap off
display cachemode Off
display projection Orthographic
display shadows on
display ambientocclusion on
display aoambient 0.80
display aodirect 0.40

display update

# Rendering options
# --asamples 24 -res 7680 4800  
render Tachyon surface_fe_only "/usr/local/lib/vmd/tachyon_LINUXAMD64" -fullshade -trans_vmd -aasamples 24 %s -format TARGA -res 7680 4800 -o %s.tga

