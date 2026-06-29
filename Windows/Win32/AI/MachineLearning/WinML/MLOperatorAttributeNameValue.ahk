#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MLOperatorAttributeType.ahk" { MLOperatorAttributeType }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorAttributeNameValue {
    #StructPack 8

    name : PSTR

    type : MLOperatorAttributeType

    valueCount : UInt32

    reserved : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'ints', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'strings', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'floats', { type: IntPtr, offset: 16 })
        this.DeleteProp("__New")
    }
}
