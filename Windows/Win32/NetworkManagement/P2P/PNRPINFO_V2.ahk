#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Networking\WinSock\SOCKET_ADDRESS.ahk
#Include ..\..\System\Com\BLOB.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PNRPINFO_V2 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    lpwszIdentity{
        get {
            if(!this.HasProp("__lpwszIdentity"))
                this.__lpwszIdentity := PWSTR(this.ptr + 8)
            return this.__lpwszIdentity
        }
    }

    /**
     * @type {Integer}
     */
    nMaxResolve {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwTimeout {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwLifetime {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    enResolveCriteria {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {SOCKET_ADDRESS}
     */
    saHint{
        get {
            if(!this.HasProp("__saHint"))
                this.__saHint := SOCKET_ADDRESS(this.ptr + 40)
            return this.__saHint
        }
    }

    /**
     * @type {Integer}
     */
    enNameState {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    enExtendedPayloadType {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {BLOB}
     */
    blobPayload{
        get {
            if(!this.HasProp("__blobPayload"))
                this.__blobPayload := BLOB(this.ptr + 64)
            return this.__blobPayload
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszPayload{
        get {
            if(!this.HasProp("__pwszPayload"))
                this.__pwszPayload := PWSTR(this.ptr + 64)
            return this.__pwszPayload
        }
    }
}
