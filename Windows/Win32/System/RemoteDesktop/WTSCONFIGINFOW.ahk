#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Remote Desktop Services session. (WTSCONFIGINFOW)
 * @remarks
 * > [!NOTE]
  * > The wtsapi32.h header defines WTSCONFIGINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsconfiginfow
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset Unicode
 */
class WTSCONFIGINFOW extends Win32Struct
{
    static sizeof => 1668

    static packingSize => 4

    /**
     * This member is reserved.
     * @type {Integer}
     */
    version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is reserved.
     * @type {Integer}
     */
    fConnectClientDrivesAtLogon {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This member is reserved.
     * @type {Integer}
     */
    fConnectPrinterAtLogon {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies whether the client can use printer redirection.
     * @type {Integer}
     */
    fDisablePrinterRedirection {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies whether the printer connected to the client is the default printer for the user.
     * @type {Integer}
     */
    fDisableDefaultMainClientPrinter {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    ShadowSettings {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A null-terminated string that contains the user name used in automatic logon scenarios.
     * @type {String}
     */
    LogonUserName {
        get => StrGet(this.ptr + 24, 20, "UTF-16")
        set => StrPut(value, this.ptr + 24, 20, "UTF-16")
    }

    /**
     * A null-terminated string that contains the domain name used in automatic logon scenarios.
     * @type {String}
     */
    LogonDomain {
        get => StrGet(this.ptr + 66, 17, "UTF-16")
        set => StrPut(value, this.ptr + 66, 17, "UTF-16")
    }

    /**
     * A null-terminated string that contains the path of the working directory of  the initial program.
     * @type {String}
     */
    WorkDirectory {
        get => StrGet(this.ptr + 102, 260, "UTF-16")
        set => StrPut(value, this.ptr + 102, 260, "UTF-16")
    }

    /**
     * A null-terminated string that contains the name of  the program to start immediately after the user logs on to the server.
     * @type {String}
     */
    InitialProgram {
        get => StrGet(this.ptr + 624, 260, "UTF-16")
        set => StrPut(value, this.ptr + 624, 260, "UTF-16")
    }

    /**
     * This member is reserved.
     * @type {String}
     */
    ApplicationName {
        get => StrGet(this.ptr + 1146, 260, "UTF-16")
        set => StrPut(value, this.ptr + 1146, 260, "UTF-16")
    }
}
