#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PARAM_BUFFER structure describes the format of the parameter buffer that can be included in the CONTROL_SERVICE structure.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-param_buffer
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct PARAM_BUFFER {
    #StructPack 4

    /**
     * Parameter ID, as defined by INTSERV.
     */
    ParameterId : UInt32

    /**
     * Length of the entire <b>PARAM_BUFFER</b> structure.
     */
    Length : UInt32

    /**
     * Buffer containing the parameter.
     */
    Buffer : Int8[1]

}
