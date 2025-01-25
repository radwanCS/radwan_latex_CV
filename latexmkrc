$pdflatex = 'pdflatex %O -shell-escape %S';
$pdf_mode = 1;
$pdf_previewer = 'start evince';

$ENV{'TEXINPUTS'}='.//:' . $ENV{'TEXINPUTS'};

# Template metadata
$ENV{'METADATA'} = qq(
Title: Academic CV Template
Author: Dubasi Pavan Kumar
Description: A comprehensive LaTeX template for creating professional academic CVs. This template includes customizable sections for personal information, education, research experience, publications, awards, and more. It features a clean, organized layout suitable for various academic disciplines, with options for different fonts and color schemes. Ideal for graduate students, postdoctoral researchers, and faculty members looking to showcase their scholarly achievements.
Tags: CV, academic, resume, LaTeX, curriculum vitae, research, publications, graduate school, postdoc, faculty
Version: 1.0
Last Updated: 2023-08-12
License: Creative Commons CC BY 4.0
);

use File::Copy;
use Time::Piece;

END {
    my $source_file = 'main.pdf';
    my $iso_datetime = localtime->strftime('%Y-%m-%d');
    my $optional_prefix = 'RadwanCV';
    my $optional_suffix = '';

    my ($filename, $extension) = $source_file =~ /^(.+)\.(\w+)$/;
    my @name_parts = ($optional_prefix, $iso_datetime, $optional_suffix);
    my @filtered_array = grep { defined && /\S/ } @name_parts;
    my $new_filename = join("_", @filtered_array) . ".$extension";

    if (copy($source_file, $new_filename)) {
        print "File renamed successfully to: $new_filename\n";
    } else {
        print "Failed to rename the file: $!\n";
    }

}