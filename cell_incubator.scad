insulation_thickness = 50;
cover_width = 100;
cover_depth = 100;
cover_height = 120;
wall_thickness = 6;
slide_overlap_height = 25;
slide_overlap_thickness = wall_thickness / 2;


module cover_outershell () {
    translate([0, 0, 0]) { 
        difference() {
            outershell_width = cover_width + insulation_thickness;
            outershell_depth = cover_depth + insulation_thickness;
            outershell_height = cover_height + insulation_thickness;
            cube([outershell_width, outershell_depth, outershell_height]);
            
            // subtract the inner part to create hollow space and walls
            translate([wall_thickness, wall_thickness, 0]) {
                cube([outershell_width - 2 * wall_thickness, outershell_depth - 2 * wall_thickness, outershell_height - wall_thickness]);
                
            // subctract slide overlap
            }            
        }
    }
}


module cover_innershell () {
    translate([insulation_thickness / 2, insulation_thickness / 2, insulation_thickness / 2]) { 
        difference() {
            cube([cover_width, cover_depth, cover_depth]);
            
            // subtract the inner part to create hollow space and walls
            translate([wall_thickness, wall_thickness, 0]) {
                cube([cover_width - 2 * wall_thickness, cover_depth - 2 * wall_thickness, cover_depth - wall_thickness]);
            }            
        }
    }
}

module bottom_outerplatoform () {
    translate([0, 0, 0]) {
        difference() {
            outerplatform_width = cover_width + insulation_thickness;
            outerplatform_depth = cover_depth + insulation_thickness;
            outerplatform_height = slide_overlap_height * 2 + wall_thickness;
            cube([outerplatform_width, outerplatform_depth, outerplatform_height]);
            
            translate([wall_thickness, wall_thickness, wall_thickness]) {
                cube([outerplatform_width - 2 * wall_thickness, outerplatform_depth - 2 * wall_thickness, outerplatform_height]);
            }
            
            translate([wall_thickness - slide_overlap_thickness, wall_thickness - slide_overlap_thickness, outerplatform_height - slide_overlap_height - wall_thickness]) {
                cube([outerplatform_width - 2 * slide_overlap_thickness, outerplatform_depth - 2 * slide_overlap_thickness, slide_overlap_height + wall_thickness]);
            }
 
        }
        
        // subtract the inner part to create hollow space and walls
    }
}

module bottom_innerplatform () {
    translate([slide_overlap_thickness, slide_overlap_thickness, slide_overlap_height]) {
        outerplatform_width = cover_width + insulation_thickness;
        outerplatform_depth = cover_depth + insulation_thickness;
        outerplatform_height = slide_overlap_height * 2 + wall_thickness;
        difference() {
            cube([outerplatform_width - wallthickness, outerplatform_height - wallthickness, wallthickness]);
        } 
    }
}

cover_outershell ();
cover_innershell ();
// bottom_outerplatoform();
