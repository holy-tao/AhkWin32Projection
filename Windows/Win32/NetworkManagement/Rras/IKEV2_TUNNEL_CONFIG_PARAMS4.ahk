#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\MPR_CERT_EKU.ahk" { MPR_CERT_EKU }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct IKEV2_TUNNEL_CONFIG_PARAMS4 {
    #StructPack 8

    dwIdleTimeout : UInt32

    dwNetworkBlackoutTime : UInt32

    dwSaLifeTime : UInt32

    dwSaDataSizeForRenegotiation : UInt32

    dwConfigOptions : UInt32

    dwTotalCertificates : UInt32

    certificateNames : CRYPT_INTEGER_BLOB.Ptr

    machineCertificateName : CRYPT_INTEGER_BLOB

    dwEncryptionType : UInt32

    customPolicy : ROUTER_CUSTOM_IKEv2_POLICY0.Ptr

    dwTotalEkus : UInt32

    certificateEKUs : MPR_CERT_EKU.Ptr

    machineCertificateHash : CRYPT_INTEGER_BLOB

    dwMmSaLifeTime : UInt32

}
