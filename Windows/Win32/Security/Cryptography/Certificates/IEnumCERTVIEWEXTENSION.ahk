#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumCERTVIEWEXTENSION.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an extension-enumeration sequence that contains the certificate extension data for the current row of the row-enumeration sequence.
 * @see https://learn.microsoft.com/windows/win32/api//content/certview/nn-certview-ienumcertviewextension
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnumCERTVIEWEXTENSION extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCERTVIEWEXTENSION
     * @type {Guid}
     */
    static IID => Guid("{e7dd1466-7653-11d1-9bde-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "GetName", "GetFlags", "GetValue", "Skip", "Reset", "Clone"]

    /**
     * Moves to the next extension in the extension-enumeration sequence.
     * @remarks
     * Upon successful completion of this method, the extension name, flags, and value can be accessed through 
     * the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-getname">IEnumCERTVIEWEXTENSION::GetName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-getflags">IEnumCERTVIEWEXTENSION::GetFlags</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-getvalue">IEnumCERTVIEWEXTENSION::GetValue</a>
     * </li>
     * </ul>
     * @param {Pointer<Integer>} pIndex A pointer to a variable that contains the index value of the next extension being referenced. If there are no more extensions to enumerate, this variable will be set to –1. This method fails if <i>pIndex</i> is <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and the next extension is now being referenced. If there are no more extensions, S_FALSE is returned, and the  <i>pIndex</i> parameter is set to a value of –1.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is the index value of the extension that is now referenced by the extension-enumeration sequence. If there are no more extensions to enumerate, the return value is –1.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-ienumcertviewextension-next
     */
    Next(pIndex) {
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pIndexMarshal, pIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the name of the current extension in the extension-enumeration sequence.
     * @remarks
     * This function is used to retrieve the name of the extension currently referenced by the 
     * extension-enumeration sequence.
     * 
     * If the extension-enumeration sequence is not referencing a valid extension, <b>GetName</b> will fail. Use one of the following methods to navigate through the enumeration:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-reset">IEnumCERTVIEWEXTENSION::Reset</a>: Moves to the next extension in the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-next">IEnumCERTVIEWEXTENSION::Next</a>: Moves to the next extension in the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-skip">IEnumCERTVIEWEXTENSION::Skip</a>: Skips a specified number of extensions.</li>
     * </ul>
     * @param {Pointer<BSTR>} pstrOut A pointer to a value of <b>BSTR</b> type that contains the name of the extension.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and tat the <i>pstrOut</i> parameter is set to the name of the extension.
     * 
     * To use this method, create a variable of <b>BSTR</b> type, set the variable equal to <b>NULL</b>, and pass the address of this variable as <i>pstrOut</i>. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is a <b>String</b> that contains the name of the extension.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-ienumcertviewextension-getname
     */
    GetName(pstrOut) {
        result := ComCall(8, this, "ptr", pstrOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the policy and origin flags of the current extension in the extension-enumeration sequence.
     * @remarks
     * This method is used to retrieve the policy and origin flags of the extension currently referenced by the 
     * extension-enumeration sequence.
     * 
     * Policy flags provide information about the certificate extension and can be  set by the policy module.
     * 
     * Origin flags indicate the module that set the certificate extension and are set only by the server engine.
     * 
     * One or more policy flags can be returned from an extension. The following are predefined policy flags.
     * 
     * <table>
     * <tr>
     * <th>Policy flag value</th>
     * <th>Explanation</th>
     * </tr>
     * <tr>
     * <td>EXTENSION_CRITICAL_FLAG</td>
     * <td>This is a critical extension.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_DISABLE_FLAG</td>
     * <td>Extension will not be used.</td>
     * </tr>
     * </table>
     *  
     * 
     * One of the following origin flags can also be returned.
     * 
     * <table>
     * <tr>
     * <th>Origin flag value</th>
     * <th>Explanation</th>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_REQUEST</td>
     * <td>The extension was extracted from an array of extensions stored in the szOID_CERT_EXTENSIONS (1.3.6.1.4.1.311.2.1.14) or szOID_RSA_certExtensions (1.2.840.113549.1.9.14) attribute of a PKCS #10 request.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_POLICY</td>
     * <td>The policy module set the extension.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_ADMIN</td>
     * <td>The administrator set the extension.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_SERVER</td>
     * <td>The server engine set the extension.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_RENEWALCERT</td>
     * <td>The extension was extracted from the certificate stored in the szOID_RENEWAL_CERTIFICATE (1.3.6.1.4.1.311.13.1) attribute of a PKCS #10 renewal request.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_IMPORTEDCERT</td>
     * <td>The extension was extracted from an imported certificate (the certificate was passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-icertadmin-importcertificate">ICertAdmin::ImportCertificate</a>).</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_PKCS7</td>
     * <td>The extension was extracted from an array of extensions stored in the szOID_CERT_EXTENSIONS (1.3.6.1.4.1.311.2.1.14) or szOID_RSA_certExtensions (1.2.840.113549.1.9.14) attribute of a PKCS #7 request.</td>
     * </tr>
     * </table>
     *  
     * 
     * Predefined masks are provided for ease of use in determining which flags are set in the return value. The following masks are provided.
     * 
     * <table>
     * <tr>
     * <th>Mask value</th>
     * <th>Explanation</th>
     * </tr>
     * <tr>
     * <td>EXTENSION_POLICY_MASK</td>
     * <td>This value (0x0000FFFF) is used to examine policy flags.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_MASK</td>
     * <td>This value (0x000F0000) is used to examine origin flags.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the extension-enumeration sequence is not referencing a valid extension, <b>GetFlags</b> will fail. Use one of the following methods to navigate through the enumeration:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-reset">IEnumCERTVIEWEXTENSION::Reset</a>: Moves to the next extension in the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-next">IEnumCERTVIEWEXTENSION::Next</a>: Moves to the next extension in the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-skip">IEnumCERTVIEWEXTENSION::Skip</a>: Skips a specified number of extensions.</li>
     * </ul>
     * @param {Pointer<Integer>} pFlags A pointer to a <b>LONG</b> type that contains the policy and origin flags of the extension. This method fails if the <i>pFlags</i> parameter is set to <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value represents the policy and origin values of the extension.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-ienumcertviewextension-getflags
     */
    GetFlags(pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pFlagsMarshal, pFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the value of the current extension in the extension-enumeration sequence.
     * @remarks
     * This method is used to retrieve the data in the extension currently being referenced by the 
     * extension-enumeration sequence.
     * 
     * If the extension-enumeration sequence is not referencing a valid extension, <b>GetValue</b> fails.  Use one of the following methods to navigate through the enumeration:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-reset">IEnumCERTVIEWEXTENSION::Reset</a>: Moves to the next extension in the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-next">IEnumCERTVIEWEXTENSION::Next</a>: Moves to the next extension in the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-skip">IEnumCERTVIEWEXTENSION::Skip</a>: Skips a specified number of extensions.</li>
     * </ul>
     * This method fails if the extension-enumeration sequence was obtained by a call to the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-enumcertviewcolumn">ICertView::EnumCertViewColumn</a> method because  enumeration sequences obtained by that method contain only schema information.
     * @param {Integer} Type Data type for the returned data. This parameter can be used to specify that the extension data be decoded before being returned. If PROPTYPE_BINARY is specified, the data is not decoded but instead returned in its raw format.
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarValue A pointer to a value of <b>VARIANT</b> type that contains the data for the currently referenced extension. This method fails if the   <i>pvarValue</i> parameter is <b>NULL</b>. Upon successful completion of this function, <i>pvarValue</i> contains the extension data currently referenced by the extension-enumeration sequence. The caller is responsible for calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> when done with the data in <i>pvarValue</i>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is a <b>Variant</b> that represents the data in the extension.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-ienumcertviewextension-getvalue
     */
    GetValue(Type, Flags, pvarValue) {
        result := ComCall(10, this, "int", Type, "int", Flags, "ptr", pvarValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Skips a specified number of extensions in the extension-enumeration sequence.
     * @remarks
     * Upon successful completion of this method, call  the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-next">IEnumCERTVIEWEXTENSION::Next</a> method to reference the current extension in the extension-enumeration sequence. The extension name, flags, and value can be accessed through 
     * the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-getname">IEnumCERTVIEWEXTENSION::GetName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-getflags">IEnumCERTVIEWEXTENSION::GetFlags</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-getvalue">IEnumCERTVIEWEXTENSION::GetValue</a>
     * </li>
     * </ul>
     * The extension-enumeration sequence maintains an internal zero-based index. The call to the  <b>Skip</b> method causes this index to increase or  decrease by the number of extensions specified in the  <i>celt</i> parameter.
     * 
     * If a negative value of the <i>celt</i> parameter causes the index to be less than zero, the behavior of subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-next">IEnumCERTVIEWEXTENSION::Next</a> is undefined.
     * 
     * If a positive value of the <i>celt</i> parameter causes the index to exceed the last extension in the enumeration sequence, a subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-next">IEnumCERTVIEWEXTENSION::Next</a> method will fail.
     * @param {Integer} celt The number of extensions to skip. A positive value for the <i>celt</i> parameter causes the extension-enumeration sequence to skip forward in the  sequence. A negative value for the <i>celt</i> parameter causes the extension-enumeration sequence  to skip backward in the  sequence.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * A return value of E_INVALIDARG indicates that a negative value for the <i>celt</i> parameter caused the extension-enumeration sequence  index to become less than zero.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-ienumcertviewextension-skip
     */
    Skip(celt) {
        result := ComCall(11, this, "int", celt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Moves to the beginning of the extension-enumeration sequence.
     * @remarks
     * Upon successful completion of this method, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-next">IEnumCERTVIEWEXTENSION::Next</a> method to reference the first extension in the extension-enumeration sequence.
     * 
     * The extension name, flags, and value can be accessed through 
     * the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-getname">IEnumCERTVIEWEXTENSION::GetName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-getflags">IEnumCERTVIEWEXTENSION::GetFlags</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewextension-getvalue">IEnumCERTVIEWEXTENSION::GetValue</a>
     * </li>
     * </ul>
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-ienumcertviewextension-reset
     */
    Reset() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a copy of the extension-enumeration sequence.
     * @remarks
     * The extension-enumeration sequence object is obtained by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-enumcertviewextension">IEnumCERTVIEWROW::EnumCertViewExtension</a> method.
     * @returns {IEnumCERTVIEWEXTENSION} A pointer to a pointer of <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewextension">IEnumCERTVIEWEXTENSION</a> type. This method will fail if the <i>ppenum</i> parameter is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-ienumcertviewextension-clone
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &ppenum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumCERTVIEWEXTENSION(ppenum)
    }
}
