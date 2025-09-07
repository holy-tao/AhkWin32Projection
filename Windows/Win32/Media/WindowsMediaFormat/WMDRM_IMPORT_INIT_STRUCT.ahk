#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMDRM_IMPORT_INIT_STRUCT structure holds the encrypted session key and content key used in importing protected content.
 * @remarks
 * This structure is used to initialize protected stream sample writing in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdrmwriter3-setprotectstreamsamples">IWMDRMWriter3::SetProtectStreamSamples</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmdrm_import_init_struct
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMDRM_IMPORT_INIT_STRUCT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Version.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the encrypted session key message in bytes.
     * @type {Integer}
     */
    cbEncryptedSessionKeyMessage {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Address of a buffer containing the encrypted session key message. This message is contained in a field of a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmdrm-import-session-key">WMDRM_IMPORT_SESSION_KEY</a> structure. The message and its associated key data are both encrypted with the Windows Media DRM machine public key.
     * @type {Pointer<Byte>}
     */
    pbEncryptedSessionKeyMessage {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Size of the encrypted key message in bytes.
     * @type {Integer}
     */
    cbEncryptedKeyMessage {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Address of a buffer containing the encrypted key message. This message is contained in a field of a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmdrm-import-content-key">WMDRM_IMPORT_CONTENT_KEY</a> structure. The message and its associated key data are both encrypted with the Windows Media DRM machine public key.
     * @type {Pointer<Byte>}
     */
    pbEncryptedKeyMessage {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
