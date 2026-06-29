#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines a subject interface package (SIP). This structure is used by the CryptSIPAddProvider function.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-sip_add_newprovider
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct SIP_ADD_NEWPROVIDER {
    #StructPack 8

    /**
     * The size, in bytes, of this structure. Set this value to <c>sizeof(SIP_ADD_NEWPROVIDER)</c>.
     */
    cbStruct : UInt32

    /**
     * Pointer to the GUID that identifies the SIP.
     */
    pgSubject : Guid.Ptr

    /**
     * Pointer to a null-terminated string that contains the name of the DLL file.
     */
    pwszDLLFileName : PWSTR

    /**
     * This member is not used.
     */
    pwszMagicNumber : PWSTR

    /**
     * Pointer to a null-terminated string that contains the name of the function that determines whether the file contents are supported by this SIP. This member can be <b>NULL</b>. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nc-mssip-pfnisfilesupported">pfnIsFileSupported</a>.
     */
    pwszIsFunctionName : PWSTR

    /**
     * Pointer to a null-terminated string that contains the name of the function that retrieves the signed data. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipgetsigneddatamsg">CryptSIPGetSignedDataMsg</a>.
     */
    pwszGetFuncName : PWSTR

    /**
     * Pointer to a null-terminated string that contains the name of the function that stores the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Authenticode</a> signature in the target file. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipputsigneddatamsg">CryptSIPPutSignedDataMsg</a>.
     */
    pwszPutFuncName : PWSTR

    /**
     * Pointer to a null-terminated string that contains the name of the function that creates the hash. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipcreateindirectdata">CryptSIPCreateIndirectData</a>.
     */
    pwszCreateFuncName : PWSTR

    /**
     * Pointer to a null-terminated string that contains the name of the function that verifies the hash. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipverifyindirectdata">CryptSIPVerifyIndirectData</a>.
     */
    pwszVerifyFuncName : PWSTR

    /**
     * Pointer to a null-terminated string that contains the name of the function that removes the signed data. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipremovesigneddatamsg">CryptSIPRemoveSignedDataMsg</a>.
     */
    pwszRemoveFuncName : PWSTR

    /**
     * Pointer to a null-terminated string that contains the name of the function that determines whether the file name extension is supported by this SIP. This member can be <b>NULL</b>. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nc-mssip-pfnisfilesupportedname">pfnIsFileSupportedName</a>.
     */
    pwszIsFunctionNameFmt2 : PWSTR

    /**
     * Pointer to a null-terminated string that contains the name  of the function that determines the capabilities of the SIP. If this parameter is set to <b>NULL</b>, multiple signatures are not available for this SIP. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nc-mssip-pcryptsipgetcaps">pCryptSIPGetCaps</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     */
    pwszGetCapFuncName : PWSTR

}
