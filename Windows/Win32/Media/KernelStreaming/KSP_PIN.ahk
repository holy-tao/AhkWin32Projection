#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSP_PIN {
    #StructPack 8

    Property : KSIDENTIFIER

    PinId : UInt32

    Reserved : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: UInt32, offset: 28 })
        this.DeleteProp("__New")
    }
}
