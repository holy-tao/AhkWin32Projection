#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MPRAPI_OBJECT_HEADER.ahk

/**
 * Used to update an active RAS connection.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_update_connection
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_UPDATE_CONNECTION extends Win32Struct
{
    static sizeof => 268

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd408110(v=vs.85)">RAS_UPDATE_CONNECTION</a> structure. 
     * 
     * <div class="alert"><b>Note</b>  The <b>revision</b> member  of  <b>Header</b> must be <b>0x01</b> and <b>type</b> must be <b>MPRAPI_OBJECT_TYPE_UPDATE_CONNECTION_OBJECT</b>.</div>
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
     * A value that specifies the new interface index of the Virtual Private Network (VPN) endpoint.
     * @type {Integer}
     */
    dwIfIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A null-terminated Unicode string that contains the new IP address of the local computer in the connection. This string is of the form "a.b.c.d".
     * @type {String}
     */
    wszLocalEndpointAddress {
        get => StrGet(this.ptr + 8, 64, "UTF-16")
        set => StrPut(value, this.ptr + 8, 64, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the new IP address of the remote computer in the connection. This string is of the form "a.b.d.c".
     * @type {String}
     */
    wszRemoteEndpointAddress {
        get => StrGet(this.ptr + 138, 64, "UTF-16")
        set => StrPut(value, this.ptr + 138, 64, "UTF-16")
    }
}
