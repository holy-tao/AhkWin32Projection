#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-presence-properties
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_PRESENCE_PROPERTIES extends Win32Struct
{
    static sizeof => 400

    static packingSize => 8

    class _FacialFeatures extends Win32Struct {
        static sizeof => 400
        static packingSize => 8

        class _OpaqueEngineData extends Win32Struct {
            static sizeof => 344
            static packingSize => 8
    
            /**
             * @type {Pointer<Guid>}
             */
            AdapterId {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {Array<UInt32>}
             */
            Data{
                get {
                    if(!this.HasProp("__DataProxyArray"))
                        this.__DataProxyArray := Win32FixedArray(this.ptr + 8, 78, Primitive, "uint")
                    return this.__DataProxyArray
                }
            }
        
        }
    
        /**
         * @type {RECT}
         */
        BoundingBox{
            get {
                if(!this.HasProp("__BoundingBox"))
                    this.__BoundingBox := RECT(0, this)
                return this.__BoundingBox
            }
        }
    
        /**
         * @type {Integer}
         */
        Distance {
            get => NumGet(this, 16, "int")
            set => NumPut("int", value, this, 16)
        }
    
        /**
         * @type {_OpaqueEngineData}
         */
        OpaqueEngineData{
            get {
                if(!this.HasProp("__OpaqueEngineData"))
                    this.__OpaqueEngineData := %this.__Class%._OpaqueEngineData(24, this)
                return this.__OpaqueEngineData
            }
        }
    
    }

    class _Iris extends Win32Struct {
        static sizeof => 400
        static packingSize => 8

        /**
         * @type {RECT}
         */
        EyeBoundingBox_1{
            get {
                if(!this.HasProp("__EyeBoundingBox_1"))
                    this.__EyeBoundingBox_1 := RECT(0, this)
                return this.__EyeBoundingBox_1
            }
        }
    
        /**
         * @type {RECT}
         */
        EyeBoundingBox_2{
            get {
                if(!this.HasProp("__EyeBoundingBox_2"))
                    this.__EyeBoundingBox_2 := RECT(16, this)
                return this.__EyeBoundingBox_2
            }
        }
    
        /**
         * @type {POINT}
         */
        PupilCenter_1{
            get {
                if(!this.HasProp("__PupilCenter_1"))
                    this.__PupilCenter_1 := POINT(32, this)
                return this.__PupilCenter_1
            }
        }
    
        /**
         * @type {POINT}
         */
        PupilCenter_2{
            get {
                if(!this.HasProp("__PupilCenter_2"))
                    this.__PupilCenter_2 := POINT(40, this)
                return this.__PupilCenter_2
            }
        }
    
        /**
         * @type {Integer}
         */
        Distance {
            get => NumGet(this, 48, "int")
            set => NumPut("int", value, this, 48)
        }
    
    }

    /**
     * @type {_FacialFeatures}
     */
    FacialFeatures{
        get {
            if(!this.HasProp("__FacialFeatures"))
                this.__FacialFeatures := %this.__Class%._FacialFeatures(0, this)
            return this.__FacialFeatures
        }
    }

    /**
     * @type {_Iris}
     */
    Iris{
        get {
            if(!this.HasProp("__Iris"))
                this.__Iris := %this.__Class%._Iris(0, this)
            return this.__Iris
        }
    }
}
