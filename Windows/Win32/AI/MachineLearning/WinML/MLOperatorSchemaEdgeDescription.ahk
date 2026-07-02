#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MLOperatorEdgeDescription.ahk" { MLOperatorEdgeDescription }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\MLOperatorEdgeType.ahk" { MLOperatorEdgeType }
#Import ".\MLOperatorTensorDataType.ahk" { MLOperatorTensorDataType }
#Import ".\MLOperatorSchemaEdgeTypeFormat.ahk" { MLOperatorSchemaEdgeTypeFormat }
#Import ".\MLOperatorParameterOptions.ahk" { MLOperatorParameterOptions }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorSchemaEdgeDescription {
    #StructPack 8

    options : MLOperatorParameterOptions

    typeFormat : MLOperatorSchemaEdgeTypeFormat

    reserved : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'typeLabel', { type: PSTR, offset: 8 })
        DefineProp(this.Prototype, 'edgeDescription', { type: MLOperatorEdgeDescription, offset: 8 })
        this.DeleteProp("__New")
    }
}
