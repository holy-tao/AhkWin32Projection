#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_PROFILE_MEDIAINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    class _Resolution extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Integer}
         */
        X {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Y {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _MaxFrameRate extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Numerator {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Denominator {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    /**
     * @type {_Resolution}
     */
    Resolution{
        get {
            if(!this.HasProp("__Resolution"))
                this.__Resolution := %this.__Class%._Resolution(0, this)
            return this.__Resolution
        }
    }

    /**
     * @type {_MaxFrameRate}
     */
    MaxFrameRate{
        get {
            if(!this.HasProp("__MaxFrameRate"))
                this.__MaxFrameRate := %this.__Class%._MaxFrameRate(8, this)
            return this.__MaxFrameRate
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Data0 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Data1 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Data2 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Data3 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
