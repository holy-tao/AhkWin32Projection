#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MLOperatorParameterOptions.ahk
#Include .\MLOperatorSchemaEdgeTypeFormat.ahk
#Include .\MLOperatorEdgeDescription.ahk
#Include .\MLOperatorEdgeType.ahk
#Include .\MLOperatorTensorDataType.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
class MLOperatorSchemaEdgeDescription extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {MLOperatorParameterOptions}
     */
    options {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {MLOperatorSchemaEdgeTypeFormat}
     */
    typeFormat {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer<Void>}
     */
    reserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    typeLabel {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {MLOperatorEdgeDescription}
     */
    edgeDescription {
        get {
            if(!this.HasProp("__edgeDescription"))
                this.__edgeDescription := MLOperatorEdgeDescription(8, this)
            return this.__edgeDescription
        }
    }
}
