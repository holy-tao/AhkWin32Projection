#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by members of the IColumnManager interface to specify which set of columns are being requested, either all or only those currently visible.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-cm_enum_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CM_ENUM_FLAGS extends Win32BitflagEnum{

    /**
     * Enumerate all.
     * @type {Integer (Int32)}
     */
    static CM_ENUM_ALL => 1

    /**
     * Enumerate visible.
     * @type {Integer (Int32)}
     */
    static CM_ENUM_VISIBLE => 2
}
