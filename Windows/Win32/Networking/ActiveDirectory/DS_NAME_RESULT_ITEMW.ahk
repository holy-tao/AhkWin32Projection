#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DS_NAME_RESULT_ITEM structure contains a name converted by the DsCrackNames function, along with associated error and domain data. (Unicode)
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dscracknamesa">DsCrackNames</a> function returns an array of <b>DS_NAME_RESULT_ITEM</b> structures as part of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DS_NAME_RESULT_ITEM as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_name_result_itemw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset Unicode
 */
class DS_NAME_RESULT_ITEMW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_error">DS_NAME_ERROR</a> values that indicates the status of this name conversion.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that specifies the DNS domain in which the object resides. This member will contain valid data if <b>status</b> contains <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_error">DS_NAME_NO_ERROR</a> or <b>DS_NAME_ERROR_DOMAIN_ONLY</b>.
     * @type {PWSTR}
     */
    pDomain {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string that specifies the newly formatted object name.
     * @type {PWSTR}
     */
    pName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
