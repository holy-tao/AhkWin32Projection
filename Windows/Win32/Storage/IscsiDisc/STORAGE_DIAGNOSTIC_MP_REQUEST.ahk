#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MP_STORAGE_DIAGNOSTIC_LEVEL.ahk
#Include .\MP_STORAGE_DIAGNOSTIC_TARGET_TYPE.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
class STORAGE_DIAGNOSTIC_MP_REQUEST extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {MP_STORAGE_DIAGNOSTIC_TARGET_TYPE}
     */
    TargetType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {MP_STORAGE_DIAGNOSTIC_LEVEL}
     */
    Level {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Guid}
     */
    ProviderId {
        get {
            if(!this.HasProp("__ProviderId"))
                this.__ProviderId := Guid(16, this)
            return this.__ProviderId
        }
    }

    /**
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Array<Integer>}
     */
    DataBuffer {
        get {
            if(!this.HasProp("__DataBufferProxyArray"))
                this.__DataBufferProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__DataBufferProxyArray
        }
    }
}
