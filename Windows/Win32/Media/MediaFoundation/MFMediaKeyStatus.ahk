#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MF_MEDIAKEY_STATUS.ahk" { MF_MEDIAKEY_STATUS }

/**
 * Represents the status of a Content Decryption Module (CDM) session key.
 * @remarks
 * This structure is used as the output parameter for the [IMFContentDecryptionModuleSession::GetKeyStatuses](../mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-getkeystatuses.md) method.
 * 
 * **MFMediaKeyStatus** is based on the Encrypted Media Extension specification's [MediaKeyStatusMap](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeysession-sessionid).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfmediakeystatus
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFMediaKeyStatus {
    #StructPack 8

    /**
     * A byte array representing the identifier of a session key.
     */
    pbKeyId : IntPtr

    /**
     * The number of bytes in the *pbKeyId* parameter.
     */
    cbKeyId : UInt32

    /**
     * A value from the [MF_MEDIAKEY_STATUS](ne-mfidl-mf_mediakey_status.md) enumeration specifying the status of the associated session key.
     */
    eMediaKeyStatus : MF_MEDIAKEY_STATUS

}
