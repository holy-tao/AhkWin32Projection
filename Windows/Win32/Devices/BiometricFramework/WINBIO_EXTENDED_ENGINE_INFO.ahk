#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the capabilities and enrollment requirements of the engine adapter for a biometric unit.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-extended-engine-info
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_EXTENDED_ENGINE_INFO {
    #StructPack 4


    struct _Specific {

        struct _FacialFeatures {

            struct _EnrollmentRequirements {
                Null : UInt32

            }

            Capabilities : UInt32

            EnrollmentRequirements : WINBIO_EXTENDED_ENGINE_INFO._Specific._FacialFeatures._EnrollmentRequirements

        }

        struct _Fingerprint {

            struct _EnrollmentRequirements {
                GeneralSamples : UInt32

                Center : UInt32

                TopEdge : UInt32

                BottomEdge : UInt32

                LeftEdge : UInt32

                RightEdge : UInt32

            }

            Capabilities : UInt32

            EnrollmentRequirements : WINBIO_EXTENDED_ENGINE_INFO._Specific._Fingerprint._EnrollmentRequirements

        }

        struct _Iris {

            struct _EnrollmentRequirements {
                Null : UInt32

            }

            Capabilities : UInt32

            EnrollmentRequirements : WINBIO_EXTENDED_ENGINE_INFO._Specific._Iris._EnrollmentRequirements

        }

        struct _Voice {

            struct _EnrollmentRequirements {
                Null : UInt32

            }

            Capabilities : UInt32

            EnrollmentRequirements : WINBIO_EXTENDED_ENGINE_INFO._Specific._Voice._EnrollmentRequirements

        }

        Null : UInt32

        static __New() {
            DefineProp(this.Prototype, 'FacialFeatures', { type: WINBIO_EXTENDED_ENGINE_INFO._Specific._FacialFeatures, offset: 0 })
            DefineProp(this.Prototype, 'Fingerprint', { type: WINBIO_EXTENDED_ENGINE_INFO._Specific._Fingerprint, offset: 0 })
            DefineProp(this.Prototype, 'Iris', { type: WINBIO_EXTENDED_ENGINE_INFO._Specific._Iris, offset: 0 })
            DefineProp(this.Prototype, 'Voice', { type: WINBIO_EXTENDED_ENGINE_INFO._Specific._Voice, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * The generic capabilities of the engine component that is connected to a specific biometric unit.
     */
    GenericEngineCapabilities : UInt32

    /**
     * The type of biometric unit for which this structure contains information about capabilities and enrollment requirements of the engine adapter. For example, if the value of the **Factor** member is **WINBIO\_TYPE\_FINGERPRINT**, the **WINBIO\_EXTENDED\_ENGINE\_INFO** structure applies to a fingerprint reader and contains the relevant information in the **Specifc.Fingerprint** structure.
     */
    Factor : UInt32

    /**
     * Information about the capabilities and enrollment requirements of the engine adapter for a biometric unit related to a specific biometric factor.
     */
    Specific : WINBIO_EXTENDED_ENGINE_INFO._Specific

}
