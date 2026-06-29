#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MPR_VPN_TRAFFIC_SELECTOR.ahk" { MPR_VPN_TRAFFIC_SELECTOR }
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }
#Import ".\MPR_VPN_TRAFFIC_SELECTORS.ahk" { MPR_VPN_TRAFFIC_SELECTORS }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct ROUTER_IKEv2_IF_CUSTOM_CONFIG2 {
    #StructPack 8

    dwSaLifeTime : UInt32

    dwSaDataSize : UInt32

    certificateName : CRYPT_INTEGER_BLOB

    customPolicy : ROUTER_CUSTOM_IKEv2_POLICY0.Ptr

    certificateHash : CRYPT_INTEGER_BLOB

    dwMmSaLifeTime : UInt32

    vpnTrafficSelectors : MPR_VPN_TRAFFIC_SELECTORS

}
