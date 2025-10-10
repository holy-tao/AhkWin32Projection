#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NDR_USER_MARSHAL_INFO_LEVEL1 structure holds information about the state of an RPC call that can be passed to wire_marshal and user_marshal helper functions.
 * @see https://docs.microsoft.com/windows/win32/api//rpcndr/ns-rpcndr-ndr_user_marshal_info_level1
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR_USER_MARSHAL_INFO_LEVEL1 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Pointer to the beginning of the marshaling buffer available for use by the helper function. If no buffer is available, this field is null.
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size, in bytes, of the marshaling buffer available for use by the helper function. If no buffer is available, <i>BufferSize</i> is zero.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Function used by RPC to allocate memory for the application. An example of the use of this function is to create a node.
     * @type {Pointer}
     */
    pfnAllocate {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Function used by RPC to free memory for the application. An example of the use of this function is to free a node.
     * @type {Pointer}
     */
    pfnFree {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * If the current call is for a COM interface, this member is a pointer to the channel buffer that RPC uses for the call. Otherwise, this member is null.
     * @type {Pointer<IRpcChannelBuffer>}
     */
    pRpcChannelBuffer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reserved for future use.
     * @type {Array<UIntPtr>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 40, 5, Primitive, "ptr")
            return this.__ReservedProxyArray
        }
    }
}
