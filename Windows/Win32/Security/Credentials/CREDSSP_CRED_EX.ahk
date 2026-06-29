#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CREDSSP_CRED.ahk" { CREDSSP_CRED }
#Import ".\CREDSPP_SUBMIT_TYPE.ahk" { CREDSPP_SUBMIT_TYPE }

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct CREDSSP_CRED_EX {
    #StructPack 8

    Type : CREDSPP_SUBMIT_TYPE

    Version : UInt32

    Flags : UInt32

    Reserved : UInt32

    Cred : CREDSSP_CRED

}
