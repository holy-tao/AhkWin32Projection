#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    Author{
        get {
            if(!this.HasProp("__Author"))
                this.__Author := PWSTR(this.ptr + 0)
            return this.__Author
        }
    }

    /**
     * The name of the model.
     * @type {PWSTR}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := PWSTR(this.ptr + 8)
            return this.__Name
        }
    }

    /**
     * The domain of the model.
     * @type {PWSTR}
     */
    Domain{
        get {
            if(!this.HasProp("__Domain"))
                this.__Domain := PWSTR(this.ptr + 16)
            return this.__Domain
        }
    }

    /**
     * The description of the model.
     * @type {PWSTR}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := PWSTR(this.ptr + 24)
            return this.__Description
        }
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
