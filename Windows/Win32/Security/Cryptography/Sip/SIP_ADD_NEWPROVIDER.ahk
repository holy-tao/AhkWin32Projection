#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Defines a subject interface package (SIP). This structure is used by the CryptSIPAddProvider function.
 * @see https://docs.microsoft.com/windows/win32/api//mssip/ns-mssip-sip_add_newprovider
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
     * @type {PWSTR}
     */
    pwszDLLFileName{
        get {
            if(!this.HasProp("__pwszDLLFileName"))
                this.__pwszDLLFileName := PWSTR(this.ptr + 16)
            return this.__pwszDLLFileName
        }
    }

    /**
     * This member is not used.
     * @type {PWSTR}
     */
    pwszMagicNumber{
        get {
            if(!this.HasProp("__pwszMagicNumber"))
                this.__pwszMagicNumber := PWSTR(this.ptr + 24)
            return this.__pwszMagicNumber
        }
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that determines whether the file contents are supported by this SIP. This member can be <b>NULL</b>. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nc-mssip-pfnisfilesupported">pfnIsFileSupported</a>.
     * @type {PWSTR}
     */
    pwszIsFunctionName{
        get {
            if(!this.HasProp("__pwszIsFunctionName"))
                this.__pwszIsFunctionName := PWSTR(this.ptr + 32)
            return this.__pwszIsFunctionName
        }
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that retrieves the signed data. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipgetsigneddatamsg">CryptSIPGetSignedDataMsg</a>.
     * @type {PWSTR}
     */
    pwszGetFuncName{
        get {
            if(!this.HasProp("__pwszGetFuncName"))
                this.__pwszGetFuncName := PWSTR(this.ptr + 40)
            return this.__pwszGetFuncName
        }
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that stores the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Authenticode</a> signature in the target file. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipputsigneddatamsg">CryptSIPPutSignedDataMsg</a>.
     * @type {PWSTR}
     */
    pwszPutFuncName{
        get {
            if(!this.HasProp("__pwszPutFuncName"))
                this.__pwszPutFuncName := PWSTR(this.ptr + 48)
            return this.__pwszPutFuncName
        }
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that creates the hash. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipcreateindirectdata">CryptSIPCreateIndirectData</a>.
     * @type {PWSTR}
     */
    pwszCreateFuncName{
        get {
            if(!this.HasProp("__pwszCreateFuncName"))
                this.__pwszCreateFuncName := PWSTR(this.ptr + 56)
            return this.__pwszCreateFuncName
        }
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that verifies the hash. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipverifyindirectdata">CryptSIPVerifyIndirectData</a>.
     * @type {PWSTR}
     */
    pwszVerifyFuncName{
        get {
            if(!this.HasProp("__pwszVerifyFuncName"))
                this.__pwszVerifyFuncName := PWSTR(this.ptr + 64)
            return this.__pwszVerifyFuncName
        }
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that removes the signed data. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipremovesigneddatamsg">CryptSIPRemoveSignedDataMsg</a>.
     * @type {PWSTR}
     */
    pwszRemoveFuncName{
        get {
            if(!this.HasProp("__pwszRemoveFuncName"))
                this.__pwszRemoveFuncName := PWSTR(this.ptr + 72)
            return this.__pwszRemoveFuncName
        }
    }

    /**
     * Pointer to a null-terminated string that contains the name of the function that determines whether the file name extension is supported by this SIP. This member can be <b>NULL</b>. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nc-mssip-pfnisfilesupportedname">pfnIsFileSupportedName</a>.
     * @type {PWSTR}
     */
    pwszIsFunctionNameFmt2{
        get {
            if(!this.HasProp("__pwszIsFunctionNameFmt2"))
                this.__pwszIsFunctionNameFmt2 := PWSTR(this.ptr + 80)
            return this.__pwszIsFunctionNameFmt2
        }
    }

    /**
     * Pointer to a null-terminated string that contains the name  of the function that determines the capabilities of the SIP. If this parameter is set to <b>NULL</b>, multiple signatures are not available for this SIP. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nc-mssip-pcryptsipgetcaps">pCryptSIPGetCaps</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     * @type {PWSTR}
     */
    pwszGetCapFuncName{
        get {
            if(!this.HasProp("__pwszGetCapFuncName"))
                this.__pwszGetCapFuncName := PWSTR(this.ptr + 88)
            return this.__pwszGetCapFuncName
        }
    }
}
