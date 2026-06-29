#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the capabilities and enrollment requirements of the storage adapter for a biometric unit.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-extended-storage-info
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_EXTENDED_STORAGE_INFO {
    #StructPack 4


    struct _Specific {

        struct _FacialFeatures {
            Capabilities : UInt32

        }

        struct _Fingerprint {
            Capabilities : UInt32

        }

        struct _Iris {
            Capabilities : UInt32

        }

        struct _Voice {
            Capabilities : UInt32

        }

        Null : UInt32

        static __New() {
            DefineProp(this.Prototype, 'FacialFeatures', { type: WINBIO_EXTENDED_STORAGE_INFO._Specific._FacialFeatures, offset: 0 })
            DefineProp(this.Prototype, 'Fingerprint', { type: WINBIO_EXTENDED_STORAGE_INFO._Specific._Fingerprint, offset: 0 })
            DefineProp(this.Prototype, 'Iris', { type: WINBIO_EXTENDED_STORAGE_INFO._Specific._Iris, offset: 0 })
            DefineProp(this.Prototype, 'Voice', { type: WINBIO_EXTENDED_STORAGE_INFO._Specific._Voice, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * The generic capabilities of the storage component that is connected to a specific biometric unit.
     */
    GenericStorageCapabilities : UInt32

    /**
     * The type of biometric unit for which this structure contains information about capabilities and enrollment requirements of the storage adapter. For example, if the value of the **Factor** member is **WINBIO\_TYPE\_FINGERPRINT**, the **WINBIO\_EXTENDED\_STORAGE\_INFO** structure applies to a fingerprint reader and contains the relevant information in the **Specifc.Fingerprint** structure.
     */
    Factor : UInt32

    /**
     * Information about the capabilities and enrollment requirements of the storage adapter for a biometric unit related to a specific biometric factor.
     */
    Specific : WINBIO_EXTENDED_STORAGE_INFO._Specific

}
