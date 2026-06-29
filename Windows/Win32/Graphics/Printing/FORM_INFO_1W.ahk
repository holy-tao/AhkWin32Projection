#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * The FORM_INFO_1 structure contains information about a print form. The information includes the print forms origin, its name, its dimensions, and the dimensions of its printable area.
 * @see https://learn.microsoft.com/windows/win32/printdocs/form-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct FORM_INFO_1W {
    #StructPack 8

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
     */
    Flags : UInt32

    /**
     * Pointer to a null-terminated string that specifies the name of the form. The form name cannot exceed 31 characters.
     */
    pName : PWSTR

    /**
     * The width and height, in thousandths of millimeters, of the form.
     */
    Size : SIZE

    /**
     * The width and height, in thousandths of millimeters, of the form.
     */
    ImageableArea : RECTL

}
