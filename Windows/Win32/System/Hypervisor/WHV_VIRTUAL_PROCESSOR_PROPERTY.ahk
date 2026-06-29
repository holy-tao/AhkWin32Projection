#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE.ahk" { WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_VIRTUAL_PROCESSOR_PROPERTY {
    #StructPack 8

    PropertyCode : WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE

    Reserved : UInt32

    NumaNode : UInt16

    static __New() {
        DefineProp(this.Prototype, 'Padding', { type: Int64, offset: 8 })
        this.DeleteProp("__New")
    }
}
