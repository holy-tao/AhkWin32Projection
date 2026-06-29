#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

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
 */
export default struct DRMID {
    #StructPack 8

    /**
     * Specifies the version of the structure. If you are programming in C, this should be set to <b>DRMIDVERSION</b> (0).
     */
    uVersion : UInt32

    /**
     * A pointer to a null-terminated Unicode string that contains the ID type. If you are using this parameter to create a bound license, you must specify the same value that you set in the <i>wszIDType</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetmetadata">DRMSetMetaData</a> function. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmboundlicenseparams">DRMBOUNDLICENSEPARAMS</a>. If you are using this parameter in  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingprincipal">DRMCreateEnablingPrincipal</a> function, the value can be <b>NULL</b>.
     */
    wszIDType : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains the object ID. If you are using this parameter to create a bound license, you must specify the same value that you set in the <i>wszID</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetmetadata">DRMSetMetaData</a> function. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmboundlicenseparams">DRMBOUNDLICENSEPARAMS</a>. If you are using this parameter in  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingprincipal">DRMCreateEnablingPrincipal</a> function, the value can be <b>NULL</b>.
     */
    wszID : PWSTR

}
