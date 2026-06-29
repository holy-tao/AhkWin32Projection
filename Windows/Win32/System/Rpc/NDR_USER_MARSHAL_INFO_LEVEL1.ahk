#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\IRpcChannelBuffer.ahk" { IRpcChannelBuffer }

/**
 * The NDR_USER_MARSHAL_INFO_LEVEL1 structure holds information about the state of an RPC call that can be passed to wire_marshal and user_marshal helper functions.
 * @see https://learn.microsoft.com/windows/win32/api/rpcndr/ns-rpcndr-ndr_user_marshal_info_level1
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR_USER_MARSHAL_INFO_LEVEL1 {
    #StructPack 8

    /**
     * Pointer to the beginning of the marshaling buffer available for use by the helper function. If no buffer is available, this field is null.
     */
    Buffer : IntPtr

    /**
     * Size, in bytes, of the marshaling buffer available for use by the helper function. If no buffer is available, <i>BufferSize</i> is zero.
     */
    BufferSize : UInt32

    /**
     * Function used by RPC to allocate memory for the application. An example of the use of this function is to create a node.
     */
    pfnAllocate : IntPtr

    /**
     * Function used by RPC to free memory for the application. An example of the use of this function is to free a node.
     */
    pfnFree : IntPtr

    /**
     * If the current call is for a COM interface, this member is a pointer to the channel buffer that RPC uses for the call. Otherwise, this member is null.
     */
    pRpcChannelBuffer : IRpcChannelBuffer

    /**
     * Reserved for future use.
     */
    Reserved : IntPtr[5]

}
