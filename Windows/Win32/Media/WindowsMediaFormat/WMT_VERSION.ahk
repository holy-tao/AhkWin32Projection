#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_VERSION enumeration type defines the versions of the Windows Media Format SDK.
 * @remarks
 * 
 * The version assigned to a profile does not directly relate to the codecs used in the profile's individual streams. However, it is recommended that you use codecs of the same version as the profile. Unless you have specific requirements to the contrary, you should always use the latest version.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ne-wmsdkidl-wmt_version
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_VERSION extends Win32Enum{

    /**
     * Compatible with version 4 of the Windows Media Format SDK.
     * @type {Integer (Int32)}
     */
    static WMT_VER_4_0 => 262144

    /**
     * Compatible with the Windows Media Format 7 SDK.
     * @type {Integer (Int32)}
     */
    static WMT_VER_7_0 => 458752

    /**
     * Compatible with the Windows Media Format 8.2 SDK.
     * @type {Integer (Int32)}
     */
    static WMT_VER_8_0 => 524288

    /**
     * Compatible with the Windows Media Format 9 Series SDK, and with the Windows Media Format 9.5 SDK.
     * @type {Integer (Int32)}
     */
    static WMT_VER_9_0 => 589824
}
