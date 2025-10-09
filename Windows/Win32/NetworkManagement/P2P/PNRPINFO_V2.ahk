#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\SOCKET_ADDRESS.ahk
#Include ..\..\System\Com\BLOB.ahk

/**
 * The PNRPINFO_V1 structure is pointed to by the lpBlob member of the WSAQUERYSET structure.P
 * @remarks
 * Starting with Windows Vista, please use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa371671(v=vs.85)">PNRPINFO_V2</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/pnrpns/ns-pnrpns-pnrpinfo_v2
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PNRPINFO_V2 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Specifies the size of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Points  to the Unicode string that contains the identity.
     * @type {Pointer<Char>}
     */
    lpwszIdentity {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the requested number of resolutions.
     * @type {Integer}
     */
    nMaxResolve {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the time, in seconds, to wait for a response.
     * @type {Integer}
     */
    dwTimeout {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the number of seconds between refresh operations. Must be   86400 (24 * 60 * 60 seconds).
     * @type {Integer}
     */
    dwLifetime {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the criteria used to resolve matches.  PNRP can look for the first matching name, or attempt to find a name that is numerically close to the service location. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/pnrpdef/ne-pnrpdef-pnrp_resolve_criteria">PNRP_RESOLVE_CRITERIA</a>.
     * @type {Integer}
     */
    enResolveCriteria {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Specifies the flags to use for the resolve operation. The valid value is:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>PNRPINFO_HINT</td>
     * <td>Indicates that the <b>saHint</b> member is used. The hint influences how the service location portion of the PNRP ID is generated; it also influences how names are resolved, and specifies how to select between multiple peer names.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies the IPv6 address to  use for the location. The  <b>dwFlags</b> member must be PNRPINFO_HINT.
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
     * Specifies the state of the registered ID.  This value is reserved and must be set to zero (0).
     * @type {Integer}
     */
    enNameState {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * 
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
     * @type {Pointer<Char>}
     */
    pwszPayload {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
