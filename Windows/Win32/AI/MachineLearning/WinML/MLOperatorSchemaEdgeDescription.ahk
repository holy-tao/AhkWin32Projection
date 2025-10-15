#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk
#Include .\MLOperatorEdgeDescription.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class MLOperatorSchemaEdgeDescription extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    options {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
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
    typeLabel{
        get {
            if(!this.HasProp("__typeLabel"))
                this.__typeLabel := PSTR(this.ptr + 8)
            return this.__typeLabel
        }
    }

    /**
     * @type {MLOperatorEdgeDescription}
     */
    edgeDescription{
        get {
            if(!this.HasProp("__edgeDescription"))
                this.__edgeDescription := MLOperatorEdgeDescription(this.ptr + 8)
            return this.__edgeDescription
        }
    }
}
