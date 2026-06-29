#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RTM_ENTITY_METHOD_OUTPUT structure is used to pass information to the calling client when the routing table manager invokes a method.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_entity_method_output
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_ENTITY_METHOD_OUTPUT {
    #StructPack 4

    /**
     * Specifies the method identifier.
     */
    MethodType : UInt32

    /**
     * Receives the status of the method after execution.
     */
    MethodStatus : UInt32

    /**
     * Specifies the size, in bytes, of <b>OutputData</b>.
     */
    OutputSize : UInt32

    /**
     * Buffer for data returned by the method.
     */
    OutputData : Int8[1]

}
