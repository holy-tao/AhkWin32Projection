#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values used with the DROPDESCRIPTION structure to specify the drop image.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-dropimagetype
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DROPIMAGETYPE extends Win32Enum{

    /**
     * No drop image preference; use the default image.
     * @type {Integer (Int32)}
     */
    static DROPIMAGE_INVALID => -1

    /**
     * A red bisected circle such as that found on a "no smoking" sign.
     * @type {Integer (Int32)}
     */
    static DROPIMAGE_NONE => 0

    /**
     * A plus sign (+) that indicates a copy operation.
     * @type {Integer (Int32)}
     */
    static DROPIMAGE_COPY => 1

    /**
     * An arrow that indicates a move operation.
     * @type {Integer (Int32)}
     */
    static DROPIMAGE_MOVE => 2

    /**
     * An arrow that indicates a link.
     * @type {Integer (Int32)}
     */
    static DROPIMAGE_LINK => 4

    /**
     * A tag icon that indicates that the metadata will be changed.
     * @type {Integer (Int32)}
     */
    static DROPIMAGE_LABEL => 6

    /**
     * A yellow exclamation mark that indicates that a problem has been encountered in the operation.
     * @type {Integer (Int32)}
     */
    static DROPIMAGE_WARNING => 7

    /**
     * <b>Windows 7 and later</b>. Use no drop image.
     * @type {Integer (Int32)}
     */
    static DROPIMAGE_NOIMAGE => 8
}
