#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_OPERATION.ahk" { WSD_OPERATION }
#Import ".\WSD_PROTOCOL_TYPE.ahk" { WSD_PROTOCOL_TYPE }

/**
 * Supplies data about a port type.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_port_type
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_PORT_TYPE {
    #StructPack 8

    /**
     * The encoded qualified name of the port type.
     */
    EncodedName : UInt32

    /**
     * The number of operations in the array referenced by the <b>Operations</b> member.
     */
    OperationCount : UInt32

    /**
     * Reference to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specifies the operations comprising the port type.
     */
    Operations : WSD_OPERATION.Ptr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ne-wsdtypes-wsd_protocol_type">WSD_PROTOCOL_TYPE</a> value that specifies the protocol(s) supported by the port type.
     */
    ProtocolType : WSD_PROTOCOL_TYPE

}
