#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains biometric values that the Windows Biometric Framework used to determine that an individual was present.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-presence-properties
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_PRESENCE_PROPERTIES extends Win32Struct
{
    static sizeof => 400

    static packingSize => 8

    class _FacialFeatures extends Win32Struct {
        static sizeof => 344
        static packingSize => 8

        class _OpaqueEngineData extends Win32Struct {
            static sizeof => 320
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
        static sizeof => 56
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
     * Values for the location of facial features that the Windows Biometric Framework used to determine that an individual was present.
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
     * Values for iris location that the Windows Biometric Framework used to determine that an individual was present.
     * 
     * 
     * **EyeBoundingBox\_1**
     * 
     * The position within the camera frame of one of the irises of the individual to enroll, in pixels. If the iris-recognition system is only monitoring one eye, this position is of the iris of that eye. If the iris-recognition system is monitoring both eyes, but only one eye is in the camera frame, this position is of the iris of the eye in the camera frame. If the iris-recognition system is monitoring both eyes, and both eyes are in the camera frame, this position is probably of the iris of the right eye of the individual.
     * 
     * The size of the camera frame determines the upper limit on the number of pixels for this position. Get the **WINBIO\_PROPERTY\_EXTENDED\_SENSOR\_INFO** property to determine the size of the camera frame. A client that uses the presence monitor must perform the scaling operation to map the position to the camera frame.
     * 
     * 
     * **EyeBoundingBox\_2**
     * 
     * The position within the camera frame of one of the irises of the individual to enroll, in pixels. If the iris-recognition system is only monitoring one eye, or if only one eye is in the camera frame, this value is empty. If the iris-recognition system is monitoring both eyes, and both eyes are in the camera frame, this position is probably of iris of the left eye of the individual.
     * 
     * The size of the camera frame determines the upper limit on the number of pixels for this position. Get the **WINBIO\_PROPERTY\_EXTENDED\_SENSOR\_INFO** property to determine the size of the camera frame. A client that uses the presence monitor must perform the scaling operation to map the position to the camera frame.
     * 
     * 
     * **PupilCenter\_1**
     * 
     * The position of the center of one of the pupils of the individual to enroll. If the iris-recognition system is only monitoring one eye, this position is of the center of the pupil of that eye. If the iris-recognition system is monitoring both eyes, but only one eye is in the camera frame, this position is of the center of the pupil of the eye in the camera frame. If the iris-recognition system is monitoring both eyes, and both eyes are in the camera frame, this position is probably of the center of the pupil of the right eye of the individual.
     * 
     * 
     * **PupilCenter\_2**
     * 
     * The position of the center of one of the pupils of the individual to enroll. If the iris-recognition system is only monitoring one eye, or if only one eye is in the camera frame, this value is empty. If the iris-recognition system is monitoring both eyes, and both eyes are in the camera frame, this position is probably of the center of the pupil of the left eye of the individual.
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
