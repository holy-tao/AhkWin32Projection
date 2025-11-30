#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class ENHANCED_METAFILE_RECORD_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_HEADER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYBEZIER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYGON => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYLINE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYBEZIERTO => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYLINETO => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYPOLYLINE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYPOLYGON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETWINDOWEXTEX => 9

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETWINDOWORGEX => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETVIEWPORTEXTEX => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETVIEWPORTORGEX => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETBRUSHORGEX => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_EOF => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETPIXELV => 15

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETMAPPERFLAGS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETMAPMODE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETBKMODE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETPOLYFILLMODE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETROP2 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETSTRETCHBLTMODE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETTEXTALIGN => 22

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETCOLORADJUSTMENT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETTEXTCOLOR => 24

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETBKCOLOR => 25

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_OFFSETCLIPRGN => 26

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_MOVETOEX => 27

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETMETARGN => 28

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_EXCLUDECLIPRECT => 29

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_INTERSECTCLIPRECT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SCALEVIEWPORTEXTEX => 31

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SCALEWINDOWEXTEX => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SAVEDC => 33

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RESTOREDC => 34

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETWORLDTRANSFORM => 35

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_MODIFYWORLDTRANSFORM => 36

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SELECTOBJECT => 37

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_CREATEPEN => 38

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_CREATEBRUSHINDIRECT => 39

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_DELETEOBJECT => 40

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_ANGLEARC => 41

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_ELLIPSE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RECTANGLE => 43

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_ROUNDRECT => 44

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_ARC => 45

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_CHORD => 46

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_PIE => 47

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SELECTPALETTE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_CREATEPALETTE => 49

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETPALETTEENTRIES => 50

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RESIZEPALETTE => 51

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_REALIZEPALETTE => 52

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_EXTFLOODFILL => 53

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_LINETO => 54

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_ARCTO => 55

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYDRAW => 56

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETARCDIRECTION => 57

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETMITERLIMIT => 58

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_BEGINPATH => 59

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_ENDPATH => 60

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_CLOSEFIGURE => 61

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_FILLPATH => 62

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_STROKEANDFILLPATH => 63

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_STROKEPATH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_FLATTENPATH => 65

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_WIDENPATH => 66

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SELECTCLIPPATH => 67

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_ABORTPATH => 68

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_GDICOMMENT => 70

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_FILLRGN => 71

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_FRAMERGN => 72

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_INVERTRGN => 73

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_PAINTRGN => 74

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_EXTSELECTCLIPRGN => 75

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_BITBLT => 76

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_STRETCHBLT => 77

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_MASKBLT => 78

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_PLGBLT => 79

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETDIBITSTODEVICE => 80

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_STRETCHDIBITS => 81

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_EXTCREATEFONTINDIRECTW => 82

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_EXTTEXTOUTA => 83

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_EXTTEXTOUTW => 84

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYBEZIER16 => 85

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYGON16 => 86

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYLINE16 => 87

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYBEZIERTO16 => 88

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYLINETO16 => 89

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYPOLYLINE16 => 90

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYPOLYGON16 => 91

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYDRAW16 => 92

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_CREATEMONOBRUSH => 93

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_CREATEDIBPATTERNBRUSHPT => 94

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_EXTCREATEPEN => 95

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYTEXTOUTA => 96

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_POLYTEXTOUTW => 97

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETICMMODE => 98

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_CREATECOLORSPACE => 99

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETCOLORSPACE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_DELETECOLORSPACE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_GLSRECORD => 102

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_GLSBOUNDEDRECORD => 103

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_PIXELFORMAT => 104

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RESERVED_105 => 105

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RESERVED_106 => 106

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RESERVED_107 => 107

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RESERVED_108 => 108

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RESERVED_109 => 109

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RESERVED_110 => 110

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_COLORCORRECTPALETTE => 111

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETICMPROFILEA => 112

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETICMPROFILEW => 113

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_ALPHABLEND => 114

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_SETLAYOUT => 115

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_TRANSPARENTBLT => 116

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RESERVED_117 => 117

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_GRADIENTFILL => 118

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RESERVED_119 => 119

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_RESERVED_120 => 120

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_COLORMATCHTOTARGETW => 121

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_CREATECOLORSPACEW => 122

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_MIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EMR_MAX => 122
}
