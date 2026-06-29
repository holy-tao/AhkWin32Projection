#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }
#Import ".\ROUTER_IKEv2_IF_CUSTOM_CONFIG1.ahk" { ROUTER_IKEv2_IF_CUSTOM_CONFIG1 }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\MPRAPI_OBJECT_HEADER.ahk" { MPRAPI_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_IF_CUSTOMINFOEX1 {
    #StructPack 8

    Header : MPRAPI_OBJECT_HEADER

    dwFlags : UInt32

    customIkev2Config : ROUTER_IKEv2_IF_CUSTOM_CONFIG1

}
