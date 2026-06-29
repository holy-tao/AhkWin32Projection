#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DRM_ACTSERV_INFO structure stores information about the activation server.
 * @remarks
 * This structure has a C++ default constructor that takes no parameters and sets members to the default values described above.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ns-msdrmdefs-drm_actserv_info
 * @namespace Windows.Win32.Data.RightsManagement
 */
export default struct DRM_ACTSERV_INFO {
    #StructPack 8

    /**
     * Version of this structure, for backward compatibility. When using C, this value should be initialized to <b>DRMACTSERVINFOVERSION</b>. In C++ this is done automatically.
     */
    uVersion : UInt32

    /**
     * This member is reserved and must be set to <b>NULL</b>.
     */
    wszPubKey : PWSTR

    /**
     * URL for a service that performs activation. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetservicelocation">DRMGetServiceLocation</a> to find a service location if none is known, or pass in <b>NULL</b> to use Passport service discovery. The URL should have the form <b>http://</b><i>CompanyName</i><b>/_wmcs/certification</b>, for example, http://blueyonderairlines/_wmcs/certification. The parameter defaults to <b>NULL</b> in C++.
     */
    wszURL : PWSTR

}
