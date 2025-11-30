#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ColorCurve class encompasses the eight bitmap adjustments listed in the CurveAdjustments enumeration.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/ne-gdipluseffects-curveadjustments
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class CurveAdjustments extends Win32Enum{

    /**
     * Simulates increasing or decreasing the exposure of a photograph. When you set the <b>adjustment</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ns-gdipluseffects-colorcurveparams">ColorCurveParams</a> object to <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curveadjustments">AdjustExposure</a>, you should set the <b>adjustValue</b> member to an integer in the range -255 through 255. A value of 0 specifies no change in exposure. Positive values specify increased exposure and negative values specify decreased exposure.
     * @type {Integer (Int32)}
     */
    static AdjustExposure => 0

    /**
     * Simulates increasing or decreasing the film density of a photograph. When you set the <b>adjustment</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ns-gdipluseffects-colorcurveparams">ColorCurveParams</a> object to <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curveadjustments">AdjustDensity</a>, you should set the <b>adjustValue</b> member to an integer in the range -255 through 255. A value of 0 specifies no change in density. Positive values specify increased density (lighter picture) and negative values specify decreased density (darker picture).
     * @type {Integer (Int32)}
     */
    static AdjustDensity => 1

    /**
     * Increases or decreases the contrast of a bitmap. When you set the <b>adjustment</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ns-gdipluseffects-colorcurveparams">ColorCurveParams</a> object to <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curveadjustments">AdjustContrast</a>, you should set the <b>adjustValue</b> member to an integer in the range -100 through 100. A value of 0 specifies no change in contrast. Positive values specify increased contrast and negative values specify decreased contrast.
     * @type {Integer (Int32)}
     */
    static AdjustContrast => 2

    /**
     * Increases or decreases the value of a color channel if that channel already has a value that is above half intensity. You can use this adjustment to get more definition in the light areas of an image without affecting the dark areas. When you set the <b>adjustment</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ns-gdipluseffects-colorcurveparams">ColorCurveParams</a> object to <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curveadjustments">AdjustHighlight</a>, you should set the <b>adjustValue</b> member to an integer in the range -100 through 100. A value of 0 specifies no change. Positive values specify that the light areas are made lighter, and negative values specify that the light areas are made darker.
     * @type {Integer (Int32)}
     */
    static AdjustHighlight => 3

    /**
     * Increases or decreases the value of a color channel if that channel already has a value that is below half intensity. You can use this adjustment to get more definition in the dark areas of an image without affecting the light areas. When you set the <b>adjustment</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ns-gdipluseffects-colorcurveparams">ColorCurveParams</a> object to <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curveadjustments">AdjustShadow</a>, you should set the <b>adjustValue</b> member to an integer in the range -100 through 100. A value of 0 specifies no change. Positive values specify that the dark areas are made lighter, and negative values specify that the dark areas are made darker.
     * @type {Integer (Int32)}
     */
    static AdjustShadow => 4

    /**
     * Lightens or darkens an image. Color channel values in the middle of the intensity range are altered more than color channel values near the minimum or maximum intensity. You can use this adjustment to lighten (or darken) an image without loosing the contrast between the darkest and lightest portions of the image. When you set the <b>adjustment</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ns-gdipluseffects-colorcurveparams">ColorCurveParams</a> object to <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curveadjustments">AdjustMidtone</a>, you should set the <b>adjustValue</b> member to an integer in the range -100 through 100. A value of 0 specifies no change. Positive values specify that the midtones are made lighter, and negative values specify that the midtones are made darker.
     * @type {Integer (Int32)}
     */
    static AdjustMidtone => 5

    /**
     * When you set the <b>adjustment</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ns-gdipluseffects-colorcurveparams">ColorCurveParams</a> object to <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curveadjustments">AdjustWhiteSaturation</a>, you should set the <b>adjustValue</b> member to an integer in the range 0 through 255. A value of t specifies that the interval [0, t] is mapped linearly to the interval [0, 255]. For example, if <b>adjustValue</b> is equal to 240, then color channel values in the interval [0, 240] are adjusted so that they spread out over the interval [0, 255]. Color channel values greater than 240 are set to 255.
     * @type {Integer (Int32)}
     */
    static AdjustWhiteSaturation => 6

    /**
     * When you set the <b>adjustment</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ns-gdipluseffects-colorcurveparams">ColorCurveParams</a> object to <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curveadjustments">AdjustBlackSaturation</a>, you should set the <b>adjustValue</b> member to an integer in the range 0 through 255. A value of t specifies that the interval [t, 255] is mapped linearly to the interval [0, 255]. For example, if <b>adjustValue</b> is equal to 15, then color channel values in the interval [15, 255] are adjusted so that they spread out over the interval [0, 255]. Color channel values less than 15 are set to 0.
     * @type {Integer (Int32)}
     */
    static AdjustBlackSaturation => 7
}
