#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MLOperatorAttribute.ahk" { MLOperatorAttribute }
#Import ".\MLOperatorSchemaEdgeDescription.ahk" { MLOperatorSchemaEdgeDescription }
#Import ".\MLOperatorEdgeTypeConstraint.ahk" { MLOperatorEdgeTypeConstraint }
#Import ".\MLOperatorAttributeNameValue.ahk" { MLOperatorAttributeNameValue }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorSchemaDescription {
    #StructPack 8

    name : PSTR

    operatorSetVersionAtLastChange : Int32

    inputs : MLOperatorSchemaEdgeDescription.Ptr

    inputCount : UInt32

    outputs : MLOperatorSchemaEdgeDescription.Ptr

    outputCount : UInt32

    typeConstraints : MLOperatorEdgeTypeConstraint.Ptr

    typeConstraintCount : UInt32

    attributes : MLOperatorAttribute.Ptr

    attributeCount : UInt32

    defaultAttributes : MLOperatorAttributeNameValue.Ptr

    defaultAttributeCount : UInt32

}
