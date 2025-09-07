#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RTM_ENTITY_EXPORT_METHODS structure contains the set of methods exported by a client.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_entity_export_methods
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_ENTITY_EXPORT_METHODS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of methods exported by the client in the <b>Methods</b> member.
     * @type {Integer}
     */
    NumMethods {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies which methods the client is exporting.
     * @type {Array<Ptr>}
     */
    Methods{
        get {
            if(!this.HasProp("__MethodsProxyArray"))
                this.__MethodsProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "ptr")
            return this.__MethodsProxyArray
        }
    }
}
