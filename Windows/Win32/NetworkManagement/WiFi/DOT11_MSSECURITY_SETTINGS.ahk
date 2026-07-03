#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import "..\..\Security\ExtensibleAuthenticationProtocol\EAP_METHOD_TYPE.ahk" { EAP_METHOD_TYPE }
#Import "..\..\Security\ExtensibleAuthenticationProtocol\EAP_TYPE.ahk" { EAP_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MSSECURITY_SETTINGS {
    #StructPack 8

    dot11AuthAlgorithm : DOT11_AUTH_ALGORITHM

    dot11CipherAlgorithm : DOT11_CIPHER_ALGORITHM

    fOneXEnabled : BOOL

    eapMethodType : EAP_METHOD_TYPE

    dwEapConnectionDataLen : UInt32

    pEapConnectionData : IntPtr

}
