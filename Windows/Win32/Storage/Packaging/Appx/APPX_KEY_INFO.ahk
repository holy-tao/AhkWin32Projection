#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Windows app package key information.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ns-appxpackaging-appx_key_info
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_KEY_INFO {
    #StructPack 8

    /**
     * The length of the key.
     */
    keyLength : UInt32

    /**
     * The length of the key Id.
     */
    keyIdLength : UInt32

    /**
     * The app package key.
     */
    key : IntPtr

    /**
     * The app package key Id.
     */
    keyId : IntPtr

}
