#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\Foundation\BOOL.ahk
#Include .\WINML_TENSOR_VARIABLE_DESC.ahk
#Include .\WINML_SEQUENCE_VARIABLE_DESC.ahk
#Include .\WINML_MAP_VARIABLE_DESC.ahk
#Include .\WINML_IMAGE_VARIABLE_DESC.ahk

/**
 * Contains description properties of the variable.
 * @see https://docs.microsoft.com/windows/win32/api//winml/ns-winml-winml_variable_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class WINML_VARIABLE_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The name of the variable.
     * @type {PWSTR}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := PWSTR(this.ptr + 0)
            return this.__Name
        }
    }

    /**
     * The description of the variable.
     * @type {PWSTR}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := PWSTR(this.ptr + 8)
            return this.__Description
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_feature_type">WINML_FEATURE_TYPE</a> containing the feature type of variable.
     * @type {Integer}
     */
    FeatureType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * <b>true</b> if the variable is required; otherwise, <b>false</b>.
     * @type {BOOL}
     */
    Required{
        get {
            if(!this.HasProp("__Required"))
                this.__Required := BOOL(this.ptr + 20)
            return this.__Required
        }
    }

    /**
     * @type {WINML_TENSOR_VARIABLE_DESC}
     */
    Tensor{
        get {
            if(!this.HasProp("__Tensor"))
                this.__Tensor := WINML_TENSOR_VARIABLE_DESC(this.ptr + 24)
            return this.__Tensor
        }
    }

    /**
     * @type {WINML_SEQUENCE_VARIABLE_DESC}
     */
    Sequence{
        get {
            if(!this.HasProp("__Sequence"))
                this.__Sequence := WINML_SEQUENCE_VARIABLE_DESC(this.ptr + 24)
            return this.__Sequence
        }
    }

    /**
     * @type {WINML_MAP_VARIABLE_DESC}
     */
    Map{
        get {
            if(!this.HasProp("__Map"))
                this.__Map := WINML_MAP_VARIABLE_DESC(this.ptr + 24)
            return this.__Map
        }
    }

    /**
     * @type {WINML_IMAGE_VARIABLE_DESC}
     */
    Image{
        get {
            if(!this.HasProp("__Image"))
                this.__Image := WINML_IMAGE_VARIABLE_DESC(this.ptr + 24)
            return this.__Image
        }
    }
}
