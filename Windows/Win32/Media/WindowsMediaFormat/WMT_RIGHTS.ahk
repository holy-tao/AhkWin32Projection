#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the rights that may be specified in a DRM license.
 * @remarks
 * 
 * These values are bit flags, so one or more can be set by combining them with the bitwise <b>OR</b> operator.
 * 
 * When using Windows Media DRM 10, <b>WMT_RIGHT_COPY_TO_NON_SDMI_DEVICE</b>, <b>WMT_RIGHT_COPY_TO_SDMI_DEVICE</b>, and <b>WMT_RIGHT_COPY_TO_CD</b> are superseded by <b>WMT_RIGHT_COPY</b>. Limitations on the devices to which the content may be copied are specified by using output protection levels (OPLs).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ne-wmsdkidl-wmt_rights
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_RIGHTS{

    /**
     * Specifies the right to play content without restriction.
     * @type {Integer (Int32)}
     */
    static WMT_RIGHT_PLAYBACK => 1

    /**
     * Specifies the right to copy content to a device not compliant with the <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">Secure Digital Music Initiative (SDMI)</a>.
     * @type {Integer (Int32)}
     */
    static WMT_RIGHT_COPY_TO_NON_SDMI_DEVICE => 2

    /**
     * Specifies the right to copy content to a CD.
     * @type {Integer (Int32)}
     */
    static WMT_RIGHT_COPY_TO_CD => 8

    /**
     * Specifies the right to copy content to a device compliant with the Secure Digital Music Initiative (SDMI).
     * @type {Integer (Int32)}
     */
    static WMT_RIGHT_COPY_TO_SDMI_DEVICE => 16

    /**
     * Specifies the right to play content one time only.
     * @type {Integer (Int32)}
     */
    static WMT_RIGHT_ONE_TIME => 32

    /**
     * Specifies the right to save content from a server.
     * @type {Integer (Int32)}
     */
    static WMT_RIGHT_SAVE_STREAM_PROTECTED => 64

    /**
     * Specifies the right to copy content. Windows Media DRM 10 regulates the devices to which the content can be copied by using output protection levels (OPLs).
     * @type {Integer (Int32)}
     */
    static WMT_RIGHT_COPY => 128

    /**
     * Specifies the right to play content as part of an online scenario where multiple participants can contribute songs from their collection to a shared playlist.
     * @type {Integer (Int32)}
     */
    static WMT_RIGHT_COLLABORATIVE_PLAY => 256

    /**
     * Reserved for future use. Do not use.
     * @type {Integer (Int32)}
     */
    static WMT_RIGHT_SDMI_TRIGGER => 65536

    /**
     * Reserved for future use. Do not use.
     * @type {Integer (Int32)}
     */
    static WMT_RIGHT_SDMI_NOMORECOPIES => 131072
}
