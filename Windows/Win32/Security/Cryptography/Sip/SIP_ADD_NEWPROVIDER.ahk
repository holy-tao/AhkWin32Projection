#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines a subject interface package (SIP). This structure is used by the CryptSIPAddProvider function.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-sip_add_newprovider
 * @namespace Windows.Win32.Security.Cryptography.Sip
 * @version v4.0.30319
 */
class SIP_ADD_NEWPROVIDER extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The size, in bytes, of this structure. Set this value to <c>sizeof(SIP_ADD_NEWPROVIDER)</c>.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the GUID that identifies the SIP.
     * @type {Pointer<Guid>}
     */
    pgSubject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string that contains the name of the DLL file.
     * @type {Pointer<Char>}
     */
    pwszDLLFileName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * This member is not used.
     * @type {Pointer<Char>}
     */
    pwszMagicNumber {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that determines whether the file contents are supported by this SIP. This member can be <b>NULL</b>. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nc-mssip-pfnisfilesupported">pfnIsFileSupported</a>.
     * @type {Pointer<Char>}
     */
    pwszIsFunctionName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that retrieves the signed data. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipgetsigneddatamsg">CryptSIPGetSignedDataMsg</a>.
     * @type {Pointer<Char>}
     */
    pwszGetFuncName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that stores the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Authenticode</a> signature in the target file. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipputsigneddatamsg">CryptSIPPutSignedDataMsg</a>.
     * @type {Pointer<Char>}
     */
    pwszPutFuncName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that creates the hash. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipcreateindirectdata">CryptSIPCreateIndirectData</a>.
     * @type {Pointer<Char>}
     */
    pwszCreateFuncName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that verifies the hash. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipverifyindirectdata">CryptSIPVerifyIndirectData</a>.
     * @type {Pointer<Char>}
     */
    pwszVerifyFuncName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that removes the signed data. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipremovesigneddatamsg">CryptSIPRemoveSignedDataMsg</a>.
     * @type {Pointer<Char>}
     */
    pwszRemoveFuncName {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that determines whether the file name extension is supported by this SIP. This member can be <b>NULL</b>. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nc-mssip-pfnisfilesupportedname">pfnIsFileSupportedName</a>.
     * @type {Pointer<Char>}
     */
    pwszIsFunctionNameFmt2 {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Pointer to a null-terminated string that contains the name  of the function that determines the capabilities of the SIP. If this parameter is set to <b>NULL</b>, multiple signatures are not available for this SIP. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nc-mssip-pcryptsipgetcaps">pCryptSIPGetCaps</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     * @type {Pointer<Char>}
     */
    pwszGetCapFuncName {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
