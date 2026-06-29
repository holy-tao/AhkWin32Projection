#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CERT_GET_CONFIG_FLAGS.ahk" { CERT_GET_CONFIG_FLAGS }

/**
 * Provides functionality for retrieving the public configuration data (specified during client setup) for a Certificate Services server.
 * @see https://learn.microsoft.com/windows/win32/api/certcli/nn-certcli-icertgetconfig
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertGetConfig extends IDispatch {
    /**
     * The interface identifier for ICertGetConfig
     * @type {Guid}
     */
    static IID := Guid("{c7ea09c0-ce17-11d0-8833-00a0c903b83c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertGetConfig interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetConfig : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertGetConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ICertGetConfig::GetConfig method retrieves the configuration string for a Certificate Services server.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) name portion of the configuration string that this function returns is the exact text entered during the Certificate Services setup process. Note that this text may be different from the form of the CA name found in file names (such as for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a>) or in registry keys. This is because file names and registry keys use a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">sanitized</a> version of the CA name.
     * 
     * The process of sanitizing the CA name is necessary to remove characters that are illegal for file names, registry key names, or distinguished name values, or illegal for reasons specific to Certificate Services. In the sanitizing process, any illegal character in the common name is converted to a five-character representation in the format <b>!</b><i>xxxx</i>, where the exclamation point (<b>!</b>) is used as an escape character and <i>xxxx</i> represents four hexadecimal digits that uniquely identify the character to be converted.
     * 
     * For example, the number sign (#) is not allowed in distinguished names in the Active Directory directory service. If the CA name entered during setup is <b>#</b><i>YourName</i>, the sanitized CA name will be <b>!0023</b><i>YourName</i>.
     * 
     * The following characters, if entered for the common name of the CA during setup, are converted to the <b>!</b><i>xxxx</i> format during the sanitizing process. This list is subject to change.
     * 
     * <table>
     * <tr>
     * <th>Character</th>
     * <th>Value in !xxxx format</th>
     * </tr>
     * <tr>
     * <td>&lt;</td>
     * <td>!003c</td>
     * </tr>
     * <tr>
     * <td>&gt;</td>
     * <td>!003e</td>
     * </tr>
     * <tr>
     * <td>"</td>
     * <td>!0022</td>
     * </tr>
     * <tr>
     * <td>/</td>
     * <td>!002f</td>
     * </tr>
     * <tr>
     * <td>\</td>
     * <td>!005c</td>
     * </tr>
     * <tr>
     * <td>:</td>
     * <td>!003a</td>
     * </tr>
     * <tr>
     * <td>|</td>
     * <td>!007c</td>
     * </tr>
     * <tr>
     * <td>?</td>
     * <td>!003f</td>
     * </tr>
     * <tr>
     * <td>*</td>
     * <td>!002a</td>
     * </tr>
     * <tr>
     * <td>#</td>
     * <td>!0023</td>
     * </tr>
     * <tr>
     * <td>,</td>
     * <td>!002c</td>
     * </tr>
     * <tr>
     * <td>+</td>
     * <td>!002b</td>
     * </tr>
     * <tr>
     * <td>;</td>
     * <td>!003b</td>
     * </tr>
     * <tr>
     * <td>!</td>
     * <td>!0021</td>
     * </tr>
     * </table>
     *  
     * 
     * Any nonprinting character and all <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> characters that are not seven bits are also converted to the <b>!</b><i>xxxx</i> format.
     * 
     * A sanitized short name is generated when the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">sanitized name</a> is too long for a 64-character directory services <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">relative distinguished name</a> (RDN). The sanitized short name consists of the sanitized name truncated and appended with a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of the full sanitized name. The sanitized short name reserves some of the 64 characters to contain <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL) suffixes, such as (123).
     * 
     * The CA name portion of the configuration string returned by this method is the original text entered during setup. Note that Certificate Services methods that require a CA name as a parameter accept the originally entered CA name. For example, for the CA name <b>#</b><i>YourName</i>, the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-openconnection">ICertView2::OpenConnection</a> method accepts <b>#</b><i>YourName</i> as the parameter's CA portion.
     * @param {CERT_GET_CONFIG_FLAGS} Flags 
     * @returns {BSTR} A pointer to a <b>BSTR</b> that contains the configuration. When you have finished using the configuration, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function to free <i>pbstrOut</i>.
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertgetconfig-getconfig
     */
    GetConfig(Flags) {
        pstrOut := BSTR.Owned()
        result := ComCall(7, this, CERT_GET_CONFIG_FLAGS, Flags, BSTR.Ptr, pstrOut, "HRESULT")
        return pstrOut
    }

    Query(iid) {
        if (ICertGetConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetConfig := CallbackCreate(GetMethod(implObj, "GetConfig"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetConfig)
    }
}
