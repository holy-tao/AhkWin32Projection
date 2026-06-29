#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct L2TP_TUNNEL_CONFIG_PARAMS2 {
    #StructPack 8

    dwIdleTimeout : UInt32

    dwEncryptionType : UInt32

    dwSaLifeTime : UInt32

    dwSaDataSizeForRenegotiation : UInt32

    customPolicy : ROUTER_CUSTOM_IKEv2_POLICY0.Ptr

    dwMmSaLifeTime : UInt32

}
