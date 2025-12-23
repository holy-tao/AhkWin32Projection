#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies information for the current item in the SYNCMGRITEM structure.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgritemflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGRITEMFLAGS extends Win32Enum{

    /**
     * The item has a properties dialog.
     * @type {Integer (Int32)}
     */
    static SYNCMGRITEM_HASPROPERTIES => 1

    /**
     * The item is temporary and any stored preferences can be removed. This value is defined but not used in Windows Vista.
     * @type {Integer (Int32)}
     */
    static SYNCMGRITEM_TEMPORARY => 2

    /**
     * The item roams with the user and is not specific to a machine. This value is defined but is ignored by both Windows XP and Windows Vista.
     * @type {Integer (Int32)}
     */
    static SYNCMGRITEM_ROAMINGUSER => 4

    /**
     * The LastUpdateTime field is valid.
     * @type {Integer (Int32)}
     */
    static SYNCMGRITEM_LASTUPDATETIME => 8

    /**
     * The item may be deleted. This value has been deprecated for Windows Vista and later. This value is defined but is ignored by both Windows XP and Windows Vista.
     * @type {Integer (Int32)}
     */
    static SYNCMGRITEM_MAYDELETEITEM => 16

    /**
     * <b>Windows Vista and later</b>. Not supported.
     * @type {Integer (Int32)}
     */
    static SYNCMGRITEM_HIDDEN => 32
}
