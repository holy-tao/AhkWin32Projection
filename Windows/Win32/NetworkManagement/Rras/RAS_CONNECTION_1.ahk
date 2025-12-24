#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\PPP_NBFCP_INFO.ahk
#Include .\PPP_IPCP_INFO.ahk
#Include .\PPP_IPXCP_INFO.ahk
#Include .\PPP_ATCP_INFO.ahk
#Include .\PPP_INFO.ahk

/**
 * The RAS_CONNECTION_1 structure contains detailed information regarding a specific connection, such as error counts and bytes received. For more general information about a specific connection, such as user name or domain, see RAS_CONNECTION_0.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_connection_1
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_CONNECTION_1 extends Win32Struct
{
    static sizeof => 296

    static packingSize => 8

    /**
     * A handle to the connection.
     * @type {HANDLE}
     */
    hConnection{
        get {
            if(!this.HasProp("__hConnection"))
                this.__hConnection := HANDLE(0, this)
            return this.__hConnection
        }
    }

    /**
     * A handle to the interface.
     * @type {HANDLE}
     */
    hInterface{
        get {
            if(!this.HasProp("__hInterface"))
                this.__hInterface := HANDLE(8, this)
            return this.__hInterface
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_info">PPP_INFO</a> structure that contains Point-to-Point (PPP) projection operation information for a connection.
     * @type {PPP_INFO}
     */
    PppInfo{
        get {
            if(!this.HasProp("__PppInfo"))
                this.__PppInfo := PPP_INFO(16, this)
            return this.__PppInfo
        }
    }

    /**
     * A value that specifies the number of bytes transmitted on the connection.
     * @type {Integer}
     */
    dwBytesXmited {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * A value that specifies the number of bytes received on the connection.
     * @type {Integer}
     */
    dwBytesRcved {
        get => NumGet(this, 252, "uint")
        set => NumPut("uint", value, this, 252)
    }

    /**
     * A value that specifies the number of frames transmitted on the connection.
     * @type {Integer}
     */
    dwFramesXmited {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * A value that specifies the number of frames received on the connection.
     * @type {Integer}
     */
    dwFramesRcved {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * A value that specifies the number of Cyclic Redundancy Check (CRC) errors on the connection.
     * @type {Integer}
     */
    dwCrcErr {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * A value that specifies the number of time-out errors on the connection.
     * @type {Integer}
     */
    dwTimeoutErr {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * A value that specifies the number of alignment errors on the connection.
     * @type {Integer}
     */
    dwAlignmentErr {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * A value that specifies the number of hardware overrun errors on the connection.
     * @type {Integer}
     */
    dwHardwareOverrunErr {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * A value that specifies the number of framing errors on the connection.
     * @type {Integer}
     */
    dwFramingErr {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * A value that specifies the number of buffer overrun errors on the connection.
     * @type {Integer}
     */
    dwBufferOverrunErr {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }

    /**
     * A value that specifies the percentage by which data received on this connection is compressed. <b>dwCompressionRatioIn</b> is the size of the compressed data divided by the size of the same data in an uncompressed state.
     * @type {Integer}
     */
    dwCompressionRatioIn {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * A value that specifies the percentage by which data transmitted on this connection is compressed. The ratio is the size of the compressed data divided by the size of the same data in an uncompressed state.
     * @type {Integer}
     */
    dwCompressionRatioOut {
        get => NumGet(this, 292, "uint")
        set => NumPut("uint", value, this, 292)
    }
}
