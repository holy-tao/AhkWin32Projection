#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ObjectType extends Win32Enum {

    /**
     * Native name: ObjectTypeInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Native name: ObjectTypeBrush
     * @type {Integer (Int32)}
     */
    static Brush => 1

    /**
     * Native name: ObjectTypePen
     * @type {Integer (Int32)}
     */
    static Pen => 2

    /**
     * Native name: ObjectTypePath
     * @type {Integer (Int32)}
     */
    static Path => 3

    /**
     * Native name: ObjectTypeRegion
     * @type {Integer (Int32)}
     */
    static Region => 4

    /**
     * Native name: ObjectTypeImage
     * @type {Integer (Int32)}
     */
    static Image => 5

    /**
     * Native name: ObjectTypeFont
     * @type {Integer (Int32)}
     */
    static Font => 6

    /**
     * Native name: ObjectTypeStringFormat
     * @type {Integer (Int32)}
     */
    static StringFormat => 7

    /**
     * Native name: ObjectTypeImageAttributes
     * @type {Integer (Int32)}
     */
    static ImageAttributes => 8

    /**
     * Native name: ObjectTypeCustomLineCap
     * @type {Integer (Int32)}
     */
    static CustomLineCap => 9

    /**
     * Native name: ObjectTypeGraphics
     * @type {Integer (Int32)}
     */
    static Graphics => 10

    /**
     * Native name: ObjectTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 10

    /**
     * Native name: ObjectTypeMin
     * @type {Integer (Int32)}
     */
    static Min => 1
}
