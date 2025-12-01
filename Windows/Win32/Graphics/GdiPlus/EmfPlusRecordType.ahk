#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EmfPlusRecordType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetBkColor => 66049

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetBkMode => 65794

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetMapMode => 65795

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetROP2 => 65796

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetRelAbs => 65797

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetPolyFillMode => 65798

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetStretchBltMode => 65799

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetTextCharExtra => 65800

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetTextColor => 66057

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetTextJustification => 66058

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetWindowOrg => 66059

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetWindowExt => 66060

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetViewportOrg => 66061

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetViewportExt => 66062

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeOffsetWindowOrg => 66063

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeScaleWindowExt => 66576

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeOffsetViewportOrg => 66065

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeScaleViewportExt => 66578

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeLineTo => 66067

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeMoveTo => 66068

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeExcludeClipRect => 66581

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeIntersectClipRect => 66582

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeArc => 67607

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeEllipse => 66584

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeFloodFill => 66585

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePie => 67610

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeRectangle => 66587

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeRoundRect => 67100

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePatBlt => 67101

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSaveDC => 65566

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetPixel => 66591

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeOffsetClipRgn => 66080

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeTextOut => 66849

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeBitBlt => 67874

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeStretchBlt => 68387

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePolygon => 66340

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePolyline => 66341

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeEscape => 67110

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeRestoreDC => 65831

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeFillRegion => 66088

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeFrameRegion => 66601

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeInvertRegion => 65834

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePaintRegion => 65835

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSelectClipRegion => 65836

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSelectObject => 65837

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetTextAlign => 65838

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeDrawText => 67119

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeChord => 67632

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetMapperFlags => 66097

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeExtTextOut => 68146

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetDIBToDev => 68915

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSelectPalette => 66100

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeRealizePalette => 65589

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeAnimatePalette => 66614

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetPalEntries => 65591

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypePolyPolygon => 66872

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeResizePalette => 65849

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeDIBBitBlt => 67904

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeDIBStretchBlt => 68417

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeDIBCreatePatternBrush => 65858

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeStretchDIB => 69443

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeExtFloodFill => 66888

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeSetLayout => 65865

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeResetDC => 65868

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeStartDoc => 65869

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeStartPage => 65615

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeEndPage => 65616

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeAbortDoc => 65618

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeEndDoc => 65630

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeDeleteObject => 66032

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreatePalette => 65783

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateBrush => 65784

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreatePatternBrush => 66041

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreatePenIndirect => 66298

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateFontIndirect => 66299

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateBrushIndirect => 66300

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateBitmapIndirect => 66301

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateBitmap => 67326

    /**
     * @type {Integer (Int32)}
     */
    static WmfRecordTypeCreateRegion => 67327

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeHeader => 1

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyBezier => 2

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolygon => 3

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyline => 4

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyBezierTo => 5

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyLineTo => 6

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyPolyline => 7

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyPolygon => 8

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetWindowExtEx => 9

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetWindowOrgEx => 10

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetViewportExtEx => 11

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetViewportOrgEx => 12

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetBrushOrgEx => 13

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeEOF => 14

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetPixelV => 15

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetMapperFlags => 16

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetMapMode => 17

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetBkMode => 18

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetPolyFillMode => 19

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetROP2 => 20

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetStretchBltMode => 21

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetTextAlign => 22

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetColorAdjustment => 23

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetTextColor => 24

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetBkColor => 25

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeOffsetClipRgn => 26

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeMoveToEx => 27

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetMetaRgn => 28

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExcludeClipRect => 29

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeIntersectClipRect => 30

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeScaleViewportExtEx => 31

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeScaleWindowExtEx => 32

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSaveDC => 33

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeRestoreDC => 34

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetWorldTransform => 35

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeModifyWorldTransform => 36

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSelectObject => 37

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreatePen => 38

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreateBrushIndirect => 39

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeDeleteObject => 40

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeAngleArc => 41

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeEllipse => 42

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeRectangle => 43

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeRoundRect => 44

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeArc => 45

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeChord => 46

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePie => 47

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSelectPalette => 48

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreatePalette => 49

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetPaletteEntries => 50

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeResizePalette => 51

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeRealizePalette => 52

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtFloodFill => 53

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeLineTo => 54

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeArcTo => 55

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyDraw => 56

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetArcDirection => 57

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetMiterLimit => 58

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeBeginPath => 59

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeEndPath => 60

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCloseFigure => 61

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeFillPath => 62

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeStrokeAndFillPath => 63

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeStrokePath => 64

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeFlattenPath => 65

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeWidenPath => 66

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSelectClipPath => 67

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeAbortPath => 68

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeReserved_069 => 69

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeGdiComment => 70

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeFillRgn => 71

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeFrameRgn => 72

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeInvertRgn => 73

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePaintRgn => 74

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtSelectClipRgn => 75

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeBitBlt => 76

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeStretchBlt => 77

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeMaskBlt => 78

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePlgBlt => 79

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetDIBitsToDevice => 80

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeStretchDIBits => 81

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtCreateFontIndirect => 82

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtTextOutA => 83

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtTextOutW => 84

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyBezier16 => 85

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolygon16 => 86

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyline16 => 87

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyBezierTo16 => 88

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolylineTo16 => 89

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyPolyline16 => 90

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyPolygon16 => 91

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyDraw16 => 92

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreateMonoBrush => 93

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreateDIBPatternBrushPt => 94

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtCreatePen => 95

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyTextOutA => 96

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePolyTextOutW => 97

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetICMMode => 98

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreateColorSpace => 99

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetColorSpace => 100

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeDeleteColorSpace => 101

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeGLSRecord => 102

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeGLSBoundedRecord => 103

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypePixelFormat => 104

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeDrawEscape => 105

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeExtEscape => 106

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeStartDoc => 107

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSmallTextOut => 108

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeForceUFIMapping => 109

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeNamedEscape => 110

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeColorCorrectPalette => 111

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetICMProfileA => 112

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetICMProfileW => 113

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeAlphaBlend => 114

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetLayout => 115

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeTransparentBlt => 116

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeReserved_117 => 117

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeGradientFill => 118

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetLinkedUFIs => 119

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeSetTextJustification => 120

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeColorMatchToTargetW => 121

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeCreateColorSpaceW => 122

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeMax => 122

    /**
     * @type {Integer (Int32)}
     */
    static EmfRecordTypeMin => 1

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeInvalid => 16384

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeHeader => 16385

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeEndOfFile => 16386

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeComment => 16387

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeGetDC => 16388

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMultiFormatStart => 16389

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMultiFormatSection => 16390

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMultiFormatEnd => 16391

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeObject => 16392

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeClear => 16393

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillRects => 16394

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawRects => 16395

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillPolygon => 16396

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawLines => 16397

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillEllipse => 16398

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawEllipse => 16399

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillPie => 16400

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawPie => 16401

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawArc => 16402

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillRegion => 16403

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillPath => 16404

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawPath => 16405

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeFillClosedCurve => 16406

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawClosedCurve => 16407

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawCurve => 16408

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawBeziers => 16409

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawImage => 16410

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawImagePoints => 16411

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawString => 16412

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetRenderingOrigin => 16413

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetAntiAliasMode => 16414

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetTextRenderingHint => 16415

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetTextContrast => 16416

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetInterpolationMode => 16417

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetPixelOffsetMode => 16418

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetCompositingMode => 16419

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetCompositingQuality => 16420

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSave => 16421

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeRestore => 16422

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeBeginContainer => 16423

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeBeginContainerNoParams => 16424

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeEndContainer => 16425

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetWorldTransform => 16426

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeResetWorldTransform => 16427

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMultiplyWorldTransform => 16428

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeTranslateWorldTransform => 16429

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeScaleWorldTransform => 16430

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeRotateWorldTransform => 16431

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetPageTransform => 16432

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeResetClip => 16433

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetClipRect => 16434

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetClipPath => 16435

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetClipRegion => 16436

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeOffsetClip => 16437

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeDrawDriverString => 16438

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeStrokeFillPath => 16439

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSerializableObject => 16440

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetTSGraphics => 16441

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeSetTSClip => 16442

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTotal => 16443

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMax => 16442

    /**
     * @type {Integer (Int32)}
     */
    static EmfPlusRecordTypeMin => 16385
}
