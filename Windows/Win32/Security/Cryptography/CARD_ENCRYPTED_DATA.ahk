#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_ENCRYPTED_DATA {
    #StructPack 8

    pbEncryptedData : IntPtr

    cbEncryptedData : UInt32

}
