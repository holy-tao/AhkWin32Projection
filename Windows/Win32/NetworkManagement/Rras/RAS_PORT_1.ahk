#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The RAS_PORT_1 structure contains detailed information regarding a specific RAS port, such as line speed or errors. For more general information about a port, such as port condition or port name, see RAS_PORT_0.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_port_1
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_PORT_1 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Handle to the port.
     * @type {HANDLE}
     */
    hPort{
        get {
            if(!this.HasProp("__hPort"))
                this.__hPort := HANDLE(this.ptr + 0)
            return this.__hPort
        }
    }

    /**
     * Handle to the connection.
     * @type {HANDLE}
     */
    hConnection{
        get {
            if(!this.HasProp("__hConnection"))
                this.__hConnection := HANDLE(this.ptr + 8)
            return this.__hConnection
        }
    }

    /**
     * Specifies a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-ras_hardware_condition">RAS_HARDWARE_CONDITION</a> structure.
     * @type {Integer}
     */
    dwHardwareCondition {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Specifies the line speed of the port, represented in bits per second.
     * @type {Integer}
     */
    dwLineSpeed {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the bytes transmitted on the port. This value is the number of bytes of compressed data.
     * @type {Integer}
     */
    dwBytesXmited {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the bytes received on the port. This value is the number of bytes of compressed data.
     * @type {Integer}
     */
    dwBytesRcved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies the frames transmitted on the port.
     * @type {Integer}
     */
    dwFramesXmited {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies the frames received on the port.
     * @type {Integer}
     */
    dwFramesRcved {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the CRC errors on the port.
     * @type {Integer}
     */
    dwCrcErr {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the time-out errors on the port.
     * @type {Integer}
     */
    dwTimeoutErr {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Specifies the alignment errors on the port.
     * @type {Integer}
     */
    dwAlignmentErr {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Specifies the hardware overrun errors on the port.
     * @type {Integer}
     */
    dwHardwareOverrunErr {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Specifies the framing errors on the port.
     * @type {Integer}
     */
    dwFramingErr {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies the buffer overrun errors on the port.
     * @type {Integer}
     */
    dwBufferOverrunErr {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Specifies a percentage that indicates the degree to which data received on this connection is compressed. The ratio is the size of the compressed data divided by the size of the same data in an uncompressed state.
     * @type {Integer}
     */
    dwCompressionRatioIn {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Specifies a percentage indicating the degree to which data transmitted on this connection is compressed. The ratio is the size of the compressed data divided by the size of the same data in an uncompressed state.
     * @type {Integer}
     */
    dwCompressionRatioOut {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
