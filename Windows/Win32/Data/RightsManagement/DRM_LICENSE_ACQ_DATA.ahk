#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Holds license acquisition data during nonsilent license acquisition.
 * @remarks
 * This structure has a C++ default constructor that takes no parameters and sets all members to <b>NULL</b>, except <b>uVersion</b>, which is set to <b>DRMLICENSEACQDATAVERSION</b>.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ns-msdrmdefs-drm_license_acq_data
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRM_LICENSE_ACQ_DATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Version of this structure, for backward compatibility. In C, this value should be initialized to <b>DRMLICENSEACQDATAVERSION</b>.
     * @type {Integer}
     */
    uVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * URL of a license-granting website.
     * @type {PWSTR}
     */
    wszURL{
        get {
            if(!this.HasProp("__wszURL"))
                this.__wszURL := PWSTR(this.ptr + 8)
            return this.__wszURL
        }
    }

    /**
     * The path and file name of a local HTML file that will automatically send a license request when loaded in a browser.
     * @type {PWSTR}
     */
    wszLocalFilename{
        get {
            if(!this.HasProp("__wszLocalFilename"))
                this.__wszLocalFilename := PWSTR(this.ptr + 16)
            return this.__wszLocalFilename
        }
    }

    /**
     * Pointer to a URL-safe base64-encoded string containing the license request.
     * @type {Pointer<Byte>}
     */
    pbPostData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The post data size in characters, plus one for a null terminator.
     * @type {Integer}
     */
    dwPostDataSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A human-readable name for the license-granting website.
     * @type {PWSTR}
     */
    wszFriendlyName{
        get {
            if(!this.HasProp("__wszFriendlyName"))
                this.__wszFriendlyName := PWSTR(this.ptr + 40)
            return this.__wszFriendlyName
        }
    }
}
