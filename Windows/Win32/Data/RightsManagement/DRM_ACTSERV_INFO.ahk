#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRM_ACTSERV_INFO structure stores information about the activation server.
 * @remarks
 * 
 * This structure has a C++ default constructor that takes no parameters and sets members to the default values described above.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msdrmdefs/ns-msdrmdefs-drm_actserv_info
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRM_ACTSERV_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Version of this structure, for backward compatibility. When using C, this value should be initialized to <b>DRMACTSERVINFOVERSION</b>. In C++ this is done automatically.
     * @type {Integer}
     */
    uVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is reserved and must be set to <b>NULL</b>.
     * @type {PWSTR}
     */
    wszPubKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * URL for a service that performs activation. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetservicelocation">DRMGetServiceLocation</a> to find a service location if none is known, or pass in <b>NULL</b> to use Passport service discovery. The URL should have the form <b>http://</b><i>CompanyName</i><b>/_wmcs/certification</b>, for example, http://blueyonderairlines/_wmcs/certification. The parameter defaults to <b>NULL</b> in C++.
     * @type {PWSTR}
     */
    wszURL {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
