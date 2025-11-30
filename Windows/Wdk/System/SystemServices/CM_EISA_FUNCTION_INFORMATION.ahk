#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EISA_MEMORY_CONFIGURATION.ahk
#Include .\EISA_IRQ_CONFIGURATION.ahk
#Include .\EISA_DMA_CONFIGURATION.ahk
#Include .\EISA_PORT_CONFIGURATION.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class CM_EISA_FUNCTION_INFORMATION extends Win32Struct
{
    static sizeof => 504

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CompressedId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    IdSlotFlags1 {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    IdSlotFlags2 {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    MinorRevision {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    MajorRevision {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Array<Byte>}
     */
    Selections{
        get {
            if(!this.HasProp("__SelectionsProxyArray"))
                this.__SelectionsProxyArray := Win32FixedArray(this.ptr + 8, 26, Primitive, "char")
            return this.__SelectionsProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    FunctionFlags {
        get => NumGet(this, 34, "char")
        set => NumPut("char", value, this, 34)
    }

    /**
     * @type {Array<Byte>}
     */
    TypeString{
        get {
            if(!this.HasProp("__TypeStringProxyArray"))
                this.__TypeStringProxyArray := Win32FixedArray(this.ptr + 35, 80, Primitive, "char")
            return this.__TypeStringProxyArray
        }
    }

    /**
     * @type {Array<EISA_MEMORY_CONFIGURATION>}
     */
    EisaMemory{
        get {
            if(!this.HasProp("__EisaMemoryProxyArray"))
                this.__EisaMemoryProxyArray := Win32FixedArray(this.ptr + 120, 9, Primitive, "ptr")
            return this.__EisaMemoryProxyArray
        }
    }

    /**
     * @type {Array<EISA_IRQ_CONFIGURATION>}
     */
    EisaIrq{
        get {
            if(!this.HasProp("__EisaIrqProxyArray"))
                this.__EisaIrqProxyArray := Win32FixedArray(this.ptr + 192, 7, Primitive, "ptr")
            return this.__EisaIrqProxyArray
        }
    }

    /**
     * @type {Array<EISA_DMA_CONFIGURATION>}
     */
    EisaDma{
        get {
            if(!this.HasProp("__EisaDmaProxyArray"))
                this.__EisaDmaProxyArray := Win32FixedArray(this.ptr + 248, 4, Primitive, "ptr")
            return this.__EisaDmaProxyArray
        }
    }

    /**
     * @type {Array<EISA_PORT_CONFIGURATION>}
     */
    EisaPort{
        get {
            if(!this.HasProp("__EisaPortProxyArray"))
                this.__EisaPortProxyArray := Win32FixedArray(this.ptr + 280, 20, Primitive, "ptr")
            return this.__EisaPortProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    InitializationData{
        get {
            if(!this.HasProp("__InitializationDataProxyArray"))
                this.__InitializationDataProxyArray := Win32FixedArray(this.ptr + 440, 60, Primitive, "char")
            return this.__InitializationDataProxyArray
        }
    }
}
