#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Sets whether the content is full-screen video, as opposed to screen content that might have a smaller window of video or have no video at all.
 * @remarks
 * On Windows 10, the value of this property is not used.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-videoencoderdisplaycontenttype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_VideoEncoderDisplayContentType {
    #StructPack 1

}
