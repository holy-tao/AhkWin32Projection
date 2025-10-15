#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class MLOperatorKernelDescription extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    domain{
        get {
            if(!this.HasProp("__domain"))
                this.__domain := PSTR(this.ptr + 0)
            return this.__domain
        }
    }

    /**
     * @type {PSTR}
     */
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := PSTR(this.ptr + 8)
            return this.__name
        }
    }

    /**
     * @type {Integer}
     */
    minimumOperatorSetVersion {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    executionType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<MLOperatorEdgeTypeConstraint>}
     */
    typeConstraints {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    typeConstraintCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<MLOperatorAttributeNameValue>}
     */
    defaultAttributes {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    defaultAttributeCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    options {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    executionOptions {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
