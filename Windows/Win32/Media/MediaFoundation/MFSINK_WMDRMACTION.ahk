#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the ASF file sink should apply Windows Media DRM.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ne-wmcontainer-mfsink_wmdrmaction
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFSINK_WMDRMACTION extends Win32Enum {

    /**
     * Undefined action.
     * Native name: MFSINK_WMDRMACTION_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Encode the content using Windows Media DRM. Use this flag if the source content does not have DRM protection.
     * Native name: MFSINK_WMDRMACTION_ENCODE
     * @type {Integer (Int32)}
     */
    static ENCODE => 1

    /**
     * Transcode the content using Windows Media DRM. Use this flag if the source content has Windows Media DRM protection and you want to change the encoding parameters but not the DRM protection.
     * Native name: MFSINK_WMDRMACTION_TRANSCODE
     * @type {Integer (Int32)}
     */
    static TRANSCODE => 2

    /**
     * Transcrypt the content. Use this flag if the source content has DRM protection and you want to change the DRM protection; for example, if you want to convert from Windows Media DRM version 1 to Windows Media DRM version 7 or later.
     * Native name: MFSINK_WMDRMACTION_TRANSCRYPT
     * @type {Integer (Int32)}
     */
    static TRANSCRYPT => 3

    /**
     * Reserved. Do not use.
     * Native name: MFSINK_WMDRMACTION_LAST
     * @type {Integer (Int32)}
     */
    static LAST => 3
}
