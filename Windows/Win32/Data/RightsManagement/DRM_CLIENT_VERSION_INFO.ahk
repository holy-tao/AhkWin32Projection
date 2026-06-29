#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Receives information about the version of the Active Directory Rights Management Services (AD RMS) client and the hierarchy, such as Production or Pre-production.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ns-msdrmdefs-drm_client_version_info
 * @namespace Windows.Win32.Data.RightsManagement
 */
export default struct DRM_CLIENT_VERSION_INFO {
    #StructPack 4

    /**
     * Version of this structure, for backward compatibility. In C, this value should be initialized to <b>DRMCLIENTSTRUCTVERSION</b>.
     */
    uStructVersion : UInt32

    /**
     * Array of type <b>DWORD</b> that receives the version number of the Active Directory Rights Management Services client software. The version number consists of the following parts.
     */
    dwVersion : UInt32[4]

    /**
     * Array of type <b>WCHAR</b> that receives the hierarchy information, such as Production or Pre-production.
     */
    wszHierarchy : WCHAR[256]

    /**
     * Array of type <b>WCHAR</b> that receives the product ID. This member  is not currently filled by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetclientversion">DRMGetClientVersion</a> function.
     */
    wszProductId : WCHAR[256]

    /**
     * Array of type <b>WCHAR</b> that receives the product description. This member is not currently filled by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetclientversion">DRMGetClientVersion</a> function.
     */
    wszProductDescription : WCHAR[256]

}
