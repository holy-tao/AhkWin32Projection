#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_EXTENDED_SENSOR_INFO extends Win32Struct
{
    static sizeof => 1096

    static packingSize => 8

    /**
     * @type {Integer}
     */
    GenericSensorCapabilities {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Factor {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    class _FacialFeatures extends Win32Struct {
        static sizeof => 1084
        static packingSize => 8

        class _HardwareInfo extends Win32Struct {
            static sizeof => 1080
            static packingSize => 8
    
            /**
             * @type {String}
             */
            ColorSensorId {
                get => StrGet(this.ptr + 0, 259, "UTF-16")
                set => StrPut(value, this.ptr + 0, 259, "UTF-16")
            }
        
            /**
             * @type {String}
             */
            InfraredSensorId {
                get => StrGet(this.ptr + 520, 259, "UTF-16")
                set => StrPut(value, this.ptr + 520, 259, "UTF-16")
            }
        
            /**
             * @type {Integer}
             */
            InfraredSensorRotationAngle {
                get => NumGet(this, 1040, "uint")
                set => NumPut("uint", value, this, 1040)
            }
        
        }
    
        /**
         * @type {RECT}
         */
        FrameSize{
            get {
                if(!this.HasProp("__FrameSize"))
                    this.__FrameSize := RECT(this.ptr + 0)
                return this.__FrameSize
            }
        }
    
        /**
         * @type {POINT}
         */
        FrameOffset{
            get {
                if(!this.HasProp("__FrameOffset"))
                    this.__FrameOffset := POINT(this.ptr + 16)
                return this.__FrameOffset
            }
        }
    
        /**
         * @type {Integer}
         */
        MandatoryOrientation {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {_HardwareInfo}
         */
        HardwareInfo{
            get {
                if(!this.HasProp("__HardwareInfo"))
                    this.__HardwareInfo := %this.__Class%._HardwareInfo(this.ptr + 32)
                return this.__HardwareInfo
            }
        }
    
    }

    class _Iris extends Win32Struct {
        static sizeof => 1084
        static packingSize => 8

        /**
         * @type {RECT}
         */
        FrameSize{
            get {
                if(!this.HasProp("__FrameSize"))
                    this.__FrameSize := RECT(this.ptr + 0)
                return this.__FrameSize
            }
        }
    
        /**
         * @type {POINT}
         */
        FrameOffset{
            get {
                if(!this.HasProp("__FrameOffset"))
                    this.__FrameOffset := POINT(this.ptr + 16)
                return this.__FrameOffset
            }
        }
    
        /**
         * @type {Integer}
         */
        MandatoryOrientation {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
    }

    /**
     * @type {Integer}
     */
    Null {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {_FacialFeatures}
     */
    FacialFeatures{
        get {
            if(!this.HasProp("__FacialFeatures"))
                this.__FacialFeatures := %this.__Class%._FacialFeatures(this.ptr + 8)
            return this.__FacialFeatures
        }
    }

    /**
     * @type {Integer}
     */
    Fingerprint {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {_Iris}
     */
    Iris{
        get {
            if(!this.HasProp("__Iris"))
                this.__Iris := %this.__Class%._Iris(this.ptr + 8)
            return this.__Iris
        }
    }

    /**
     * @type {Integer}
     */
    Voice {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
