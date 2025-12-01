#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies which objects are enumerated for autocompletion lists.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-autocompletelistoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class AUTOCOMPLETELISTOPTIONS extends Win32Enum{

    /**
     * No enumeration should take place.
     * @type {Integer (Int32)}
     */
    static ACLO_NONE => 0

    /**
     * Only the current directory should be enumerated.
     * @type {Integer (Int32)}
     */
    static ACLO_CURRENTDIR => 1

    /**
     * Only MyComputer should be enumerated.
     * @type {Integer (Int32)}
     */
    static ACLO_MYCOMPUTER => 2

    /**
     * Only the Desktop Folder should be enumerated.
     * @type {Integer (Int32)}
     */
    static ACLO_DESKTOP => 4

    /**
     * Only the Favorites Folder should be enumerated.
     * @type {Integer (Int32)}
     */
    static ACLO_FAVORITES => 8

    /**
     * Only the file system should be enumerated.
     * @type {Integer (Int32)}
     */
    static ACLO_FILESYSONLY => 16

    /**
     * <b>Internet Explorer 6 or greater:</b> The file system dirs, UNC shares, and UNC servers should be enumerated.
     * @type {Integer (Int32)}
     */
    static ACLO_FILESYSDIRS => 32

    /**
     * <b>Windows Internet Explorer 7 or greater:</b> The virtual namespace should be enumerated.
     * @type {Integer (Int32)}
     */
    static ACLO_VIRTUALNAMESPACE => 64
}
