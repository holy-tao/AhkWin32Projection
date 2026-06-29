#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_PIN_PAIR {
    #StructPack 8

    Method : KSIDENTIFIER

    InputPinId : UInt32

    OutputPinId : UInt32

    static __New() {
        DefineProp(this.Prototype, 'InputPinType', { type: UInt32, offset: 24 })
        DefineProp(this.Prototype, 'OutputPinType', { type: UInt32, offset: 28 })
        this.DeleteProp("__New")
    }
}
