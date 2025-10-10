#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Receives information about the version of the Active Directory Rights Management Services (AD RMS) client and the hierarchy, such as Production or Pre-production.
 * @see https://docs.microsoft.com/windows/win32/api//msdrmdefs/ns-msdrmdefs-drm_client_version_info
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRM_CLIENT_VERSION_INFO extends Win32Struct
{
    static sizeof => 1556

    static packingSize => 4

    /**
     * Version of this structure, for backward compatibility. In C, this value should be initialized to <b>DRMCLIENTSTRUCTVERSION</b>.
     * @type {Integer}
     */
    uStructVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of type <b>DWORD</b> that receives the version number of the Active Directory Rights Management Services client software. The version number consists of the following parts.
     * @type {Array<UInt32>}
     */
    dwVersion{
        get {
            if(!this.HasProp("__dwVersionProxyArray"))
                this.__dwVersionProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "uint")
            return this.__dwVersionProxyArray
        }
    }

    /**
     * Array of type <b>WCHAR</b> that receives the hierarchy information, such as Production or Pre-production.
     * @type {String}
     */
    wszHierarchy {
        get => StrGet(this.ptr + 20, 255, "UTF-16")
        set => StrPut(value, this.ptr + 20, 255, "UTF-16")
    }

    /**
     * Array of type <b>WCHAR</b> that receives the product ID. This member  is not currently filled by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetclientversion">DRMGetClientVersion</a> function.
     * @type {String}
     */
    wszProductId {
        get => StrGet(this.ptr + 532, 255, "UTF-16")
        set => StrPut(value, this.ptr + 532, 255, "UTF-16")
    }

    /**
     * Array of type <b>WCHAR</b> that receives the product description. This member is not currently filled by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetclientversion">DRMGetClientVersion</a> function.
     * @type {String}
     */
    wszProductDescription {
        get => StrGet(this.ptr + 1044, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1044, 255, "UTF-16")
    }
}
