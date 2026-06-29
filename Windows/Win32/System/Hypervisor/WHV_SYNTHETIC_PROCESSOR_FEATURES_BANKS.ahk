#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_SYNTHETIC_PROCESSOR_FEATURES.ahk" { WHV_SYNTHETIC_PROCESSOR_FEATURES }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS {
    #StructPack 8

    BanksCount : UInt32

    Reserved0 : UInt32

    Bank0 : WHV_SYNTHETIC_PROCESSOR_FEATURES

    static __New() {
        DefineProp(this.Prototype, 'AsUINT64', { type: Int64[1], offset: 8 })
        this.DeleteProp("__New")
    }
}
