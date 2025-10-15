#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class POST_PROCESS_PARAMETERS extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszSessionId{
        get {
            if(!this.HasProp("__pszSessionId"))
                this.__pszSessionId := PWSTR(this.ptr + 0)
            return this.__pszSessionId
        }
    }

    /**
     * @type {PWSTR}
     */
    pszSiteName{
        get {
            if(!this.HasProp("__pszSiteName"))
                this.__pszSiteName := PWSTR(this.ptr + 8)
            return this.__pszSiteName
        }
    }

    /**
     * @type {PWSTR}
     */
    pszUserName{
        get {
            if(!this.HasProp("__pszUserName"))
                this.__pszUserName := PWSTR(this.ptr + 16)
            return this.__pszUserName
        }
    }

    /**
     * @type {PWSTR}
     */
    pszHostName{
        get {
            if(!this.HasProp("__pszHostName"))
                this.__pszHostName := PWSTR(this.ptr + 24)
            return this.__pszHostName
        }
    }

    /**
     * @type {PWSTR}
     */
    pszRemoteIpAddress{
        get {
            if(!this.HasProp("__pszRemoteIpAddress"))
                this.__pszRemoteIpAddress := PWSTR(this.ptr + 32)
            return this.__pszRemoteIpAddress
        }
    }

    /**
     * @type {Integer}
     */
    dwRemoteIpPort {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {PWSTR}
     */
    pszLocalIpAddress{
        get {
            if(!this.HasProp("__pszLocalIpAddress"))
                this.__pszLocalIpAddress := PWSTR(this.ptr + 48)
            return this.__pszLocalIpAddress
        }
    }

    /**
     * @type {Integer}
     */
    dwLocalIpPort {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    BytesSent {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    BytesReceived {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {PWSTR}
     */
    pszCommand{
        get {
            if(!this.HasProp("__pszCommand"))
                this.__pszCommand := PWSTR(this.ptr + 80)
            return this.__pszCommand
        }
    }

    /**
     * @type {PWSTR}
     */
    pszCommandParameters{
        get {
            if(!this.HasProp("__pszCommandParameters"))
                this.__pszCommandParameters := PWSTR(this.ptr + 88)
            return this.__pszCommandParameters
        }
    }

    /**
     * @type {PWSTR}
     */
    pszFullPath{
        get {
            if(!this.HasProp("__pszFullPath"))
                this.__pszFullPath := PWSTR(this.ptr + 96)
            return this.__pszFullPath
        }
    }

    /**
     * @type {PWSTR}
     */
    pszPhysicalPath{
        get {
            if(!this.HasProp("__pszPhysicalPath"))
                this.__pszPhysicalPath := PWSTR(this.ptr + 104)
            return this.__pszPhysicalPath
        }
    }

    /**
     * @type {Integer}
     */
    FtpStatus {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    FtpSubStatus {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {HRESULT}
     */
    hrStatus {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * @type {FILETIME}
     */
    SessionStartTime{
        get {
            if(!this.HasProp("__SessionStartTime"))
                this.__SessionStartTime := FILETIME(this.ptr + 128)
            return this.__SessionStartTime
        }
    }

    /**
     * @type {Integer}
     */
    BytesSentPerSession {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    BytesReceivedPerSession {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }
}
