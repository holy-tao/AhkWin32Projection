#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_PORT_2 extends Win32Struct
{
    static sizeof => 496

    static packingSize => 8

    /**
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
     * @type {Integer}
     */
    dwConn_State {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    wszPortName {
        get => StrGet(this.ptr + 20, 16, "UTF-16")
        set => StrPut(value, this.ptr + 20, 16, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszMediaName {
        get => StrGet(this.ptr + 54, 16, "UTF-16")
        set => StrPut(value, this.ptr + 54, 16, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszDeviceName {
        get => StrGet(this.ptr + 88, 128, "UTF-16")
        set => StrPut(value, this.ptr + 88, 128, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszDeviceType {
        get => StrGet(this.ptr + 346, 16, "UTF-16")
        set => StrPut(value, this.ptr + 346, 16, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwHardwareCondition {
        get => NumGet(this, 380, "int")
        set => NumPut("int", value, this, 380)
    }

    /**
     * @type {Integer}
     */
    dwLineSpeed {
        get => NumGet(this, 384, "uint")
        set => NumPut("uint", value, this, 384)
    }

    /**
     * @type {Integer}
     */
    dwCrcErr {
        get => NumGet(this, 388, "uint")
        set => NumPut("uint", value, this, 388)
    }

    /**
     * @type {Integer}
     */
    dwSerialOverRunErrs {
        get => NumGet(this, 392, "uint")
        set => NumPut("uint", value, this, 392)
    }

    /**
     * @type {Integer}
     */
    dwTimeoutErr {
        get => NumGet(this, 396, "uint")
        set => NumPut("uint", value, this, 396)
    }

    /**
     * @type {Integer}
     */
    dwAlignmentErr {
        get => NumGet(this, 400, "uint")
        set => NumPut("uint", value, this, 400)
    }

    /**
     * @type {Integer}
     */
    dwHardwareOverrunErr {
        get => NumGet(this, 404, "uint")
        set => NumPut("uint", value, this, 404)
    }

    /**
     * @type {Integer}
     */
    dwFramingErr {
        get => NumGet(this, 408, "uint")
        set => NumPut("uint", value, this, 408)
    }

    /**
     * @type {Integer}
     */
    dwBufferOverrunErr {
        get => NumGet(this, 412, "uint")
        set => NumPut("uint", value, this, 412)
    }

    /**
     * @type {Integer}
     */
    dwCompressionRatioIn {
        get => NumGet(this, 416, "uint")
        set => NumPut("uint", value, this, 416)
    }

    /**
     * @type {Integer}
     */
    dwCompressionRatioOut {
        get => NumGet(this, 420, "uint")
        set => NumPut("uint", value, this, 420)
    }

    /**
     * @type {Integer}
     */
    dwTotalErrors {
        get => NumGet(this, 424, "uint")
        set => NumPut("uint", value, this, 424)
    }

    /**
     * @type {Integer}
     */
    ullBytesXmited {
        get => NumGet(this, 432, "uint")
        set => NumPut("uint", value, this, 432)
    }

    /**
     * @type {Integer}
     */
    ullBytesRcved {
        get => NumGet(this, 440, "uint")
        set => NumPut("uint", value, this, 440)
    }

    /**
     * @type {Integer}
     */
    ullFramesXmited {
        get => NumGet(this, 448, "uint")
        set => NumPut("uint", value, this, 448)
    }

    /**
     * @type {Integer}
     */
    ullFramesRcved {
        get => NumGet(this, 456, "uint")
        set => NumPut("uint", value, this, 456)
    }

    /**
     * @type {Integer}
     */
    ullBytesTxUncompressed {
        get => NumGet(this, 464, "uint")
        set => NumPut("uint", value, this, 464)
    }

    /**
     * @type {Integer}
     */
    ullBytesTxCompressed {
        get => NumGet(this, 472, "uint")
        set => NumPut("uint", value, this, 472)
    }

    /**
     * @type {Integer}
     */
    ullBytesRcvUncompressed {
        get => NumGet(this, 480, "uint")
        set => NumPut("uint", value, this, 480)
    }

    /**
     * @type {Integer}
     */
    ullBytesRcvCompressed {
        get => NumGet(this, 488, "uint")
        set => NumPut("uint", value, this, 488)
    }
}
