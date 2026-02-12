#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the types of content values supported by each [TargetedContentItem](targetedcontentitem.md) object in a [TargetedContentContainer](targetedcontentcontainer.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvaluekind
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentValueKind extends Win32Enum{

    /**
     * A string.
     * @type {Integer (Int32)}
     */
    static String => 0

    /**
     * A Uri object.
     * @type {Integer (Int32)}
     */
    static Uri => 1

    /**
     * A double.
     * @type {Integer (Int32)}
     */
    static Number => 2

    /**
     * A Boolean.
     * @type {Integer (Int32)}
     */
    static Boolean => 3

    /**
     * A [TargetedContentFile](targetedcontentfile.md) object.
     * @type {Integer (Int32)}
     */
    static File => 4

    /**
     * a [TargetedContentImage](targetedcontentimage.md) object.
     * @type {Integer (Int32)}
     */
    static ImageFile => 5

    /**
     * A [TargetedContentAction](targetedcontentaction.md) object.
     * @type {Integer (Int32)}
     */
    static Action => 6

    /**
     * An array of strings.
     * @type {Integer (Int32)}
     */
    static Strings => 7

    /**
     * An array of Uri objects.
     * @type {Integer (Int32)}
     */
    static Uris => 8

    /**
     * An array of doubles.
     * @type {Integer (Int32)}
     */
    static Numbers => 9

    /**
     * An array of Booleans.
     * @type {Integer (Int32)}
     */
    static Booleans => 10

    /**
     * An array of [TargetedContentFile](targetedcontentfile.md) objects.
     * @type {Integer (Int32)}
     */
    static Files => 11

    /**
     * An array of [TargetedContentImage](targetedcontentimage.md) objects.
     * @type {Integer (Int32)}
     */
    static ImageFiles => 12

    /**
     * An array of [TargetedContentAction](targetedcontentaction.md) objects.
     * @type {Integer (Int32)}
     */
    static Actions => 13
}
