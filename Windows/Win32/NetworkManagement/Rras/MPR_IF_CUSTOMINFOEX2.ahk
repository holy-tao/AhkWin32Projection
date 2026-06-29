#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MPR_VPN_TRAFFIC_SELECTOR.ahk" { MPR_VPN_TRAFFIC_SELECTOR }
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }
#Import ".\MPR_VPN_TRAFFIC_SELECTORS.ahk" { MPR_VPN_TRAFFIC_SELECTORS }
#Import ".\ROUTER_IKEv2_IF_CUSTOM_CONFIG2.ahk" { ROUTER_IKEv2_IF_CUSTOM_CONFIG2 }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\MPRAPI_OBJECT_HEADER.ahk" { MPRAPI_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_IF_CUSTOMINFOEX2 {
    #StructPack 8

    Header : MPRAPI_OBJECT_HEADER

    dwFlags : UInt32

    customIkev2Config : ROUTER_IKEv2_IF_CUSTOM_CONFIG2

}
