#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumCERTVIEWEXTENSION.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an extension-enumeration sequence that contains the certificate extension data for the current row of the row-enumeration sequence.
 * @see https://docs.microsoft.com/windows/win32/api//certview/nn-certview-ienumcertviewextension
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
     * @param {Pointer<Integer>} pIndex A pointer to a variable that contains the index value of the next extension being referenced. If there are no more extensions to enumerate, this variable will be set to –1. This method fails if <i>pIndex</i> is <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and the next extension is now being referenced. If there are no more extensions, S_FALSE is returned, and the  <i>pIndex</i> parameter is set to a value of –1.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is the index value of the extension that is now referenced by the extension-enumeration sequence. If there are no more extensions to enumerate, the return value is –1.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewextension-next
     */
    Next(pIndex) {
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pIndexMarshal, pIndex, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the current extension in the extension-enumeration sequence.
     * @param {Pointer<BSTR>} pstrOut A pointer to a value of <b>BSTR</b> type that contains the name of the extension.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and tat the <i>pstrOut</i> parameter is set to the name of the extension.
     * 
     * To use this method, create a variable of <b>BSTR</b> type, set the variable equal to <b>NULL</b>, and pass the address of this variable as <i>pstrOut</i>. When you have finished using the <b>BSTR</b>, free it by calling the <a href="/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is a <b>String</b> that contains the name of the extension.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewextension-getname
     */
    GetName(pstrOut) {
        result := ComCall(8, this, "ptr", pstrOut, "HRESULT")
        return result
    }

    /**
     * Retrieves the policy and origin flags of the current extension in the extension-enumeration sequence.
     * @param {Pointer<Integer>} pFlags A pointer to a <b>LONG</b> type that contains the policy and origin flags of the extension. This method fails if the <i>pFlags</i> parameter is set to <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value represents the policy and origin values of the extension.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewextension-getflags
     */
    GetFlags(pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of the current extension in the extension-enumeration sequence.
     * @param {Integer} Type Data type for the returned data. This parameter can be used to specify that the extension data be decoded before being returned. If PROPTYPE_BINARY is specified, the data is not decoded but instead returned in its raw format.
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarValue A pointer to a value of <b>VARIANT</b> type that contains the data for the currently referenced extension. This method fails if the   <i>pvarValue</i> parameter is <b>NULL</b>. Upon successful completion of this function, <i>pvarValue</i> contains the extension data currently referenced by the extension-enumeration sequence. The caller is responsible for calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> when done with the data in <i>pvarValue</i>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is a <b>Variant</b> that represents the data in the extension.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewextension-getvalue
     */
    GetValue(Type, Flags, pvarValue) {
        result := ComCall(10, this, "int", Type, "int", Flags, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * Skips a specified number of extensions in the extension-enumeration sequence.
     * @param {Integer} celt The number of extensions to skip. A positive value for the <i>celt</i> parameter causes the extension-enumeration sequence to skip forward in the  sequence. A negative value for the <i>celt</i> parameter causes the extension-enumeration sequence  to skip backward in the  sequence.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * A return value of E_INVALIDARG indicates that a negative value for the <i>celt</i> parameter caused the extension-enumeration sequence  index to become less than zero.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewextension-skip
     */
    Skip(celt) {
        result := ComCall(11, this, "int", celt, "HRESULT")
        return result
    }

    /**
     * Moves to the beginning of the extension-enumeration sequence.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewextension-reset
     */
    Reset() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the extension-enumeration sequence.
     * @returns {IEnumCERTVIEWEXTENSION} A pointer to a pointer of <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewextension">IEnumCERTVIEWEXTENSION</a> type. This method will fail if the <i>ppenum</i> parameter is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewextension-clone
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumCERTVIEWEXTENSION(ppenum)
    }
}
