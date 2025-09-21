#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\XSTATE_FEATURE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class XSTATE_CONFIG_FEATURE_MSC_INFO extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SizeOfInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ContextSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    EnabledFeatures {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<XSTATE_FEATURE>}
     */
    Features{
        get {
            if(!this.HasProp("__FeaturesProxyArray"))
                this.__FeaturesProxyArray := Win32FixedArray(this.ptr + 16, 64, XSTATE_FEATURE, "")
            return this.__FeaturesProxyArray
        }
    }
}
