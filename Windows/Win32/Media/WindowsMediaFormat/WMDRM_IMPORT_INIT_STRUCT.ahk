#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMDRM_IMPORT_INIT_STRUCT structure holds the encrypted session key and content key used in importing protected content.
 * @remarks
 * This structure is used to initialize protected stream sample writing in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdrmwriter3-setprotectstreamsamples">IWMDRMWriter3::SetProtectStreamSamples</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmdrm_import_init_struct
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMDRM_IMPORT_INIT_STRUCT {
    #StructPack 8

    /**
     * Version.
     */
    dwVersion : UInt32

    /**
     * Size of the encrypted session key message in bytes.
     */
    cbEncryptedSessionKeyMessage : UInt32

    /**
     * Address of a buffer containing the encrypted session key message. This message is contained in a field of a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmdrm-import-session-key">WMDRM_IMPORT_SESSION_KEY</a> structure. The message and its associated key data are both encrypted with the Windows Media DRM machine public key.
     */
    pbEncryptedSessionKeyMessage : IntPtr

    /**
     * Size of the encrypted key message in bytes.
     */
    cbEncryptedKeyMessage : UInt32

    /**
     * Address of a buffer containing the encrypted key message. This message is contained in a field of a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmdrm-import-content-key">WMDRM_IMPORT_CONTENT_KEY</a> structure. The message and its associated key data are both encrypted with the Windows Media DRM machine public key.
     */
    pbEncryptedKeyMessage : IntPtr

}
