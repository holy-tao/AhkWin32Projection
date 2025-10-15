#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The MPR_INTERFACE_0 structure contains information for a particular router interface.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mpr_interface_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_INTERFACE_0 extends Win32Struct
{
    static sizeof => 552

    static packingSize => 8

    /**
     * Pointer to a Unicode string that contains the name of the interface.
     * @type {String}
     */
    wszInterfaceName {
        get => StrGet(this.ptr + 0, 256, "UTF-16")
        set => StrPut(value, this.ptr + 0, 256, "UTF-16")
    }

    /**
     * Handle to the interface.
     * @type {HANDLE}
     */
    hInterface{
        get {
            if(!this.HasProp("__hInterface"))
                this.__hInterface := HANDLE(this.ptr + 520)
            return this.__hInterface
        }
    }

    /**
     * Specifies whether the interface is enabled. This member is <b>TRUE</b> if the interface is enabled, <b>FALSE</b> if the interface is administratively disabled.
     * @type {BOOL}
     */
    fEnabled{
        get {
            if(!this.HasProp("__fEnabled"))
                this.__fEnabled := BOOL(this.ptr + 528)
            return this.__fEnabled
        }
    }

    /**
     * Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">type of interface</a>.
     * @type {Integer}
     */
    dwIfType {
        get => NumGet(this, 532, "int")
        set => NumPut("int", value, this, 532)
    }

    /**
     * Specifies the current state of the interface, for example connected, disconnected, or unreachable. For a list of possible states, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_connection_state">ROUTER_CONNECTION_STATE</a>.
     * @type {Integer}
     */
    dwConnectionState {
        get => NumGet(this, 536, "int")
        set => NumPut("int", value, this, 536)
    }

    /**
     * Specifies a value that represents a reason why the interface cannot be reached. See 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/unreachability-reasons">Unreachability Reasons</a> for a list of possible values.
     * @type {Integer}
     */
    fUnReachabilityReasons {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }

    /**
     * Specifies a nonzero value if the interface fails to connect.
     * @type {Integer}
     */
    dwLastError {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }
}
