#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\DEVCAPS.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_EXTDEVICE_S extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {DEVCAPS}
     */
    Capabilities{
        get {
            if(!this.HasProp("__Capabilities"))
                this.__Capabilities := DEVCAPS(this.ptr + 16)
            return this.__Capabilities
        }
    }

    /**
     * @type {Integer}
     */
    DevPort {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PowerState {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    pawchString {
        get => StrGet(this.ptr + 16, 259, "UTF-16")
        set => StrPut(value, this.ptr + 16, 259, "UTF-16")
    }

    /**
     * @type {Array<UInt32>}
     */
    NodeUniqueID{
        get {
            if(!this.HasProp("__NodeUniqueIDProxyArray"))
                this.__NodeUniqueIDProxyArray := Win32FixedArray(this.ptr + 16, 2, Primitive, "uint")
            return this.__NodeUniqueIDProxyArray
        }
    }
}
