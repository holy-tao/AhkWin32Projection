#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Supplies data about a port type.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_port_type
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_PORT_TYPE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The encoded qualified name of the port type.
     * @type {Integer}
     */
    EncodedName {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of operations in the array referenced by the <b>Operations</b> member.
     * @type {Integer}
     */
    OperationCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reference to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specifies the operations comprising the port type.
     * @type {Pointer<WSD_OPERATION>}
     */
    Operations {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ne-wsdtypes-wsd_protocol_type">WSD_PROTOCOL_TYPE</a> value that specifies the protocol(s) supported by the port type.
     * @type {Integer}
     */
    ProtocolType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
