#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Holds license acquisition data during nonsilent license acquisition.
 * @remarks
 * This structure has a C++ default constructor that takes no parameters and sets all members to <b>NULL</b>, except <b>uVersion</b>, which is set to <b>DRMLICENSEACQDATAVERSION</b>.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ns-msdrmdefs-drm_license_acq_data
 * @namespace Windows.Win32.Data.RightsManagement
 */
export default struct DRM_LICENSE_ACQ_DATA {
    #StructPack 8

    /**
     * Version of this structure, for backward compatibility. In C, this value should be initialized to <b>DRMLICENSEACQDATAVERSION</b>.
     */
    uVersion : UInt32

    /**
     * URL of a license-granting website.
     */
    wszURL : PWSTR

    /**
     * The path and file name of a local HTML file that will automatically send a license request when loaded in a browser.
     */
    wszLocalFilename : PWSTR

    /**
     * Pointer to a URL-safe base64-encoded string containing the license request.
     */
    pbPostData : IntPtr

    /**
     * The post data size in characters, plus one for a null terminator.
     */
    dwPostDataSize : UInt32

    /**
     * A human-readable name for the license-granting website.
     */
    wszFriendlyName : PWSTR

}
