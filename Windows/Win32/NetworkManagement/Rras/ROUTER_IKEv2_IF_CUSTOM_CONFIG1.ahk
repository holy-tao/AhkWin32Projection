#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct ROUTER_IKEv2_IF_CUSTOM_CONFIG1 {
    #StructPack 8

    dwSaLifeTime : UInt32

    dwSaDataSize : UInt32

    certificateName : CRYPT_INTEGER_BLOB

    customPolicy : ROUTER_CUSTOM_IKEv2_POLICY0.Ptr

    certificateHash : CRYPT_INTEGER_BLOB

}
