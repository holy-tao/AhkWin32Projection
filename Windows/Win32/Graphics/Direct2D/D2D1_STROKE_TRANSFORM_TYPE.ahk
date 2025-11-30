#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines how the world transform, dots per inch (dpi), and stroke width affect the shape of the pen used to stroke a primitive.
 * @remarks
 * 
 * If you specify <b>D2D1_STROKE_TRANSFORM_TYPE_FIXED</b> the stroke isn't affected by the world transform.
 * 
 * If you specify <b>D2D1_STROKE_TRANSFORM_TYPE_FIXED</b> the application has the same behavior in Windows 7 and later.
 * 
 * If you specify <b>D2D1_STROKE_TRANSFORM_TYPE_HAIRLINE</b> the stroke is always 1 pixel wide.
 * 
 * Apart from the stroke, any value derived from the stroke width is not affected when the transformType is either fixed or hairline. This includes miters, line caps and so on.
 * 
 *  
 * 
 * It is important to distinguish between the geometry being stroked and the shape of the stroke pen. When D2D1_STROKE_TRANSFORM_TYPE_FIXED or D2D1_STROKE_TRANSFORM_TYPE_HAIRLINE is specified, the geometry still respects the transform and dpi, but the pen that traces the geometry will not.
 * 
 * Here is an illustration of a stroke with dashing and a skew and stretch transform.
 * 
 * <img alt="An illustration of a stroke with dashing and a skew and stretch transform." src="./images/skewedstroke.png"/>
 * And here is an illustration of a fixed width stroke which does not get transformed.
 * 
 * <img alt="An illustration of a fixed width stroke which does not get transformed." src="./images/fixedwidthstroke.png"/>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ne-d2d1_1-d2d1_stroke_transform_type
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_STROKE_TRANSFORM_TYPE extends Win32Enum{

    /**
     * The stroke respects the currently set world transform, the dpi, and the stroke width.
     * @type {Integer (Int32)}
     */
    static D2D1_STROKE_TRANSFORM_TYPE_NORMAL => 0

    /**
     * The stroke does not respect the world transform but it does respect the dpi and stroke width.
     * @type {Integer (Int32)}
     */
    static D2D1_STROKE_TRANSFORM_TYPE_FIXED => 1

    /**
     * The stroke is forced to 1 pixel wide (in device space) and does not respect the world transform, the dpi, or the stroke width.
     * @type {Integer (Int32)}
     */
    static D2D1_STROKE_TRANSFORM_TYPE_HAIRLINE => 2
}
