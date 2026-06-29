#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CREDSPP_SUBMIT_TYPE.ahk" { CREDSPP_SUBMIT_TYPE }

/**
 * Specifies authentication data for both Schannel and Negotiate security packages.
 * @see https://learn.microsoft.com/windows/win32/api/credssp/ns-credssp-credssp_cred
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct CREDSSP_CRED {
    #StructPack 8

    /**
     * The <a href="https://docs.microsoft.com/windows/win32/api/credssp/ne-credssp-credspp_submit_type">CREDSPP_SUBMIT_TYPE</a> enumeration value that specifies the type of credentials contained in this structure.
     */
    Type : CREDSPP_SUBMIT_TYPE

    /**
     * A pointer to a set of Schannel credentials.
     */
    pSchannelCred : IntPtr

    /**
     * A pointer to a set of Negotiate credentials.
     */
    pSpnegoCred : IntPtr

}
