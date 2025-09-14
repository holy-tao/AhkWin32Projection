#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class PRE_PROCESS_PARAMETERS extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Pointer<PWSTR>}
     */
    pszSessionId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pszSiteName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pszUserName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pszHostName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pszRemoteIpAddress {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwRemoteIpPort {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pszLocalIpAddress {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    dwLocalIpPort {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pszCommand {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pszCommandParameters {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {FILETIME}
     */
    SessionStartTime{
        get {
            if(!this.HasProp("__SessionStartTime"))
                this.__SessionStartTime := FILETIME(this.ptr + 80)
            return this.__SessionStartTime
        }
    }

    /**
     * @type {Integer}
     */
    BytesSentPerSession {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    BytesReceivedPerSession {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
