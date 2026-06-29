#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RTM_ENTITY_METHOD_INPUT structure is used to pass information to a client when invoking its method.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_entity_method_input
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_ENTITY_METHOD_INPUT {
    #StructPack 4

    /**
     * Specifies the method.
     */
    MethodType : UInt32

    /**
     * Specifies the size, in bytes, of <b>InputData</b>.
     */
    InputSize : UInt32

    /**
     * Buffer for input data for the method.
     */
    InputData : Int8[1]

}
