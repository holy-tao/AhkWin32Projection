#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\MLOperatorAttributeType.ahk" { MLOperatorAttributeType }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorAttribute {
    #StructPack 8

    name : PSTR

    type : MLOperatorAttributeType

    required : Int8

}
