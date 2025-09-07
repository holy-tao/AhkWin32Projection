#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_PERFORMANCE_COUNTER extends Win32Struct
{
    static sizeof => 600

    static packingSize => 8

    /**
     * @type {Array<UInt64>}
     */
    NbOfAllocationEvicted{
        get {
            if(!this.HasProp("__NbOfAllocationEvictedProxyArray"))
                this.__NbOfAllocationEvictedProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "uint")
            return this.__NbOfAllocationEvictedProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    NbOfAllocationMarked{
        get {
            if(!this.HasProp("__NbOfAllocationMarkedProxyArray"))
                this.__NbOfAllocationMarkedProxyArray := Win32FixedArray(this.ptr + 80, 8, Primitive, "uint")
            return this.__NbOfAllocationMarkedProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    NbOfAllocationRestored{
        get {
            if(!this.HasProp("__NbOfAllocationRestoredProxyArray"))
                this.__NbOfAllocationRestoredProxyArray := Win32FixedArray(this.ptr + 160, 8, Primitive, "uint")
            return this.__NbOfAllocationRestoredProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    KBytesEvicted{
        get {
            if(!this.HasProp("__KBytesEvictedProxyArray"))
                this.__KBytesEvictedProxyArray := Win32FixedArray(this.ptr + 240, 8, Primitive, "uint")
            return this.__KBytesEvictedProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    KBytesMarked{
        get {
            if(!this.HasProp("__KBytesMarkedProxyArray"))
                this.__KBytesMarkedProxyArray := Win32FixedArray(this.ptr + 320, 8, Primitive, "uint")
            return this.__KBytesMarkedProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    KBytesRestored{
        get {
            if(!this.HasProp("__KBytesRestoredProxyArray"))
                this.__KBytesRestoredProxyArray := Win32FixedArray(this.ptr + 400, 8, Primitive, "uint")
            return this.__KBytesRestoredProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NbProcessCommited {
        get => NumGet(this, 480, "uint")
        set => NumPut("uint", value, this, 480)
    }

    /**
     * @type {Integer}
     */
    NbAllocationCommited {
        get => NumGet(this, 488, "uint")
        set => NumPut("uint", value, this, 488)
    }

    /**
     * @type {Integer}
     */
    NbAllocationMarked {
        get => NumGet(this, 496, "uint")
        set => NumPut("uint", value, this, 496)
    }

    /**
     * @type {Integer}
     */
    KBytesAllocated {
        get => NumGet(this, 504, "uint")
        set => NumPut("uint", value, this, 504)
    }

    /**
     * @type {Integer}
     */
    KBytesAvailable {
        get => NumGet(this, 512, "uint")
        set => NumPut("uint", value, this, 512)
    }

    /**
     * @type {Integer}
     */
    KBytesCurMarked {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }

    /**
     * @type {Integer}
     */
    Reference {
        get => NumGet(this, 528, "uint")
        set => NumPut("uint", value, this, 528)
    }

    /**
     * @type {Integer}
     */
    Unreference {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }

    /**
     * @type {Integer}
     */
    TrueReference {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }

    /**
     * @type {Integer}
     */
    NbOfPageIn {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * @type {Integer}
     */
    KBytesPageIn {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }

    /**
     * @type {Integer}
     */
    NbOfPageOut {
        get => NumGet(this, 568, "uint")
        set => NumPut("uint", value, this, 568)
    }

    /**
     * @type {Integer}
     */
    KBytesPageOut {
        get => NumGet(this, 576, "uint")
        set => NumPut("uint", value, this, 576)
    }

    /**
     * @type {Integer}
     */
    NbOfRotateOut {
        get => NumGet(this, 584, "uint")
        set => NumPut("uint", value, this, 584)
    }

    /**
     * @type {Integer}
     */
    KBytesRotateOut {
        get => NumGet(this, 592, "uint")
        set => NumPut("uint", value, this, 592)
    }
}
