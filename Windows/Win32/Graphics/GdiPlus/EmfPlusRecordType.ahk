#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The EmfPlusRecordType enumeration identifies metafile record types used in Windows Metafile Format (WMF), Enhanced Metafile (EMF), and EMF+ files. The elements of the EmfPlusRecordType enumeration come in three groups.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-emfplusrecordtype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EmfPlusRecordType extends Win32Enum{

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetBkColor => 66049

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetBkMode => 65794

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetMapMode => 65795

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetROP2 => 65796

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetRelAbs => 65797

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetPolyFillMode => 65798

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetStretchBltMode => 65799

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetTextCharExtra => 65800

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetTextColor => 66057

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetTextJustification => 66058

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetWindowOrg => 66059

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetWindowExt => 66060

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetViewportOrg => 66061

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetViewportExt => 66062

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeOffsetWindowOrg => 66063

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeScaleWindowExt => 66576

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeOffsetViewportOrg => 66065

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeScaleViewportExt => 66578

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeLineTo => 66067

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeMoveTo => 66068

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeExcludeClipRect => 66581

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeIntersectClipRect => 66582

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeArc => 67607

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeEllipse => 66584

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeFloodFill => 66585

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePie => 67610

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeRectangle => 66587

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeRoundRect => 67100

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePatBlt => 67101

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSaveDC => 65566

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetPixel => 66591

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeOffsetClipRgn => 66080

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeTextOut => 66849

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeBitBlt => 67874

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeStretchBlt => 68387

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePolygon => 66340

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePolyline => 66341

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeEscape => 67110

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeRestoreDC => 65831

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeFillRegion => 66088

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeFrameRegion => 66601

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeInvertRegion => 65834

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePaintRegion => 65835

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSelectClipRegion => 65836

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSelectObject => 65837

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetTextAlign => 65838

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeDrawText => 67119

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeChord => 67632

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetMapperFlags => 66097

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeExtTextOut => 68146

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetDIBToDev => 68915

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSelectPalette => 66100

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeRealizePalette => 65589

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeAnimatePalette => 66614

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetPalEntries => 65591

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePolyPolygon => 66872

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeResizePalette => 65849

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeDIBBitBlt => 67904

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeDIBStretchBlt => 68417

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeDIBCreatePatternBrush => 65858

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeStretchDIB => 69443

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeExtFloodFill => 66888

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetLayout => 65865

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeResetDC => 65868

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeStartDoc => 65869

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeStartPage => 65615

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeEndPage => 65616

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeAbortDoc => 65618

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeEndDoc => 65630

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeDeleteObject => 66032

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreatePalette => 65783

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateBrush => 65784

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreatePatternBrush => 66041

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreatePenIndirect => 66298

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateFontIndirect => 66299

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateBrushIndirect => 66300

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateBitmapIndirect => 66301

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateBitmap => 67326

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateRegion => 67327

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeHeader => 1

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyBezier => 2

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolygon => 3

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyline => 4

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyBezierTo => 5

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyLineTo => 6

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyPolyline => 7

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyPolygon => 8

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetWindowExtEx => 9

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetWindowOrgEx => 10

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetViewportExtEx => 11

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetViewportOrgEx => 12

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetBrushOrgEx => 13

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeEOF => 14

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetPixelV => 15

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetMapperFlags => 16

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetMapMode => 17

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetBkMode => 18

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetPolyFillMode => 19

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetROP2 => 20

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetStretchBltMode => 21

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetTextAlign => 22

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetColorAdjustment => 23

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetTextColor => 24

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetBkColor => 25

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeOffsetClipRgn => 26

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeMoveToEx => 27

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetMetaRgn => 28

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExcludeClipRect => 29

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeIntersectClipRect => 30

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeScaleViewportExtEx => 31

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeScaleWindowExtEx => 32

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSaveDC => 33

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeRestoreDC => 34

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetWorldTransform => 35

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeModifyWorldTransform => 36

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSelectObject => 37

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreatePen => 38

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreateBrushIndirect => 39

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeDeleteObject => 40

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeAngleArc => 41

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeEllipse => 42

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeRectangle => 43

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeRoundRect => 44

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeArc => 45

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeChord => 46

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePie => 47

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSelectPalette => 48

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreatePalette => 49

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetPaletteEntries => 50

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeResizePalette => 51

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeRealizePalette => 52

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtFloodFill => 53

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeLineTo => 54

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeArcTo => 55

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyDraw => 56

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetArcDirection => 57

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetMiterLimit => 58

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeBeginPath => 59

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeEndPath => 60

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCloseFigure => 61

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeFillPath => 62

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeStrokeAndFillPath => 63

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeStrokePath => 64

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeFlattenPath => 65

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeWidenPath => 66

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSelectClipPath => 67

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeAbortPath => 68

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeReserved_069 => 69

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeGdiComment => 70

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeFillRgn => 71

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeFrameRgn => 72

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeInvertRgn => 73

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePaintRgn => 74

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtSelectClipRgn => 75

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeBitBlt => 76

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeStretchBlt => 77

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeMaskBlt => 78

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePlgBlt => 79

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetDIBitsToDevice => 80

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeStretchDIBits => 81

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtCreateFontIndirect => 82

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtTextOutA => 83

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtTextOutW => 84

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyBezier16 => 85

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolygon16 => 86

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyline16 => 87

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyBezierTo16 => 88

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolylineTo16 => 89

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyPolyline16 => 90

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyPolygon16 => 91

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyDraw16 => 92

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreateMonoBrush => 93

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreateDIBPatternBrushPt => 94

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtCreatePen => 95

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyTextOutA => 96

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyTextOutW => 97

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetICMMode => 98

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreateColorSpace => 99

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetColorSpace => 100

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeDeleteColorSpace => 101

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeGLSRecord => 102

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeGLSBoundedRecord => 103

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePixelFormat => 104

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeDrawEscape => 105

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtEscape => 106

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeStartDoc => 107

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSmallTextOut => 108

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeForceUFIMapping => 109

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeNamedEscape => 110

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeColorCorrectPalette => 111

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetICMProfileA => 112

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetICMProfileW => 113

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeAlphaBlend => 114

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetLayout => 115

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeTransparentBlt => 116

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeReserved_117 => 117

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeGradientFill => 118

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetLinkedUFIs => 119

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetTextJustification => 120

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeColorMatchToTargetW => 121

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreateColorSpaceW => 122

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeMax => 122

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeMin => 1

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeInvalid => 16384

    /**
     * Identifies a record that is the EMF+ header.
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeHeader => 16385

    /**
     * Identifies a record that marks the last EMF+ record of a metafile.
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeEndOfFile => 16386

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-addmetafilecomment">Graphics::AddMetafileComment</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeComment => 16387

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-gethdc">Graphics::GetHDC</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeGetDC => 16388

    /**
     * Identifies the start of a multiple-format block.
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMultiFormatStart => 16389

    /**
     * Identifies a section in a multiple-format block. Multiple-format records allow the same set of records to be represented in several formats.
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMultiFormatSection => 16390

    /**
     * Identifies the end of a multiple-format block.
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMultiFormatEnd => 16391

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeObject => 16392

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-clear">Graphics::Clear</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeClear => 16393

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-fillrectangles(inconstbrush_inconstrect_inint)">FillRectangles Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillRects => 16394

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawrectangles(inconstpen_inconstrect_inint)">DrawRectangles Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawRects => 16395

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-fillpolygon(inconstbrush_inconstpointf_inint_infillmode)">FillPolygon Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillPolygon => 16396

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawlines(inconstpen_inconstpoint_inint)">DrawLines Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawLines => 16397

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-fillellipse(inconstbrush_inconstrect_)">FillEllipse Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillEllipse => 16398

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawellipse(inconstpen_inconstrect_)">DrawEllipse Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawEllipse => 16399

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-fillpie(inconstbrush_inconstrect__inreal_inreal)">FillPie Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillPie => 16400

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawpie(inconstpen_inconstrect__inreal_inreal)">DrawPie Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawPie => 16401

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawarc(inconstpen_inconstrectf__inreal_inreal)">DrawArc Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawArc => 16402

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-fillregion">Graphics::FillRegion</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillRegion => 16403

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-fillpath">Graphics::FillPath</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillPath => 16404

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawpath">Graphics::DrawPath</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawPath => 16405

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-fillclosedcurve(inconstbrush_inconstpointf_inint_infillmode_inreal)">FillClosedCurve Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillClosedCurve => 16406

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawclosedcurve(inconstpen_inconstpointf_inint_inreal)">DrawClosedCurve Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawClosedCurve => 16407

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawcurve(inconstpen_inconstpointf_inint_inint_inint_inreal)">DrawCurve Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawCurve => 16408

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawbeziers(inconstpen_inconstpoint_inint)">DrawBeziers Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawBeziers => 16409

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawimage(inimage_inconstpointf_inint)">DrawImage Methods</a> (all methods that do not receive an array of destination points)
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawImage => 16410

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawimage(inimage_inconstpointf_inint)">DrawImage Methods</a> (all methods that receive an array of destination points)
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawImagePoints => 16411

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawstring(constwchar_int_constfont_constpointf__constbrush)">DrawString Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawString => 16412

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-setrenderingorigin">Graphics::SetRenderingOrigin</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetRenderingOrigin => 16413

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-setsmoothingmode">Graphics::SetSmoothingMode</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetAntiAliasMode => 16414

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-settextrenderinghint">Graphics::SetTextRenderingHint</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetTextRenderingHint => 16415

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-settextcontrast">Graphics::SetTextContrast</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetTextContrast => 16416

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-setinterpolationmode">Graphics::SetInterpolationMode</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetInterpolationMode => 16417

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-setpixeloffsetmode">Graphics::SetPixelOffsetMode</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetPixelOffsetMode => 16418

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-setcompositingmode">Graphics::SetCompositingMode</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetCompositingMode => 16419

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-setcompositingquality">Graphics::SetCompositingQuality</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetCompositingQuality => 16420

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-save">Graphics::Save</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSave => 16421

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-restore">Graphics::Restore</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeRestore => 16422

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-begincontainer(inconstrect__inconstrect__inunit)">Graphics::BeginContainer</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeBeginContainer => 16423

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-begincontainer(inconstrect__inconstrect__inunit)">Graphics::BeginContainer</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeBeginContainerNoParams => 16424

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-endcontainer">Graphics::EndContainer</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeEndContainer => 16425

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-settransform">Graphics::SetTransform</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetWorldTransform => 16426

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-resettransform">Graphics::ResetTransform</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeResetWorldTransform => 16427

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-multiplytransform">Graphics::MultiplyTransform</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMultiplyWorldTransform => 16428

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-translatetransform">Graphics::TranslateTransform</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeTranslateWorldTransform => 16429

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-scaletransform">Graphics::ScaleTransform</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeScaleWorldTransform => 16430

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-rotatetransform">Graphics::RotateTransform</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeRotateWorldTransform => 16431

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-setpagescale">Graphics::SetPageScale</a> and <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-setpageunit">Graphics::SetPageUnit</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetPageTransform => 16432

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-resetclip">Graphics::ResetClip</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeResetClip => 16433

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-setclip(inconstrect__incombinemode)">Graphics::SetClip</a> and <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-setclip(inconstrectf__incombinemode)">Graphics::SetClip</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetClipRect => 16434

    /**
     * <a href="https://docs.microsoft.com/previous-versions/ms535824(v=vs.85)">Graphics::SetClip</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetClipPath => 16435

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-setclip(inhrgn_incombinemode)">Graphics::SetClip</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetClipRegion => 16436

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-translateclip(inint_inint)">TranslateClip Methods</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeOffsetClip => 16437

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawdriverstring">Graphics::DrawDriverString</a>
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawDriverString => 16438

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeStrokeFillPath => 16439

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSerializableObject => 16440

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetTSGraphics => 16441

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetTSClip => 16442

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTotal => 16443

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMax => 16442

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMin => 16385
}
