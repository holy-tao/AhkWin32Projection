#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MLOperatorAttributeNameValue.ahk" { MLOperatorAttributeNameValue }
#Import ".\MLOperatorEdgeTypeConstraint.ahk" { MLOperatorEdgeTypeConstraint }
#Import ".\MLOperatorExecutionType.ahk" { MLOperatorExecutionType }
#Import ".\MLOperatorKernelOptions.ahk" { MLOperatorKernelOptions }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

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
