#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_CRYPTO_KEY_TYPE.ahk" { KERB_CRYPTO_KEY_TYPE }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import ".\KERB_CRYPTO_KEY.ahk" { KERB_CRYPTO_KEY }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_DECRYPT_REQUEST {
    #StructPack 8

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    LogonId : LUID

    Flags : UInt32

    CryptoType : Int32

    KeyUsage : Int32

    Key : KERB_CRYPTO_KEY

    EncryptedDataSize : UInt32

    InitialVectorSize : UInt32

    InitialVector : IntPtr

    EncryptedData : IntPtr

}
