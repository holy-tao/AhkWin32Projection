#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MLOperatorAttributeType.ahk" { MLOperatorAttributeType }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorAttribute {
    #StructPack 8

    name : PSTR

    type : MLOperatorAttributeType

    required : Int8

}
