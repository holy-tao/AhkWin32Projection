#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The HatchStyle enumeration specifies the hatch pattern used by a brush of type HatchBrush. The hatch pattern consists of a solid background color and lines drawn over the background.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-hatchstyle
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class HatchStyle extends Win32Enum{

    /**
     * Specifies horizontal lines. 
     * 				
     * 
     * 
     * 
     * <img alt="Illustration of an ellipse filled with widely spaced horizontal lines over a background color" src="./images/hatchstylehorizontal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleHorizontal => 0

    /**
     * Specifies vertical lines. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with widely spaced vertical lines over a background color" src="./images/hatchstylevertical.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleVertical => 1

    /**
     * Specifies diagonal lines that slant to the right from top points to bottom points. The lines are antialiased. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with slanting lines over a background color" src="./images/hatchstyleforwarddiagonal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleForwardDiagonal => 2

    /**
     * Specifies diagonal lines that slant to the left from top points to bottom points. The lines are antialiased. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with slanting lines over a background color" src="./images/hatchstylebackwarddiagonal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleBackwardDiagonal => 3

    /**
     * Specifies horizontal and vertical lines that cross at 90-degree angles. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a grid of horizontal and vertical lines over a background color" src="./images/hatchstylecross.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleCross => 4

    /**
     * Specifies forward diagonal and backward diagonal lines that cross at 90-degree angles. The lines are antialiased. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a grid of diagonal lines over a background color" src="./images/hatchstylediagonalcross.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDiagonalCross => 5

    /**
     * Specifies a 5-percent hatch. The ratio of foreground color to background color is 5:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with sparse, evenly spaced dots over a background color" src="./images/hatchstyle05percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle05Percent => 6

    /**
     * Specifies a 10-percent hatch. The ratio of foreground color to background color is 10:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with evenly spaced dots over a background color" src="./images/hatchstyle10percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle10Percent => 7

    /**
     * Specifies a 20-percent hatch. The ratio of foreground color to background color is 20:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with dense, evenly spaced dots over a background color" src="./images/hatchstyle20percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle20Percent => 8

    /**
     * Specifies a 25-percent hatch. The ratio of foreground color to background color is 25:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with very dense, evenly spaced dots over a background color" src="./images/hatchstyle25percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle25Percent => 9

    /**
     * Specifies a 30-percent hatch. The ratio of foreground color to background color is 30:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a dense, diagonal dot grid over a background color" src="./images/hatchstyle30percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle30Percent => 10

    /**
     * Specifies a 40-percent hatch. The ratio of foreground color to background color is 40:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with tiny checkerboard with cutouts shaped like plus signs, over a background color" src="./images/hatchstyle40percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle40Percent => 11

    /**
     * Specifies a 50-percent hatch. The ratio of foreground color to background color is 50:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a tiny checkerboard over a background color" src="./images/hatchstyle50percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle50Percent => 12

    /**
     * Specifies a 60-percent hatch. The ratio of foreground color to background color is 60:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a diagonal grid of plus-signs over a background color" src="./images/hatchstyle60percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle60Percent => 13

    /**
     * Specifies a 70-percent hatch. The ratio of foreground color to background color is 70:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a dense, diagonal dot grid over a background color" src="./images/hatchstyle70percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle70Percent => 14

    /**
     * Specifies a 75-percent hatch. The ratio of foreground color to background color is 75:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a wide, diagonal grid over a background color" src="./images/hatchstyle75percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle75Percent => 15

    /**
     * Specifies an 80-percent hatch. The ratio of foreground color to background color is 80:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a wider, diagonal grid over a background color" src="./images/hatchstyle80percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle80Percent => 16

    /**
     * Specifies a 90-percent hatch. The ratio of foreground color to background color is 90:100. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with the widest, diagonal grid over a background color" src="./images/hatchstyle90percent.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyle90Percent => 17

    /**
     * Specifies diagonal lines that slant to the right from top points to bottom points and are spaced 50 percent closer together than HatchStyleForwardDiagonal but are not antialiased. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with slanting lines over a background color" src="./images/hatchstylelightdownwarddiagonal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleLightDownwardDiagonal => 18

    /**
     * Specifies diagonal lines that slant to the left from top points to bottom points and are spaced 50 percent closer together than HatchStyleBackwardDiagonal but are not antialiased. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with slanting lines over a background color " src="./images/hatchstylelightupwarddiagonal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleLightUpwardDiagonal => 19

    /**
     * Specifies diagonal lines that slant to the right from top points to bottom points, are spaced 50 percent closer together than HatchStyleForwardDiagonal, and are twice the width of HatchStyleForwardDiagonal but are not antialiased. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with wide, slanting lines over a background color " src="./images/hatchstyledarkdownwarddiagonal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDarkDownwardDiagonal => 20

    /**
     * Specifies diagonal lines that slant to the left from top points to bottom points, are spaced 50 percent closer together than HatchStyleBackwardDiagonal, and are twice the width of HatchStyleBackwardDiagonal but are not antialiased. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with wide, slanting lines over a background color" src="./images/hatchstyledarkupwarddiagonal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDarkUpwardDiagonal => 21

    /**
     * Specifies diagonal lines that slant to the right from top points to bottom points, have the same spacing as HatchStyleForwardDiagonal, and are triple the width of HatchStyleForwardDiagonal but are not antialiased. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with wide, widely-spaced, slanting lines over a background color" src="./images/hatchstylewidedownwarddiagonal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleWideDownwardDiagonal => 22

    /**
     * Specifies diagonal lines that slant to the left from top points to bottom points, have the same spacing as HatchStyleBackwardDiagonal, and are triple the width of HatchStyleBackwardDiagonal but are not antialiased. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with widely-spaced, wide, slanting lines over a background color " src="./images/hatchstylewideupwarddiagonal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleWideUpwardDiagonal => 23

    /**
     * Specifies vertical lines that are spaced 50 percent closer together than HatchStyleVertical. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with vertical lines over a background color " src="./images/hatchstylelightvertical.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleLightVertical => 24

    /**
     * Specifies horizontal lines that are spaced 50 percent closer together than HatchStyleHorizontal. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with horizontal lines over a background color " src="./images/hatchstylelighthorizontal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleLightHorizontal => 25

    /**
     * Specifies vertical lines that are spaced 75 percent closer together than HatchStyleVertical (or 25 percent closer together than HatchStyleLightVertical). 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with densely-spaced, vertical lines over a background color " src="./images/hatchstylenarrowvertical.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleNarrowVertical => 26

    /**
     * Specifies horizontal lines that are spaced 75 percent closer together than HatchStyleHorizontal ( or 25 percent closer together than HatchStyleLightHorizontal). 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with densely-spaced, horizontal lines over a background color " src="./images/hatchstylenarrowhorizontal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleNarrowHorizontal => 27

    /**
     * Specifies vertical lines that are spaced 50 percent closer together than HatchStyleVerical and are twice the width of HatchStyleVertical. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with wide vertical lines over a background color " src="./images/hatchstyledarkvertical.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDarkVertical => 28

    /**
     * Specifies horizontal lines that are spaced 50 percent closer together than HatchStyleHorizontal and are twice the width of HatchStyleHorizontal. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with wide horizontal lines over a background color " src="./images/hatchstyledarkhorizontal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDarkHorizontal => 29

    /**
     * Specifies horizontal lines that are composed of forward diagonals. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with rows of slash characters over a background color " src="./images/hatchstyledasheddownwarddiagonal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDashedDownwardDiagonal => 30

    /**
     * Specifies horizontal lines that are composed of backward diagonals. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with rows of backslash characters over a background color " src="./images/hatchstyledashedupwarddiagonal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDashedUpwardDiagonal => 31

    /**
     * Specifies horizontal dashed lines. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with dashed horizontal lines over a background color " src="./images/hatchstyledashedhorizontal.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDashedHorizontal => 32

    /**
     * Specifies vertical dashed lines. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with dashed vertical lines over a background color " src="./images/hatchstyledashedvertical.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDashedVertical => 33

    /**
     * Specifies a hatch that has the appearance of confetti. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with dots that form horizontal zig-zag lines, over a background color " src="./images/hatchstylesmallconfetti.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleSmallConfetti => 34

    /**
     * Specifies a hatch that has the appearance of confetti composed of larger pieces than HatchStyleSmallConfetti. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with wider dots in an irregular but repeating pattern, over a background color " src="./images/hatchstylelargeconfetti.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleLargeConfetti => 35

    /**
     * Specifies horizontal lines of zigzags. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with horizontal zig-zag lines over a background color " src="./images/hatchstylezigzag.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleZigZag => 36

    /**
     * Specifies horizontal lines of tildes. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with lines of tilde characters over a background color " src="./images/hatchstylewave.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleWave => 37

    /**
     * Specifies a hatch that has the appearance of a wall of bricks laid in a backward diagonal direction. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a diagonal brick pattern over a background color " src="./images/hatchstylediagonalbrick.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDiagonalBrick => 38

    /**
     * Specifies a hatch that has the appearance of a wall of bricks laid horizontally. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a horizontal brick pattern over a background color " src="./images/hatchstylehorizontalbrick.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleHorizontalBrick => 39

    /**
     * Specifies a hatch that has the appearance of a woven material. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a diagonal weave pattern over a background color " src="./images/hatchstyleweave.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleWeave => 40

    /**
     * Specifies a hatch that has the appearance of a plaid material. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with an open grid of opaque half-toned horizontal lines over opaque solid vertical lines, over a background color " src="./images/hatchstyleplaid.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStylePlaid => 41

    /**
     * Specifies a hatch that has the appearance of divots. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with alternating rows of greater-than and less-than symbols, over a background color" src="./images/hatchstyledivot.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDivot => 42

    /**
     * Specifies horizontal and vertical dotted lines that cross at 90-degree angles. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a grid of dotted lines over a background color " src="./images/hatchstyledottedgrid.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDottedGrid => 43

    /**
     * Specifies forward diagonal and backward diagonal dotted lines that cross at 90-degree angles. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a grid of slanting dotted lines over a background color " src="./images/hatchstyledotteddiamond.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleDottedDiamond => 44

    /**
     * Specifies a hatch that has the appearance of shingles laid in a forward diagonal direction. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a diagonal shingle pattern over a background color " src="./images/hatchstyleshingle.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleShingle => 45

    /**
     * Specifies a hatch that has the appearance of a trellis. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a grid of wide, slanting lines over a background color " src="./images/hatchstyletrellis.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleTrellis => 46

    /**
     * Specifies a hatch that has the appearance of a checkerboard of spheres. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a checkerboard of spheres over a background color " src="./images/hatchstylesphere.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleSphere => 47

    /**
     * Specifies horizontal and vertical lines that cross at 90-degree angles and are spaced 50 percent closer together than HatchStyleCross. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a small grid of lines over a background color " src="./images/hatchstylesmallgrid.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleSmallGrid => 48

    /**
     * Specifies a hatch that has the appearance of a checkerboard. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a small checkerboard pattern over a background color " src="./images/hatchstylesmallcheckerboard.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleSmallCheckerBoard => 49

    /**
     * Specifies a hatch that has the appearance of a checkerboard with squares that are twice the size of HatchStyleSmallCheckerBoard. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a wide checkerboard pattern over a background color " src="./images/hatchstylelargecheckerboard.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleLargeCheckerBoard => 50

    /**
     * Specifies forward diagonal and backward diagonal lines that cross at 90-degree angles but are not antialiased. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a small grid of slanting lines over a background color " src="./images/hatchstyleoutlineddiamond.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleOutlinedDiamond => 51

    /**
     * Specifies a hatch that has the appearance of a checkerboard placed diagonally. 
     * 				
     * 
     * <img alt="Illustration of an ellipse filled with a large, diagonal checkerboard pattern over a background color " src="./images/hatchstylesoliddiamond.png"/>
     * @type {Integer (Int32)}
     */
    static HatchStyleSolidDiamond => 52

    /**
     * Specifies no hatch thereby allowing the brush to be transparent.
     * @type {Integer (Int32)}
     */
    static HatchStyleTotal => 53

    /**
     * Specifies HatchStyleCross.
     * @type {Integer (Int32)}
     */
    static HatchStyleLargeGrid => 4

    /**
     * Specifies HatchStyleHorizonal.
     * @type {Integer (Int32)}
     */
    static HatchStyleMin => 0

    /**
     * Specifies HatchStyleSolidDiamond.
     * @type {Integer (Int32)}
     */
    static HatchStyleMax => 52
}
