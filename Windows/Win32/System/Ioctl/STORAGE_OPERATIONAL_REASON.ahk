#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_OPERATIONAL_STATUS_REASON.ahk" { STORAGE_OPERATIONAL_STATUS_REASON }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_OPERATIONAL_REASON {
    #StructPack 4


    struct _RawBytes {

        struct _ScsiSenseKey {
            SenseKey : Int8

            ASC : Int8

            ASCQ : Int8

            Reserved : Int8

        }

        struct _NVDIMM_N {
            CriticalHealth : Int8

            ModuleHealth : Int8[2]

            ErrorThresholdStatus : Int8

        }

        ScsiSenseKey : STORAGE_OPERATIONAL_REASON._RawBytes._ScsiSenseKey

        static __New() {
            DefineProp(this.Prototype, 'NVDIMM_N', { type: STORAGE_OPERATIONAL_REASON._RawBytes._NVDIMM_N, offset: 0 })
            DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Version : UInt32

    Size : UInt32

    Reason : STORAGE_OPERATIONAL_STATUS_REASON

    RawBytes : STORAGE_OPERATIONAL_REASON._RawBytes

}
