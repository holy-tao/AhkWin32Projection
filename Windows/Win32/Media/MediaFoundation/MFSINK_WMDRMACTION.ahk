#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how the ASF file sink should apply Windows Media DRM.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/ne-wmcontainer-mfsink_wmdrmaction
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFSINK_WMDRMACTION{

    /**
     * Undefined action.
     * @type {Integer (Int32)}
     */
    static MFSINK_WMDRMACTION_UNDEFINED => 0

    /**
     * Encode the content using Windows Media DRM. Use this flag if the source content does not have DRM protection.
     * @type {Integer (Int32)}
     */
    static MFSINK_WMDRMACTION_ENCODE => 1

    /**
     * Transcode the content using Windows Media DRM. Use this flag if the source content has Windows Media DRM protection and you want to change the encoding parameters but not the DRM protection.
     * @type {Integer (Int32)}
     */
    static MFSINK_WMDRMACTION_TRANSCODE => 2

    /**
     * Transcrypt the content. Use this flag if the source content has DRM protection and you want to change the DRM protection; for example, if you want to convert from Windows Media DRM version 1 to Windows Media DRM version 7 or later.
     * @type {Integer (Int32)}
     */
    static MFSINK_WMDRMACTION_TRANSCRYPT => 3

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static MFSINK_WMDRMACTION_LAST => 3
}
