#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WINML_TENSOR_BINDING_DESC.ahk
#Include .\WINML_SEQUENCE_BINDING_DESC.ahk
#Include .\WINML_MAP_BINDING_DESC.ahk
#Include .\WINML_IMAGE_BINDING_DESC.ahk
#Include .\WINML_RESOURCE_BINDING_DESC.ahk

/**
 * Contains a description of the WinML binding.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ns-winml-winml_binding_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class WINML_BINDING_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The name of the WinML binding.
     * @type {Pointer<Char>}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_binding_type">WINML_BINDING_TYPE</a> containing the type of the WinML binding.
     * @type {Integer}
     */
    BindType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {WINML_TENSOR_BINDING_DESC}
     */
    Tensor{
        get {
            if(!this.HasProp("__Tensor"))
                this.__Tensor := WINML_TENSOR_BINDING_DESC(this.ptr + 16)
            return this.__Tensor
        }
    }

    /**
     * @type {WINML_SEQUENCE_BINDING_DESC}
     */
    Sequence{
        get {
            if(!this.HasProp("__Sequence"))
                this.__Sequence := WINML_SEQUENCE_BINDING_DESC(this.ptr + 16)
            return this.__Sequence
        }
    }

    /**
     * @type {WINML_MAP_BINDING_DESC}
     */
    Map{
        get {
            if(!this.HasProp("__Map"))
                this.__Map := WINML_MAP_BINDING_DESC(this.ptr + 16)
            return this.__Map
        }
    }

    /**
     * @type {WINML_IMAGE_BINDING_DESC}
     */
    Image{
        get {
            if(!this.HasProp("__Image"))
                this.__Image := WINML_IMAGE_BINDING_DESC(this.ptr + 16)
            return this.__Image
        }
    }

    /**
     * @type {WINML_RESOURCE_BINDING_DESC}
     */
    Resource{
        get {
            if(!this.HasProp("__Resource"))
                this.__Resource := WINML_RESOURCE_BINDING_DESC(this.ptr + 16)
            return this.__Resource
        }
    }
}
