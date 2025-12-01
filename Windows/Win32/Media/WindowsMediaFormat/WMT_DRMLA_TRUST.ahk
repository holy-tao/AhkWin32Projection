#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the trust state of a DRM license acquisition URL.
 * @remarks
 * When a <b>WMT_LICENSEURL_SIGNATURE_STATE</b> message is received in the <b>OnStatus</b> callback method, pValue will be set to one of the <b>WMT_DRMLA_TRUST</b> constants, which indicate whether there is any problem with the digital signature applied to the license acquisition URL.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_drmla_trust
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_DRMLA_TRUST extends Win32Enum{

    /**
     * Indicates that the validity of the license acquisition URL cannot be guaranteed because it is not signed. All protected content created prior to Windows Media 9 Series will cause this value to be returned.
     * @type {Integer (Int32)}
     */
    static WMT_DRMLA_UNTRUSTED => 0

    /**
     * Indicates that the license acquisition URL is the original one provided with the content.
     * @type {Integer (Int32)}
     */
    static WMT_DRMLA_TRUSTED => 1

    /**
     * Indicates that the license acquisition URL was originally signed and has been tampered with.
     * @type {Integer (Int32)}
     */
    static WMT_DRMLA_TAMPERED => 2
}
