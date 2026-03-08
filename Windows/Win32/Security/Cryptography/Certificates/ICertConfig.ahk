#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ICertConfig interface provides functionality for retrieving the public configuration data (specified during client setup) for a Certificate Services server.
 * @see https://learn.microsoft.com/windows/win32/api/certcli/nn-certcli-icertconfig
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertConfig extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertConfig
     * @type {Guid}
     */
    static IID => Guid("{372fce34-4324-11d0-8810-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "Next", "GetField", "GetConfig"]

    /**
     * Resets the configuration query state to point at the Certificate Services server configuration indexed on the specified configuration point. This method was first defined in the ICertConfig interface.
     * @param {Integer} Index Specifies the configuration point used by the configuration query to index a Certificate Services server configuration. The first configuration is index zero.
     * @returns {Integer} A pointer to the number of configurations in the enterprise.
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-reset
     */
    Reset(Index) {
        result := ComCall(7, this, "int", Index, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Retrieves the index of the next available Certificate Services server configuration in the configuration point. This method was first defined in the ICertConfig interface.
     * @returns {Integer} A pointer to a <b>Long</b> variable that will contain the index of the enumerated configuration, or –1 if there are no more configurations to enumerate.
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-next
     */
    Next() {
        result := ComCall(8, this, "int*", &pIndex := 0, "HRESULT")
        return pIndex
    }

    /**
     * Gets a specific field from the current record of the configuration database. This method was first defined in the ICertConfig interface.
     * @remarks
     * This method returns the field data for the specified field.
     * 
     * When you specify "Flags" in the <i>strFieldName</i> parameter, the retrieved data for the flags field is a string that can be converted to an integer by means of the C-library function <b>_wtoi</b>. The resulting integer represents a bitfield that can be examined to determine whether the flags CAIF_DSENTRY and CAIF_SHAREDFOLDERENTRY are set. If CAIF_DSENTRY (0x00000001) is set, the information for the CA was contained in Directory Services. If CAIF_SHAREDFOLDERENTRY (0x00000002) is set, the information for the CA was contained in the shared folder. Note that one or both of these flags may be set.
     * @param {BSTR} strFieldName Specifies the name of the field to return. This parameter can be one of the following valid strings for field names (note that some certification authorities may not provide data for each field).
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Authority"></a><a id="authority"></a><a id="AUTHORITY"></a><dl>
     * <dt><b>Authority</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reference certification authority (CA) name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CommonName"></a><a id="commonname"></a><a id="COMMONNAME"></a><dl>
     * <dt><b>CommonName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Common name of the server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Config"></a><a id="config"></a><a id="CONFIG"></a><dl>
     * <dt><b>Config</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reference computer\CA name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Country"></a><a id="country"></a><a id="COUNTRY"></a><dl>
     * <dt><b>Country</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Country/region.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Description"></a><a id="description"></a><a id="DESCRIPTION"></a><dl>
     * <dt><b>Description</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Descriptive comment about the server (replaces obsolete "Comment").
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ExchangeCertificate"></a><a id="exchangecertificate"></a><a id="EXCHANGECERTIFICATE"></a><dl>
     * <dt><b>ExchangeCertificate</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Name of the file that contains the exchange certificate (applies to Certificate Services 1.0 only).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Flags"></a><a id="flags"></a><a id="FLAGS"></a><dl>
     * <dt><b>Flags</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * String that represents the location where the CA information was found. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Locality"></a><a id="locality"></a><a id="LOCALITY"></a><dl>
     * <dt><b>Locality</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * City or town.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Organization"></a><a id="organization"></a><a id="ORGANIZATION"></a><dl>
     * <dt><b>Organization</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Organization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OrgUnit"></a><a id="orgunit"></a><a id="ORGUNIT"></a><dl>
     * <dt><b>OrgUnit</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Organizational unit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SanitizedName"></a><a id="sanitizedname"></a><a id="SANITIZEDNAME"></a><dl>
     * <dt><b>SanitizedName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * CA name that is <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">sanitized</a> according to the rules described in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nf-certcli-icertconfig-getconfig">GetConfig</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SanitizedShortName"></a><a id="sanitizedshortname"></a><a id="SANITIZEDSHORTNAME"></a><dl>
     * <dt><b>SanitizedShortName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * CA name that is sanitized and shortened according to the rules described in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nf-certcli-icertconfig-getconfig">GetConfig</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Server"></a><a id="server"></a><a id="SERVER"></a><dl>
     * <dt><b>Server</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reference computer name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ShortName"></a><a id="shortname"></a><a id="SHORTNAME"></a><dl>
     * <dt><b>ShortName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SanitizedShortName, but with the '!xxx' sequences, as described in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nf-certcli-icertconfig-getconfig">GetConfig</a>, translated back into the original text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SignatureCertificate"></a><a id="signaturecertificate"></a><a id="SIGNATURECERTIFICATE"></a><dl>
     * <dt><b>SignatureCertificate</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Name of the file that contains the CA certificate (also known as the CA <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">signature certificate</a>); this may or may not be a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">root certificate</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="State"></a><a id="state"></a><a id="STATE"></a><dl>
     * <dt><b>State</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * State or province.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WebEnrollmentServers"></a><a id="webenrollmentservers"></a><a id="WEBENROLLMENTSERVERS"></a><dl>
     * <dt><b>WebEnrollmentServers</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array of certificate enrollment Web service URLs for a specific CA configuration in the Active Directory.
     * 
     * <b>Windows Vista and Windows Storage Server 2003:  </b>This field is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} A pointer to a <b>BSTR</b> that receives the data from the field. When you have finished using the <b>BSTR</b>, free <i>pbstrOut</i> by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-getfield
     */
    GetField(strFieldName) {
        strFieldName := strFieldName is String ? BSTR.Alloc(strFieldName).Value : strFieldName

        pstrOut := BSTR()
        result := ComCall(9, this, "ptr", strFieldName, "ptr", pstrOut, "HRESULT")
        return pstrOut
    }

    /**
     * Retrieves the configuration string for a Certificate Services server. This method was first defined in the ICertConfig interface.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) name portion of the configuration string that this function returns is the exact text entered during the Certificate Services setup process. Note that this text may be different from the form of the CA name found in file names (such as for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a>) or in registry keys. This is because file names and registry keys use a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">sanitized</a> version of the CA name.
     * 
     * The process of sanitizing the CA name is necessary to remove characters that are illegal for file names, registry key names, or distinguished name values, or illegal for reasons specific to Certificate Services. In the sanitizing process, any illegal character in the common name is converted to a five-character representation in the format <b>!</b><i>xxxx</i>, where <b>!</b> is used as an escape character and <i>xxxx</i> represents four hexadecimal digits that uniquely identify the character to be converted.
     * 
     * For example, the number sign (#) is not allowed in distinguished names in Active Directory. If the CA name entered during setup is <b>#</b><i>YourName</i>, the sanitized CA name will be <b>!0023</b><i>YourName</i>.
     * 
     * The following characters, if entered for the common name of the CA during setup, are converted to the <b>!</b><i>xxxx</i> format during the sanitizing process. This list is subject to change.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Character</th>
     * <th>Value in !xxxx format</th>
     * </tr>
     * <tr>
     * <td>Ampersand</td>
     * <td>&amp;</td>
     * <td>!0026</td>
     * </tr>
     * <tr>
     * <td>Apostrophe</td>
     * <td>'</td>
     * <td>!0027</td>
     * </tr>
     * <tr>
     * <td>Asterisk</td>
     * <td>*</td>
     * <td>!002a</td>
     * </tr>
     * <tr>
     * <td>Backslash</td>
     * <td>\</td>
     * <td>!005c</td>
     * </tr>
     * <tr>
     * <td>Left brace</td>
     * <td>{</td>
     * <td>!007b</td>
     * </tr>
     * <tr>
     * <td>Right brace</td>
     * <td>}</td>
     * <td>!007d</td>
     * </tr>
     * <tr>
     * <td>Left bracket</td>
     * <td>[</td>
     * <td>!005b</td>
     * </tr>
     * <tr>
     * <td>Right bracket</td>
     * <td>]</td>
     * <td>!005d</td>
     * </tr>
     * <tr>
     * <td>Caret</td>
     * <td>^</td>
     * <td>!005e</td>
     * </tr>
     * <tr>
     * <td>Colon</td>
     * <td>:</td>
     * <td>!003a</td>
     * </tr>
     * <tr>
     * <td>Comma</td>
     * <td>,</td>
     * <td>!002c</td>
     * </tr>
     * <tr>
     * <td>Equal sign</td>
     * <td>=</td>
     * <td>!003d</td>
     * </tr>
     * <tr>
     * <td>Exclamation point</td>
     * <td>!</td>
     * <td>!0021</td>
     * </tr>
     * <tr>
     * <td>Grave accent</td>
     * <td>`</td>
     * <td>!0060</td>
     * </tr>
     * <tr>
     * <td>Greater than sign</td>
     * <td>&gt;</td>
     * <td>!003e</td>
     * </tr>
     * <tr>
     * <td>Less than sign</td>
     * <td>&lt;</td>
     * <td>!003c</td>
     * </tr>
     * <tr>
     * <td>Number sign</td>
     * <td>#</td>
     * <td>!0023</td>
     * </tr>
     * <tr>
     * <td>Opening parenthesis</td>
     * <td>(</td>
     * <td>!0028</td>
     * </tr>
     * <tr>
     * <td>Closing parenthesis</td>
     * <td>)</td>
     * <td>!0029</td>
     * </tr>
     * <tr>
     * <td>Percent</td>
     * <td>%</td>
     * <td>!0025</td>
     * </tr>
     * <tr>
     * <td>Pipe</td>
     * <td>|</td>
     * <td>!007c</td>
     * </tr>
     * <tr>
     * <td>Plus sign</td>
     * <td>+</td>
     * <td>!002b</td>
     * </tr>
     * <tr>
     * <td>Question mark</td>
     * <td>?</td>
     * <td>!003f</td>
     * </tr>
     * <tr>
     * <td>Quotation mark</td>
     * <td>"</td>
     * <td>!0022</td>
     * </tr>
     * <tr>
     * <td>Semicolon</td>
     * <td>;</td>
     * <td>!003b</td>
     * </tr>
     * <tr>
     * <td>Slash mark</td>
     * <td>/</td>
     * <td>!002f</td>
     * </tr>
     * </table>
     *  
     * 
     * Any nonprinting character and all <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> characters that are not seven bits are also converted to the <b>!</b><i>xxxx</i> format.
     * 
     * A sanitized short name is generated when the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">sanitized name</a> is too long for a 64-character directory services <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">relative distinguished name</a> (RDN). The sanitized short name consists of the sanitized name truncated and appended with a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of the full sanitized name. The sanitized short name reserves some of the 64 characters to contain <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL) suffixes, such as (123).
     * 
     * The certification authority name portion of the configuration string returned by this method is the original text entered during setup. Note that Certificate Services methods that require a certification authority name as a parameter accept the originally entered certification authority name. For example, for the certification authority name <b>#</b><i>YourName</i>, the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-openconnection">ICertView2::OpenConnection</a> method accepts <b>#</b><i>YourName</i> as the parameter's certification authority portion.
     * @param {Integer} Flags Value that specifies the certification authority to use. This parameter can be one of the  following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CC_DEFAULTCONFIG"></a><a id="cc_defaultconfig"></a><dl>
     * <dt><b>CC_DEFAULTCONFIG</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves the default certification authority.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CC_FIRSTCONFIG"></a><a id="cc_firstconfig"></a><dl>
     * <dt><b>CC_FIRSTCONFIG</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the first certification authority.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CC_LOCALACTIVECONFIG"></a><a id="cc_localactiveconfig"></a><dl>
     * <dt><b>CC_LOCALACTIVECONFIG</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves the local certification authority if it is running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CC_LOCALCONFIG"></a><a id="cc_localconfig"></a><dl>
     * <dt><b>CC_LOCALCONFIG</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves the local certification authority.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CC_UIPICKCONFIG"></a><a id="cc_uipickconfig"></a><dl>
     * <dt><b>CC_UIPICKCONFIG</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Displays a user interface that allows the user to select a certification authority.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CC_UIPICKCONFIGSKIPLOCALCA_"></a><a id="cc_uipickconfigskiplocalca_"></a><dl>
     * <dt><b>CC_UIPICKCONFIGSKIPLOCALCA </b></dt>
     * <dt>0x00000005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Displays a user interface that allows the user to select a certification authority. The UI excludes any local certification authority. This exclusion is useful during subordinate certification authority certificate renewal when the subordinate certification authority certificate request is submitted to a certification authority other than the current certification authority.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} A pointer to a <b>BSTR</b> that contains the configuration. When you have finished using the configuration, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function to free <i>pbstrOut</i>.
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-getconfig
     */
    GetConfig(Flags) {
        pstrOut := BSTR()
        result := ComCall(10, this, "int", Flags, "ptr", pstrOut, "HRESULT")
        return pstrOut
    }
}
