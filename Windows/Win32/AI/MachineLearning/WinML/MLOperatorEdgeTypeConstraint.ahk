#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MLOperatorEdgeDescription.ahk" { MLOperatorEdgeDescription }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorEdgeTypeConstraint {
    #StructPack 8

    typeLabel : PSTR

    allowedTypes : MLOperatorEdgeDescription.Ptr

    allowedTypeCount : UInt32

}
