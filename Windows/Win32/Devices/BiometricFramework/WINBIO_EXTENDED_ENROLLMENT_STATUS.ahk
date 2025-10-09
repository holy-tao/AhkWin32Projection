#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains additional information about the status of an enrollment that is in progress.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-extended-enrollment-status
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_EXTENDED_ENROLLMENT_STATUS extends Win32Struct
{
    static sizeof => 376

    static packingSize => 8

    /**
     * The status of sample collection for the enrollment template. The following values are possible for this member.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                  | Meaning                                                        |
     * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
     * | <span id="S_OK"></span><span id="s_ok"></span><dl> <dt>**S\_OK**</dt> </dl>                                                                     | The enrollment is ready to be saved.<br/>                |
     * | <span id="WINBIO_E_INVALID_OPERATION"></span><span id="winbio_e_invalid_operation"></span><dl> <dt>**WINBIO\_E\_INVALID\_OPERATION**</dt> </dl> | No enrollment is in progress.<br/>                       |
     * | <span id="WINBIO_I_MORE_DATA"></span><span id="winbio_i_more_data"></span><dl> <dt>**WINBIO\_I\_MORE\_DATA**</dt> </dl>                         | More samples are required to complete the template.<br/> |
     * | <span id="WINBIO_E_BAD_CAPTURE"></span><span id="winbio_e_bad_capture"></span><dl> <dt>**WINBIO\_E\_BAD\_CAPTURE**</dt> </dl>                   | The most recent sample is not usable.<br/>               |
     * @type {HRESULT}
     */
    TemplateStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The reason that the most recent sample is unusable, if the value of the **TemplateStatus** member is **WINBIO\_E\_BAD\_CAPTURE**.
     * @type {Integer}
     */
    RejectDetail {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The best estimate from the engine adapter for the percentage of the template that is complete, as a value from 0 to 100.
     * @type {Integer}
     */
    PercentComplete {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The type of biometric unit for which this structure contains information about capabilities and enrollment requirements of the engine adapter. For example, if the value of the **Factor** member is **WINBIO\_TYPE\_FINGERPRINT**, the [**WINBIO\_EXTENDED\_ENGINE\_INFO**](winbio-extended-engine-info.md) structure applies to a fingerprint reader and contains the relevant information in the **Specifc.Fingerprint** structure.
     * @type {Integer}
     */
    Factor {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A **WINBIO\_BIOMETRIC\_SUBTYPE** value that provides additional information about the enrollment.
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
