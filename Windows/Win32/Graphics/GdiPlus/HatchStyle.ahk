#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class HatchStyle extends Win32Enum {

    /**
     * Native name: HatchStyleHorizontal
     * @type {Integer (Int32)}
     */
    static Horizontal => 0

    /**
     * Native name: HatchStyleVertical
     * @type {Integer (Int32)}
     */
    static Vertical => 1

    /**
     * Native name: HatchStyleForwardDiagonal
     * @type {Integer (Int32)}
     */
    static ForwardDiagonal => 2

    /**
     * Native name: HatchStyleBackwardDiagonal
     * @type {Integer (Int32)}
     */
    static BackwardDiagonal => 3

    /**
     * Native name: HatchStyleCross
     * @type {Integer (Int32)}
     */
    static Cross => 4

    /**
     * Native name: HatchStyleDiagonalCross
     * @type {Integer (Int32)}
     */
    static DiagonalCross => 5

    /**
     * Native name: HatchStyle05Percent
     * @type {Integer (Int32)}
     */
    static Style05Percent => 6

    /**
     * Native name: HatchStyle10Percent
     * @type {Integer (Int32)}
     */
    static Style10Percent => 7

    /**
     * Native name: HatchStyle20Percent
     * @type {Integer (Int32)}
     */
    static Style20Percent => 8

    /**
     * Native name: HatchStyle25Percent
     * @type {Integer (Int32)}
     */
    static Style25Percent => 9

    /**
     * Native name: HatchStyle30Percent
     * @type {Integer (Int32)}
     */
    static Style30Percent => 10

    /**
     * Native name: HatchStyle40Percent
     * @type {Integer (Int32)}
     */
    static Style40Percent => 11

    /**
     * Native name: HatchStyle50Percent
     * @type {Integer (Int32)}
     */
    static Style50Percent => 12

    /**
     * Native name: HatchStyle60Percent
     * @type {Integer (Int32)}
     */
    static Style60Percent => 13

    /**
     * Native name: HatchStyle70Percent
     * @type {Integer (Int32)}
     */
    static Style70Percent => 14

    /**
     * Native name: HatchStyle75Percent
     * @type {Integer (Int32)}
     */
    static Style75Percent => 15

    /**
     * Native name: HatchStyle80Percent
     * @type {Integer (Int32)}
     */
    static Style80Percent => 16

    /**
     * Native name: HatchStyle90Percent
     * @type {Integer (Int32)}
     */
    static Style90Percent => 17

    /**
     * Native name: HatchStyleLightDownwardDiagonal
     * @type {Integer (Int32)}
     */
    static LightDownwardDiagonal => 18

    /**
     * Native name: HatchStyleLightUpwardDiagonal
     * @type {Integer (Int32)}
     */
    static LightUpwardDiagonal => 19

    /**
     * Native name: HatchStyleDarkDownwardDiagonal
     * @type {Integer (Int32)}
     */
    static DarkDownwardDiagonal => 20

    /**
     * Native name: HatchStyleDarkUpwardDiagonal
     * @type {Integer (Int32)}
     */
    static DarkUpwardDiagonal => 21

    /**
     * Native name: HatchStyleWideDownwardDiagonal
     * @type {Integer (Int32)}
     */
    static WideDownwardDiagonal => 22

    /**
     * Native name: HatchStyleWideUpwardDiagonal
     * @type {Integer (Int32)}
     */
    static WideUpwardDiagonal => 23

    /**
     * Native name: HatchStyleLightVertical
     * @type {Integer (Int32)}
     */
    static LightVertical => 24

    /**
     * Native name: HatchStyleLightHorizontal
     * @type {Integer (Int32)}
     */
    static LightHorizontal => 25

    /**
     * Native name: HatchStyleNarrowVertical
     * @type {Integer (Int32)}
     */
    static NarrowVertical => 26

    /**
     * Native name: HatchStyleNarrowHorizontal
     * @type {Integer (Int32)}
     */
    static NarrowHorizontal => 27

    /**
     * Native name: HatchStyleDarkVertical
     * @type {Integer (Int32)}
     */
    static DarkVertical => 28

    /**
     * Native name: HatchStyleDarkHorizontal
     * @type {Integer (Int32)}
     */
    static DarkHorizontal => 29

    /**
     * Native name: HatchStyleDashedDownwardDiagonal
     * @type {Integer (Int32)}
     */
    static DashedDownwardDiagonal => 30

    /**
     * Native name: HatchStyleDashedUpwardDiagonal
     * @type {Integer (Int32)}
     */
    static DashedUpwardDiagonal => 31

    /**
     * Native name: HatchStyleDashedHorizontal
     * @type {Integer (Int32)}
     */
    static DashedHorizontal => 32

    /**
     * Native name: HatchStyleDashedVertical
     * @type {Integer (Int32)}
     */
    static DashedVertical => 33

    /**
     * Native name: HatchStyleSmallConfetti
     * @type {Integer (Int32)}
     */
    static SmallConfetti => 34

    /**
     * Native name: HatchStyleLargeConfetti
     * @type {Integer (Int32)}
     */
    static LargeConfetti => 35

    /**
     * Native name: HatchStyleZigZag
     * @type {Integer (Int32)}
     */
    static ZigZag => 36

    /**
     * Native name: HatchStyleWave
     * @type {Integer (Int32)}
     */
    static Wave => 37

    /**
     * Native name: HatchStyleDiagonalBrick
     * @type {Integer (Int32)}
     */
    static DiagonalBrick => 38

    /**
     * Native name: HatchStyleHorizontalBrick
     * @type {Integer (Int32)}
     */
    static HorizontalBrick => 39

    /**
     * Native name: HatchStyleWeave
     * @type {Integer (Int32)}
     */
    static Weave => 40

    /**
     * Native name: HatchStylePlaid
     * @type {Integer (Int32)}
     */
    static Plaid => 41

    /**
     * Native name: HatchStyleDivot
     * @type {Integer (Int32)}
     */
    static Divot => 42

    /**
     * Native name: HatchStyleDottedGrid
     * @type {Integer (Int32)}
     */
    static DottedGrid => 43

    /**
     * Native name: HatchStyleDottedDiamond
     * @type {Integer (Int32)}
     */
    static DottedDiamond => 44

    /**
     * Native name: HatchStyleShingle
     * @type {Integer (Int32)}
     */
    static Shingle => 45

    /**
     * Native name: HatchStyleTrellis
     * @type {Integer (Int32)}
     */
    static Trellis => 46

    /**
     * Native name: HatchStyleSphere
     * @type {Integer (Int32)}
     */
    static Sphere => 47

    /**
     * Native name: HatchStyleSmallGrid
     * @type {Integer (Int32)}
     */
    static SmallGrid => 48

    /**
     * Native name: HatchStyleSmallCheckerBoard
     * @type {Integer (Int32)}
     */
    static SmallCheckerBoard => 49

    /**
     * Native name: HatchStyleLargeCheckerBoard
     * @type {Integer (Int32)}
     */
    static LargeCheckerBoard => 50

    /**
     * Native name: HatchStyleOutlinedDiamond
     * @type {Integer (Int32)}
     */
    static OutlinedDiamond => 51

    /**
     * Native name: HatchStyleSolidDiamond
     * @type {Integer (Int32)}
     */
    static SolidDiamond => 52

    /**
     * Native name: HatchStyleTotal
     * @type {Integer (Int32)}
     */
    static Total => 53

    /**
     * Native name: HatchStyleLargeGrid
     * @type {Integer (Int32)}
     */
    static LargeGrid => 4

    /**
     * Native name: HatchStyleMin
     * @type {Integer (Int32)}
     */
    static Min => 0

    /**
     * Native name: HatchStyleMax
     * @type {Integer (Int32)}
     */
    static Max => 52
}
