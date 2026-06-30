#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHEA_ERROR_TYPE.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_TYPE.ahk
#Include .\WHEA_ERROR_SEVERITY.ahk
#Include .\WHEA_RAW_DATA_FORMAT.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_ERROR_PACKET_V1 extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    class _u extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer}
         */
        ProcessorError {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        MemoryError {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        NmiError {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        PciExpressError {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        PciXBusError {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        PciXDeviceError {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        PmemError {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    }

    /**
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    RawDataLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Context {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {WHEA_ERROR_TYPE}
     */
    ErrorType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {WHEA_ERROR_SEVERITY}
     */
    ErrorSeverity {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    ErrorSourceId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {WHEA_ERROR_SOURCE_TYPE}
     */
    ErrorSourceType {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    Cpu {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {_u}
     */
    u {
        get {
            if(!this.HasProp("__u"))
                this.__u := WHEA_ERROR_PACKET_V1._u(72, this)
            return this.__u
        }
    }

    /**
     * @type {WHEA_RAW_DATA_FORMAT}
     */
    RawDataFormat {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    RawDataOffset {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Array<Integer>}
     */
    RawData {
        get {
            if(!this.HasProp("__RawDataProxyArray"))
                this.__RawDataProxyArray := Win32FixedArray(this.ptr + 88, 1, Primitive, "char")
            return this.__RawDataProxyArray
        }
    }
}
