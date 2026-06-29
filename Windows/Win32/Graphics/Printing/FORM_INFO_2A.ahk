#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about a localizable print form.
 * @remarks
 * On a call to [**AddForm**](addform.md) or [**SetForm**](setform.md):
 * 
 * -   If **StringType** is STRING\_NONE, both **pMuiDll** and **pDisplayName** must be **NULL** and both **dwResourceId** and **wLangId** must be 0.
 * -   If **StringType** is STRING\_MUIDLL, **pDisplayName** must be **NULL** and **wLangId** must be 0.
 * -   If **StringType** is STRING\_LANGPAIR, **pMuiDll** must be **NULL** and **dwResourceId** must be 0.
 * 
 * For a **FORM\_INFO\_2** returned by a call to [**GetForm**](getform.md) or [**EnumForms**](enumforms.md):
 * 
 * -   If **StringType** is both STRING\_MUIDLL and STRING\_LANGPAIR, **pMuiDll**, **pDisplayName**, **dwResourceId**, and **wLangId** will all have valid values.
 * -   If **StringType** is STRING\_MUIDLL only, **pMuiDll** and **dwResourceId** will have valid values. **pDisplayName** will be **NULL** and **wLangId** will be 0.
 * -   If **StringType** is STRING\_LANGPAIR only, **pDisplayName** and **wLangId** will have valid values. **pMuiDll** will be **NULL** and **dwResourceId** will be 0.
 * @see https://learn.microsoft.com/windows/win32/printdocs/form-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct FORM_INFO_2A {
    #StructPack 8

    /**
     * The form properties. The following values are defined, but only one can be set. When the **FORM\_INFO\_2** is returned by [**GetForm**](getform.md) or [**EnumForms**](enumforms.md), **Flags** is set to the current value in the forms database.
     * 
     * 
     * 
     * | Value         | Meaning                                                                                                                                                                                                                                                                                  |
     * |---------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | FORM\_USER    | If this bit flag is set, the form has been defined by the user. Forms with this flag set are defined in the registry.                                                                                                                                                                    |
     * | FORM\_BUILTIN | If this bit-flag is set, the form is part of the spooler. Form definitions with this flag set do not appear in the registry. Built-in forms cannot be modified, so this flag should not be set when the structure is passed to [**AddForm**](addform.md) or [**SetForm**](setform.md). |
     * | FORM\_PRINTER | If this bit flag is set, the form is associated with a certain printer, and its definition appears in the registry.                                                                                                                                                                      |
     */
    Flags : UInt32

    /**
     * A pointer to a null-terminated string that specifies the name of the form. The form name cannot exceed 31 characters.
     */
    pName : PSTR

    /**
     * The width and height of the form in thousandths of millimeters.
     */
    Size : SIZE

    /**
     * The width and height, in thousandths of millimeters, of the area of the page on which the printer can print.
     */
    ImageableArea : RECTL

    /**
     * A pointer to a non-localizable string identifier of the form. When passed to [**AddForm**](addform.md) or [**SetForm**](setform.md), this gives the caller a means of identifying the form in all locales.
     */
    pKeyword : PSTR

    /**
     * Specifies how a localized display name for the form is obtained at runtime. The following values are defined. Only one can be set in any given call to [**AddForm**](addform.md) or [**SetForm**](setform.md). Both STRING\_MUIDLL and STRING\_LANGPAIR can be set in the **FORM\_INFO\_2** (s) returned by [**GetForm**](getform.md) or [**EnumForms**](enumforms.md). See Remarks.
     * 
     * 
     * 
     * | Value            | Meaning                                                                                                                                                                                        |
     * |------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | STRING\_NONE     | There is no localized display name.                                                                                                                                                            |
     * | STRING\_MUIDLL   | The display name is extracted from the [Multilingual User Interface](/windows/desktop/Intl/mui-resource-management) localized resources DLL specified in **pMuiDll**. The ID is in the **dwResourceId** member. |
     * | STRING\_LANGPAIR | The display name and language ID are provided directly by **pDisplayName** and the language is specified by **wLangId**.                                                                       |
     */
    StringType : UInt32

    /**
     * The [Multilingual User Interface](/windows/desktop/Intl/mui-resource-management) localized resource DLL that contains the localized display name.
     */
    pMuiDll : PSTR

    /**
     * The resource ID of the form's display name in **pMuiDll**.
     */
    dwResourceId : UInt32

    /**
     * The form's display name in the language specified by **wLangId**.
     */
    pDisplayName : PSTR

    /**
     * The language of the **pDisplayName**.
     */
    wLangId : UInt16

}
