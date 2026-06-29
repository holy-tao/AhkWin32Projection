#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about the capabilities and enrollment requirements of the sensor adapter for a biometric unit.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-extended-sensor-info
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_EXTENDED_SENSOR_INFO {
    #StructPack 4


    struct _Specific {

        struct _FacialFeatures {

            struct _HardwareInfo {
                ColorSensorId : WCHAR[260]

                InfraredSensorId : WCHAR[260]

                InfraredSensorRotationAngle : UInt32

            }

            FrameSize : RECT

            FrameOffset : POINT

            MandatoryOrientation : UInt32

            HardwareInfo : WINBIO_EXTENDED_SENSOR_INFO._Specific._FacialFeatures._HardwareInfo

        }

        struct _Fingerprint {
            Reserved : UInt32

        }

        struct _Iris {
            FrameSize : RECT

            FrameOffset : POINT

            MandatoryOrientation : UInt32

        }

        struct _Voice {
            Reserved : UInt32

        }

        Null : UInt32

        static __New() {
            DefineProp(this.Prototype, 'FacialFeatures', { type: WINBIO_EXTENDED_SENSOR_INFO._Specific._FacialFeatures, offset: 0 })
            DefineProp(this.Prototype, 'Fingerprint', { type: WINBIO_EXTENDED_SENSOR_INFO._Specific._Fingerprint, offset: 0 })
            DefineProp(this.Prototype, 'Iris', { type: WINBIO_EXTENDED_SENSOR_INFO._Specific._Iris, offset: 0 })
            DefineProp(this.Prototype, 'Voice', { type: WINBIO_EXTENDED_SENSOR_INFO._Specific._Voice, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * The generic capabilities of the sensor component that is connected to a specific biometric unit.
     */
    GenericSensorCapabilities : UInt32

    /**
     * The type of biometric unit for which this structure contains information about capabilities and enrollment requirements of the sensor adapter. For example, if the value of the **Factor** member is **WINBIO\_TYPE\_FINGERPRINT**, the **WINBIO\_EXTENDED\_SENSOR\_INFO** structure applies to a fingerprint reader and contains the relevant information in the **Specifc.Fingerprint** structure.
     */
    Factor : UInt32

    /**
     * Information about the capabilities and enrollment requirements of the sensor adapter for a biometric unit related to a specific biometric factor.
     */
    Specific : WINBIO_EXTENDED_SENSOR_INFO._Specific

}
