#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ObjectType enumeration indicates the object type value of an EMF+ record.
 * @remarks
 * 
 * To determine whether the object type value of an EMF+ record is valid, call <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusenums/nf-gdiplusenums-objecttypeisvalid">ObjectTypeIsValid</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-objecttype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ObjectType{

    /**
     * Object type is invalid.
     * @type {Integer (Int32)}
     */
    static ObjectTypeInvalid => 0

    /**
     * Object type is a brush.
     * @type {Integer (Int32)}
     */
    static ObjectTypeBrush => 1

    /**
     * Object type is a pen.
     * @type {Integer (Int32)}
     */
    static ObjectTypePen => 2

    /**
     * Object type is a path.
     * @type {Integer (Int32)}
     */
    static ObjectTypePath => 3

    /**
     * Object type is a region.
     * @type {Integer (Int32)}
     */
    static ObjectTypeRegion => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ObjectTypeImage => 5

    /**
     * Object type is a font.
     * @type {Integer (Int32)}
     */
    static ObjectTypeFont => 6

    /**
     * Object type is a string format.
     * @type {Integer (Int32)}
     */
    static ObjectTypeStringFormat => 7

    /**
     * Object type is an image attribute.
     * @type {Integer (Int32)}
     */
    static ObjectTypeImageAttributes => 8

    /**
     * Object type is a custom line cap.
     * @type {Integer (Int32)}
     */
    static ObjectTypeCustomLineCap => 9

    /**
     * Object type is graphics.
     * @type {Integer (Int32)}
     */
    static ObjectTypeGraphics => 10

    /**
     * Maximum enumeration value. Currently, it is ObjectTypeGraphics.
     * @type {Integer (Int32)}
     */
    static ObjectTypeMax => 10

    /**
     * Minimum enumeration value. Currently, it is ObjectTypeBrush.
     * @type {Integer (Int32)}
     */
    static ObjectTypeMin => 1
}
