#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to provide GINA with Terminal Services user configuration information.
 * @remarks
 * The Terminal Services user configuration information is received from the Domain Controller and SAM database.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_terminal_services_data
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WLX_TERMINAL_SERVICES_DATA extends Win32Struct
{
    static sizeof => 1036

    static packingSize => 2

    /**
     * Terminal Services profile path, overrides the standard profile path.
     * @type {String}
     */
    ProfilePath {
        get => StrGet(this.ptr + 0, 256, "UTF-16")
        set => StrPut(value, this.ptr + 0, 256, "UTF-16")
    }

    /**
     * Terminal Services home directory, overrides standard home directory.
     * @type {String}
     */
    HomeDir {
        get => StrGet(this.ptr + 514, 256, "UTF-16")
        set => StrPut(value, this.ptr + 514, 256, "UTF-16")
    }

    /**
     * Terminal Services home directory drive, overrides the standard drive.
     * @type {String}
     */
    HomeDirDrive {
        get => StrGet(this.ptr + 1028, 3, "UTF-16")
        set => StrPut(value, this.ptr + 1028, 3, "UTF-16")
    }
}
