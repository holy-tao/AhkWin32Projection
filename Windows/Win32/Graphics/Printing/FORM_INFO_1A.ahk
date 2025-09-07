#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The FORM_INFO_1 structure contains information about a print form. The information includes the print forms origin, its name, its dimensions, and the dimensions of its printable area.
 * @see https://learn.microsoft.com/windows/win32/printdocs/form-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class FORM_INFO_1A extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The form properties. The following values are defined.
     * 
     * 
     * 
     * | Value         | Meaning                                                                                                                      |
     * |---------------|------------------------------------------------------------------------------------------------------------------------------|
     * | FORM_USER    | If this bit flag is set, the form has been defined by the user. Forms with this flag set are defined in the registry.        |
     * | FORM_BUILTIN | If this bit-flag is set, the form is part of the spooler. Form definitions with this flag set do not appear in the registry. |
     * | FORM_PRINTER | If this bit flag is set, the form is associated with a certain printer, and its definition appears in the registry.          |
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of the form. The form name cannot exceed 31 characters.
     * @type {PSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PSTR(this.ptr + 8)
            return this.__pName
        }
    }

    /**
     * The width and height, in thousandths of millimeters, of the form.
     * @type {SIZE}
     */
    Size{
        get {
            if(!this.HasProp("__Size"))
                this.__Size := SIZE(this.ptr + 16)
            return this.__Size
        }
    }

    /**
     * The width and height, in thousandths of millimeters, of the form.
     * @type {RECTL}
     */
    ImageableArea{
        get {
            if(!this.HasProp("__ImageableArea"))
                this.__ImageableArea := RECTL(this.ptr + 24)
            return this.__ImageableArea
        }
    }
}
