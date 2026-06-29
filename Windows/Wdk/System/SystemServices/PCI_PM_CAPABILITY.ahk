#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_PM_CAPABILITY {
    #StructPack 8


    struct _PMC {
        Capabilities : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _PMCSR {
        ControlStatus : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _PMCSR_BSE {
        BridgeSupport : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'AsUCHAR', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Header : IntPtr

    PMC : PCI_PM_CAPABILITY._PMC

    PMCSR : PCI_PM_CAPABILITY._PMCSR

    PMCSR_BSE : PCI_PM_CAPABILITY._PMCSR_BSE

    Data : Int8

}
