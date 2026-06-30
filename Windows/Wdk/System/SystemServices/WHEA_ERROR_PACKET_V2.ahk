#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHEA_ERROR_TYPE.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_TYPE.ahk
#Include .\WHEA_ERROR_SEVERITY.ahk
#Include .\WHEA_ERROR_PACKET_DATA_FORMAT.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_ERROR_PACKET_V2 extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {WHEA_ERROR_TYPE}
     */
    ErrorType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {WHEA_ERROR_SEVERITY}
     */
    ErrorSeverity {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    ErrorSourceId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {WHEA_ERROR_SOURCE_TYPE}
     */
    ErrorSourceType {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Guid}
     */
    NotifyType {
        get {
            if(!this.HasProp("__NotifyType"))
                this.__NotifyType := Guid(40, this)
            return this.__NotifyType
        }
    }

    /**
     * @type {Integer}
     */
    Context {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {WHEA_ERROR_PACKET_DATA_FORMAT}
     */
    DataFormat {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    DataOffset {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    PshedDataOffset {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    PshedDataLength {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }
}
