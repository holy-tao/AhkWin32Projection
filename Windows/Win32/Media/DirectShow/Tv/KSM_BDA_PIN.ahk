#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_PIN {
    #StructPack 8

    Method : KSIDENTIFIER

    PinId : UInt32

    Reserved : UInt32

    static __New() {
        DefineProp(this.Prototype, 'PinType', { type: UInt32, offset: 24 })
        this.DeleteProp("__New")
    }
}
