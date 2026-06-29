#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains additional information about the status of an enrollment that is in progress.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-extended-enrollment-status
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_EXTENDED_ENROLLMENT_STATUS {
    #StructPack 8


    struct _Specific {

        struct _FacialFeatures {

            struct _OpaqueEngineData {
                AdapterId : Guid

                Data : UInt32[78]

            }

            BoundingBox : RECT

            Distance : Int32

            OpaqueEngineData : WINBIO_EXTENDED_ENROLLMENT_STATUS._Specific._FacialFeatures._OpaqueEngineData

        }

        struct _Fingerprint {
            GeneralSamples : UInt32

            Center : UInt32

            TopEdge : UInt32

            BottomEdge : UInt32

            LeftEdge : UInt32

            RightEdge : UInt32

        }

        struct _Iris {

            struct _Point3D {
                X : Float64

                Y : Float64

                Z : Float64

            }

            EyeBoundingBox_1 : RECT

            EyeBoundingBox_2 : RECT

            PupilCenter_1 : POINT

            PupilCenter_2 : POINT

            Distance : Int32

            GridPointCompletionPercent : UInt32

            GridPointIndex : UInt16

            Point3D : WINBIO_EXTENDED_ENROLLMENT_STATUS._Specific._Iris._Point3D

            StopCaptureAndShowCriticalFeedback : BOOL

        }

        struct _Voice {
            Reserved : UInt32

        }

        Null : UInt32

        static __New() {
            DefineProp(this.Prototype, 'FacialFeatures', { type: WINBIO_EXTENDED_ENROLLMENT_STATUS._Specific._FacialFeatures, offset: 0 })
            DefineProp(this.Prototype, 'Fingerprint', { type: WINBIO_EXTENDED_ENROLLMENT_STATUS._Specific._Fingerprint, offset: 0 })
            DefineProp(this.Prototype, 'Iris', { type: WINBIO_EXTENDED_ENROLLMENT_STATUS._Specific._Iris, offset: 0 })
            DefineProp(this.Prototype, 'Voice', { type: WINBIO_EXTENDED_ENROLLMENT_STATUS._Specific._Voice, offset: 0 })
            this.DeleteProp("__New")
        }
    }

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
     */
    TemplateStatus : HRESULT

    /**
     * The reason that the most recent sample is unusable, if the value of the **TemplateStatus** member is **WINBIO\_E\_BAD\_CAPTURE**.
     */
    RejectDetail : UInt32

    /**
     * The best estimate from the engine adapter for the percentage of the template that is complete, as a value from 0 to 100.
     */
    PercentComplete : UInt32

    /**
     * The type of biometric unit for which this structure contains information about capabilities and enrollment requirements of the engine adapter. For example, if the value of the **Factor** member is **WINBIO\_TYPE\_FINGERPRINT**, the [**WINBIO\_EXTENDED\_ENGINE\_INFO**](winbio-extended-engine-info.md) structure applies to a fingerprint reader and contains the relevant information in the **Specifc.Fingerprint** structure.
     */
    Factor : UInt32

    /**
     * A **WINBIO\_BIOMETRIC\_SUBTYPE** value that provides additional information about the enrollment.
     */
    SubFactor : Int8

    /**
     * Information about the status of an enrollment that is in progress for a specific biometric factor.
     */
    Specific : WINBIO_EXTENDED_ENROLLMENT_STATUS._Specific

}
