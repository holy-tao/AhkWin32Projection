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
     * 
     * @param {Pointer<Guid>} Term 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} pResult 
     * @param {Pointer<UInt32>} plcid 
     * @returns {HRESULT} 
     */
    GetLocalizedString(Term, lcid, pResult, plcid) {
        result := ComCall(3, this, "ptr", Term, "uint", lcid, "ptr", pResult, "uint*", plcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Term 
     * @param {Pointer<Guid>} pParentTerm 
     * @returns {HRESULT} 
     */
    GetParentTerm(Term, pParentTerm) {
        result := ComCall(4, this, "ptr", Term, "ptr", pParentTerm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Term 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetMnemonicString(Term, pResult) {
        result := ComCall(5, this, "ptr", Term, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrMnemonic 
     * @param {Pointer<Guid>} pTerm 
     * @returns {HRESULT} 
     */
    LookupMnemonicTerm(bstrMnemonic, pTerm) {
        bstrMnemonic := bstrMnemonic is String ? BSTR.Alloc(bstrMnemonic).Value : bstrMnemonic

        result := ComCall(6, this, "ptr", bstrMnemonic, "ptr", pTerm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Term 
     * @param {Integer} lcid 
     * @param {VARIANT} varValue 
     * @param {Pointer<BSTR>} pbstrResult 
     * @param {Pointer<UInt32>} plcid 
     * @returns {HRESULT} 
     */
    ConvertValueToString(Term, lcid, varValue, pbstrResult, plcid) {
        result := ComCall(7, this, "ptr", Term, "uint", lcid, "ptr", varValue, "ptr", pbstrResult, "uint*", plcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
