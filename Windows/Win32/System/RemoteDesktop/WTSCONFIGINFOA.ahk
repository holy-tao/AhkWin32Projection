#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Remote Desktop Services session. (WTSCONFIGINFOA)
 * @remarks
 * > [!NOTE]
  * > The wtsapi32.h header defines WTSCONFIGINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsconfiginfoa
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset ANSI
 */
class WTSCONFIGINFOA extends Win32Struct
{
    static sizeof => 848

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
     * @type {Array<SByte>}
     */
    LogonUserName{
        get {
            if(!this.HasProp("__LogonUserNameProxyArray"))
                this.__LogonUserNameProxyArray := Win32FixedArray(this.ptr + 24, 21, Primitive, "char")
            return this.__LogonUserNameProxyArray
        }
    }

    /**
     * A null-terminated string that contains the domain name used in automatic logon scenarios.
     * @type {Array<SByte>}
     */
    LogonDomain{
        get {
            if(!this.HasProp("__LogonDomainProxyArray"))
                this.__LogonDomainProxyArray := Win32FixedArray(this.ptr + 45, 18, Primitive, "char")
            return this.__LogonDomainProxyArray
        }
    }

    /**
     * A null-terminated string that contains the path of the working directory of  the initial program.
     * @type {Array<SByte>}
     */
    WorkDirectory{
        get {
            if(!this.HasProp("__WorkDirectoryProxyArray"))
                this.__WorkDirectoryProxyArray := Win32FixedArray(this.ptr + 63, 261, Primitive, "char")
            return this.__WorkDirectoryProxyArray
        }
    }

    /**
     * A null-terminated string that contains the name of  the program to start immediately after the user logs on to the server.
     * @type {Array<SByte>}
     */
    InitialProgram{
        get {
            if(!this.HasProp("__InitialProgramProxyArray"))
                this.__InitialProgramProxyArray := Win32FixedArray(this.ptr + 324, 261, Primitive, "char")
            return this.__InitialProgramProxyArray
        }
    }

    /**
     * This member is reserved.
     * @type {Array<SByte>}
     */
    ApplicationName{
        get {
            if(!this.HasProp("__ApplicationNameProxyArray"))
                this.__ApplicationNameProxyArray := Win32FixedArray(this.ptr + 585, 261, Primitive, "char")
            return this.__ApplicationNameProxyArray
        }
    }
}
