#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_PROCESSOR_FEATURES.ahk" { WHV_PROCESSOR_FEATURES }
#Import ".\WHV_PROCESSOR_FEATURES1.ahk" { WHV_PROCESSOR_FEATURES1 }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_PROCESSOR_FEATURES_BANKS {
    #StructPack 8

    BanksCount : UInt32

    Reserved0 : UInt32

    Bank0 : WHV_PROCESSOR_FEATURES

    Bank1 : WHV_PROCESSOR_FEATURES1

    static __New() {
        DefineProp(this.Prototype, 'AsUINT64', { type: Int64[2], offset: 8 })
        this.DeleteProp("__New")
    }
}
