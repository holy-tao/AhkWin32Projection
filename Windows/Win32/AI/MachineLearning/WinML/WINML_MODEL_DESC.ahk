#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains description properties of the model.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ns-winml-winml_model_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class WINML_MODEL_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The author of the model.
     * @type {Pointer<Ptr>}
     */
    Author {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The name of the model.
     * @type {Pointer<Ptr>}
     */
    Name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The domain of the model.
     * @type {Pointer<Ptr>}
     */
    Domain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The description of the model.
     * @type {Pointer<Ptr>}
     */
    Description {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The version of the model.
     * @type {Pointer}
     */
    Version {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
