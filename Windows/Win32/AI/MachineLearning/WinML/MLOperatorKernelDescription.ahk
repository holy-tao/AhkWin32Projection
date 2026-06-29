#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MLOperatorEdgeTypeConstraint.ahk" { MLOperatorEdgeTypeConstraint }
#Import ".\MLOperatorKernelOptions.ahk" { MLOperatorKernelOptions }
#Import ".\MLOperatorAttributeNameValue.ahk" { MLOperatorAttributeNameValue }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\MLOperatorExecutionType.ahk" { MLOperatorExecutionType }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorKernelDescription {
    #StructPack 8

    domain : PSTR

    name : PSTR

    minimumOperatorSetVersion : Int32

    executionType : MLOperatorExecutionType

    typeConstraints : MLOperatorEdgeTypeConstraint.Ptr

    typeConstraintCount : UInt32

    defaultAttributes : MLOperatorAttributeNameValue.Ptr

    defaultAttributeCount : UInt32

    options : MLOperatorKernelOptions

    executionOptions : UInt32

}
