#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MLOperatorEdgeType.ahk" { MLOperatorEdgeType }
#Import ".\MLOperatorTensorDataType.ahk" { MLOperatorTensorDataType }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct MLOperatorEdgeDescription {
    #StructPack 8

    edgeType : MLOperatorEdgeType

    reserved : Int64

    static __New() {
        DefineProp(this.Prototype, 'tensorDataType', { type: MLOperatorTensorDataType, offset: 8 })
        this.DeleteProp("__New")
    }
}
