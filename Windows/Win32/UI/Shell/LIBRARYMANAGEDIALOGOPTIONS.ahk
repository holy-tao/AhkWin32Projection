#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by SHShowManageLibraryUI to define options for handling a name collision when saving a library.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-librarymanagedialogoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class LIBRARYMANAGEDIALOGOPTIONS extends Win32BitflagEnum{

    /**
     * Show default warning UI to the user.
     * @type {Integer (Int32)}
     */
    static LMD_DEFAULT => 0

    /**
     * Do not display a warning dialog to the user in collisions that concern network locations that cannot be indexed.
     * @type {Integer (Int32)}
     */
    static LMD_ALLOWUNINDEXABLENETWORKLOCATIONS => 1
}
