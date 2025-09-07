#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MPRAPI_OBJECT_HEADER.ahk

/**
 * Used for enabling clients to bypass Point-to-Point (PPP) authentication during Secure Socket Tunneling Protocol (SSTP) connection establishment.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-auth_validation_ex
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class AUTH_VALIDATION_EX extends Win32Struct
{
    static sizeof => 576

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <b>AUTH_VALIDATION_EX</b> structure. 
     * 
     * <div class="alert"><b>Note</b>  The <b>revision</b> member  of  <b>Header</b> must be <b>0x01</b> and <b>type</b> must be <b>MPRAPI_OBJECT_TYPE_AUTH_VALIDATION_OBJECT</b>.</div>
     * <div> </div>
     * @type {MPRAPI_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := MPRAPI_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * A handle to the RAS connection for which PPP authentication is being bypassed. This can be a handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a> function.
     * @type {Pointer<Ptr>}
     */
    hRasConnection {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A null-terminated Unicode string that contains the name of the user logging on to the connection.
     * @type {String}
     */
    wszUserName {
        get => StrGet(this.ptr + 16, 256, "UTF-16")
        set => StrPut(value, this.ptr + 16, 256, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the domain on which the connected user is authenticating.
     * @type {String}
     */
    wszLogonDomain {
        get => StrGet(this.ptr + 530, 15, "UTF-16")
        set => StrPut(value, this.ptr + 530, 15, "UTF-16")
    }

    /**
     * The size, in bytes, of the user authentication information in <b>AuthInfo</b>.
     * @type {Integer}
     */
    AuthInfoSize {
        get => NumGet(this, 564, "uint")
        set => NumPut("uint", value, this, 564)
    }

    /**
     * A <b>BYTE</b> array that contains the user authentication information required to bypass PPP authentication during SSTP connection negotiation.
     * @type {Array<Byte>}
     */
    AuthInfo{
        get {
            if(!this.HasProp("__AuthInfoProxyArray"))
                this.__AuthInfoProxyArray := Win32FixedArray(this.ptr + 568, 1, Primitive, "char")
            return this.__AuthInfoProxyArray
        }
    }
}
