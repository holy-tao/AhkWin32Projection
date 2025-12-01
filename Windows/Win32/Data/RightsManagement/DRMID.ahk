#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies an object.
 * @remarks
 * In a C++ application, this structure will have a default constructor that initializes the members to the following values.
 * 
 * 
 * ```cpp
 * uVersion = DRMIDVERSION
 * wszIDType = NULL
 * wszID = NULL
 * 
 * ```
 * 
 * 
 * An overloaded C++ constructor is also defined as follows.
 * 
 * 
 * ```cpp
 * DRMID(PWSTR wszIDType, PWSTR wszID)
 * ```
 * 
 * 
 *  This constructor will initialize the members to the following values.
 * 
 * 
 * ```cpp
 * uVersion = DRMIDVERSION
 * wszIDType = wszTypein
 * wszID = wszIDin
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ns-msdrmdefs-drmid
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRMID extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the version of the structure. If you are programming in C, this should be set to <b>DRMIDVERSION</b> (0).
     * @type {Integer}
     */
    uVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the ID type. If you are using this parameter to create a bound license, you must specify the same value that you set in the <i>wszIDType</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetmetadata">DRMSetMetaData</a> function. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmboundlicenseparams">DRMBOUNDLICENSEPARAMS</a>. If you are using this parameter in  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingprincipal">DRMCreateEnablingPrincipal</a> function, the value can be <b>NULL</b>.
     * @type {PWSTR}
     */
    wszIDType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the object ID. If you are using this parameter to create a bound license, you must specify the same value that you set in the <i>wszID</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetmetadata">DRMSetMetaData</a> function. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmboundlicenseparams">DRMBOUNDLICENSEPARAMS</a>. If you are using this parameter in  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingprincipal">DRMCreateEnablingPrincipal</a> function, the value can be <b>NULL</b>.
     * @type {PWSTR}
     */
    wszID {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
