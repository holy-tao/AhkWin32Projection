#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_EXTENDED_ENROLLMENT_STATUS extends Win32Struct
{
    static sizeof => 376

    static packingSize => 8

    /**
     * @type {HRESULT}
     */
    TemplateStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RejectDetail {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PercentComplete {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Factor {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    SubFactor {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    class _FacialFeatures extends Win32Struct {
        static sizeof => 348
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
                    this.__BoundingBox := RECT(this.ptr + 0)
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
                    this.__OpaqueEngineData := %this.__Class%._OpaqueEngineData(this.ptr + 24)
                return this.__OpaqueEngineData
            }
        }
    
    }

    class _Fingerprint extends Win32Struct {
        static sizeof => 348
        static packingSize => 8

        /**
         * @type {Integer}
         */
        GeneralSamples {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Center {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        TopEdge {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        BottomEdge {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        LeftEdge {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        RightEdge {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
    }

    class _Iris extends Win32Struct {
        static sizeof => 348
        static packingSize => 8

        class _Point3D extends Win32Struct {
            static sizeof => 96
            static packingSize => 8
    
            /**
             * @type {Float}
             */
            X {
                get => NumGet(this, 0, "double")
                set => NumPut("double", value, this, 0)
            }
        
            /**
             * @type {Float}
             */
            Y {
                get => NumGet(this, 8, "double")
                set => NumPut("double", value, this, 8)
            }
        
            /**
             * @type {Float}
             */
            Z {
                get => NumGet(this, 16, "double")
                set => NumPut("double", value, this, 16)
            }
        
        }
    
        /**
         * @type {RECT}
         */
        EyeBoundingBox_1{
            get {
                if(!this.HasProp("__EyeBoundingBox_1"))
                    this.__EyeBoundingBox_1 := RECT(this.ptr + 0)
                return this.__EyeBoundingBox_1
            }
        }
    
        /**
         * @type {RECT}
         */
        EyeBoundingBox_2{
            get {
                if(!this.HasProp("__EyeBoundingBox_2"))
                    this.__EyeBoundingBox_2 := RECT(this.ptr + 16)
                return this.__EyeBoundingBox_2
            }
        }
    
        /**
         * @type {POINT}
         */
        PupilCenter_1{
            get {
                if(!this.HasProp("__PupilCenter_1"))
                    this.__PupilCenter_1 := POINT(this.ptr + 32)
                return this.__PupilCenter_1
            }
        }
    
        /**
         * @type {POINT}
         */
        PupilCenter_2{
            get {
                if(!this.HasProp("__PupilCenter_2"))
                    this.__PupilCenter_2 := POINT(this.ptr + 40)
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
    
        /**
         * @type {Integer}
         */
        GridPointCompletionPercent {
            get => NumGet(this, 52, "uint")
            set => NumPut("uint", value, this, 52)
        }
    
        /**
         * @type {Integer}
         */
        GridPointIndex {
            get => NumGet(this, 56, "ushort")
            set => NumPut("ushort", value, this, 56)
        }
    
        /**
         * @type {_Point3D}
         */
        Point3D{
            get {
                if(!this.HasProp("__Point3D"))
                    this.__Point3D := %this.__Class%._Point3D(this.ptr + 64)
                return this.__Point3D
            }
        }
    
        /**
         * @type {Integer}
         */
        StopCaptureAndShowCriticalFeedback {
            get => NumGet(this, 88, "int")
            set => NumPut("int", value, this, 88)
        }
    
    }

    /**
     * @type {Integer}
     */
    Null {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {_FacialFeatures}
     */
    FacialFeatures{
        get {
            if(!this.HasProp("__FacialFeatures"))
                this.__FacialFeatures := %this.__Class%._FacialFeatures(this.ptr + 24)
            return this.__FacialFeatures
        }
    }

    /**
     * @type {_Fingerprint}
     */
    Fingerprint{
        get {
            if(!this.HasProp("__Fingerprint"))
                this.__Fingerprint := %this.__Class%._Fingerprint(this.ptr + 24)
            return this.__Fingerprint
        }
    }

    /**
     * @type {_Iris}
     */
    Iris{
        get {
            if(!this.HasProp("__Iris"))
                this.__Iris := %this.__Class%._Iris(this.ptr + 24)
            return this.__Iris
        }
    }

    /**
     * @type {Integer}
     */
    Voice {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
