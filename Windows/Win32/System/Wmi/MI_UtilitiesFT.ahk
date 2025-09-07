#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_ClientFT_V1 structure. Use the functions with the name prefix &quot;MI_Utilities_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_utilitiesft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_UtilitiesFT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This function has been deprecated. See 
     *    <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_utilities_maperrortomierrorcategory">MI_Utilities_MapErrorToMiErrorCategory</a>.
     * @type {Pointer}
     */
    MapErrorToMiErrorCategory {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Maps an operating-system specific error code to a CIM error instance. See 
     *    <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_utilities_cimerrorfromerrorcode">MI_Utilities_CimErrorFromErrorCode</a>.
     * @type {Pointer}
     */
    CimErrorFromErrorCode {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
