#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACTCTX_COMPATIBILITY_ELEMENT_TYPE.ahk" { ACTCTX_COMPATIBILITY_ELEMENT_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The COMPATIBILITY_CONTEXT_ELEMENT structure is used by the QueryActCtxW function as part of the ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-compatibility_context_element
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct COMPATIBILITY_CONTEXT_ELEMENT {
    #StructPack 8

    /**
     * This is a <b>GUID</b> that specifies a version of  Windows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>{e2011457-1546-43c5-a5fe-008deee3d3f0}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Vista
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>{35138b9a-5d96-4fbd-8e2d-a2440225f93a}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows 7
     * 
     * </td>
     * </tr>
     * </table>
     */
    Id : Guid

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-actctx_compatibility_element_type">ACTCTX_COMPATIBILITY_ELEMENT_TYPE</a> enumeration that describes the compatibility elements in the application manifest.
     */
    Type : ACTCTX_COMPATIBILITY_ELEMENT_TYPE

    MaxVersionTested : Int64

}
