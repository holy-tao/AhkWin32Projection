#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the status of a Content Decryption Module (CDM) session key.
 * @remarks
 * This structure is used as the output parameter for the [IMFContentDecryptionModuleSession::GetKeyStatuses](../mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-getkeystatuses.md) method.
  * 
  * **MFMediaKeyStatus** is based on the Encrypted Media Extension specification's [MediaKeyStatusMap](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeysession-sessionid).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfmediakeystatus
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFMediaKeyStatus extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A byte array representing the identifier of a session key.
     * @type {Pointer<Byte>}
     */
    pbKeyId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of bytes in the *pbKeyId* parameter.
     * @type {Integer}
     */
    cbKeyId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A value from the [MF_MEDIAKEY_STATUS](ne-mfidl-mf_mediakey_status.md) enumeration specifying the status of the associated session key.
     * @type {Integer}
     */
    eMediaKeyStatus {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
