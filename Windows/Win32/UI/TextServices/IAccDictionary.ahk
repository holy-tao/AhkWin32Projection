#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for string manipulation.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-iaccdictionary
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IAccDictionary extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccDictionary
     * @type {Guid}
     */
    static IID => Guid("{1dc4cb5f-d737-474d-ade9-5ccfc9bc1cc9}")

    /**
     * The class identifier for AccDictionary
     * @type {Guid}
     */
    static CLSID => Guid("{6572ee16-5fe5-4331-bb6d-76a49c56e423}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocalizedString", "GetParentTerm", "GetMnemonicString", "LookupMnemonicTerm", "ConvertValueToString"]

    /**
     * 
     * @param {Pointer<Guid>} Term 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} pResult 
     * @param {Pointer<Integer>} plcid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccdictionary-getlocalizedstring
     */
    GetLocalizedString(Term, lcid, pResult, plcid) {
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", Term, "uint", lcid, "ptr", pResult, plcidMarshal, plcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Term 
     * @param {Pointer<Guid>} pParentTerm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccdictionary-getparentterm
     */
    GetParentTerm(Term, pParentTerm) {
        result := ComCall(4, this, "ptr", Term, "ptr", pParentTerm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Term 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccdictionary-getmnemonicstring
     */
    GetMnemonicString(Term, pResult) {
        result := ComCall(5, this, "ptr", Term, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMnemonic 
     * @param {Pointer<Guid>} pTerm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccdictionary-lookupmnemonicterm
     */
    LookupMnemonicTerm(bstrMnemonic, pTerm) {
        bstrMnemonic := bstrMnemonic is String ? BSTR.Alloc(bstrMnemonic).Value : bstrMnemonic

        result := ComCall(6, this, "ptr", bstrMnemonic, "ptr", pTerm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Term 
     * @param {Integer} lcid 
     * @param {VARIANT} varValue 
     * @param {Pointer<BSTR>} pbstrResult 
     * @param {Pointer<Integer>} plcid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccdictionary-convertvaluetostring
     */
    ConvertValueToString(Term, lcid, varValue, pbstrResult, plcid) {
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", Term, "uint", lcid, "ptr", varValue, "ptr", pbstrResult, plcidMarshal, plcid, "HRESULT")
        return result
    }
}
