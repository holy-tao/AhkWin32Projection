#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\RAS_HARDWARE_CONDITION.ahk" { RAS_HARDWARE_CONDITION }

/**
 * The RAS_PORT_1 structure contains detailed information regarding a specific RAS port, such as line speed or errors. For more general information about a port, such as port condition or port name, see RAS_PORT_0.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_port_1
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_PORT_1 {
    #StructPack 8

    /**
     * Handle to the port.
     */
    hPort : HANDLE

    /**
     * Handle to the connection.
     */
    hConnection : HANDLE

    /**
     * Specifies a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-ras_hardware_condition">RAS_HARDWARE_CONDITION</a> structure.
     */
    dwHardwareCondition : RAS_HARDWARE_CONDITION

    /**
     * Specifies the line speed of the port, represented in bits per second.
     */
    dwLineSpeed : UInt32

    /**
     * Specifies the bytes transmitted on the port. This value is the number of bytes of compressed data.
     */
    dwBytesXmited : UInt32

    /**
     * Specifies the bytes received on the port. This value is the number of bytes of compressed data.
     */
    dwBytesRcved : UInt32

    /**
     * Specifies the frames transmitted on the port.
     */
    dwFramesXmited : UInt32

    /**
     * Specifies the frames received on the port.
     */
    dwFramesRcved : UInt32

    /**
     * Specifies the CRC errors on the port.
     */
    dwCrcErr : UInt32

    /**
     * Specifies the time-out errors on the port.
     */
    dwTimeoutErr : UInt32

    /**
     * Specifies the alignment errors on the port.
     */
    dwAlignmentErr : UInt32

    /**
     * Specifies the hardware overrun errors on the port.
     */
    dwHardwareOverrunErr : UInt32

    /**
     * Specifies the framing errors on the port.
     */
    dwFramingErr : UInt32

    /**
     * Specifies the buffer overrun errors on the port.
     */
    dwBufferOverrunErr : UInt32

    /**
     * Specifies a percentage that indicates the degree to which data received on this connection is compressed. The ratio is the size of the compressed data divided by the size of the same data in an uncompressed state.
     */
    dwCompressionRatioIn : UInt32

    /**
     * Specifies a percentage indicating the degree to which data transmitted on this connection is compressed. The ratio is the size of the compressed data divided by the size of the same data in an uncompressed state.
     */
    dwCompressionRatioOut : UInt32

}
