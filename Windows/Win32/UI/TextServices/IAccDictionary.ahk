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
     * Clients call the IAccDictionary::GetLocalizedString method to get localized strings for all system properties and their values.
     * @param {Pointer<Guid>} Term Type: <b>REFGUID</b>
     * 
     * A globally unique identifier (GUID) that represents a property.
     * @param {Integer} lcid Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LCID</a></b>
     * 
     * The locale of the string to be returned.
     * @param {Pointer<BSTR>} pResult Type: <b>BSTR*</b>
     * 
     * A localized string that represents the term.
     * @param {Pointer<Integer>} plcid Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LCID</a>*</b>
     * 
     * The language of the returned string.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccdictionary-getlocalizedstring
     */
    GetLocalizedString(Term, lcid, pResult, plcid) {
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", Term, "uint", lcid, "ptr", pResult, plcidMarshal, plcid, "HRESULT")
        return result
    }

    /**
     * Clients call the IAccDictionary::GetParentTerm method to navigate through the object hierarchy tree. This method returns the parent object of a specified property.
     * @param {Pointer<Guid>} Term Type: <b>REFGUID</b>
     * 
     * A GUID for a property.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * The parent of the property specified in the <i>Term</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccdictionary-getparentterm
     */
    GetParentTerm(Term) {
        pParentTerm := Guid()
        result := ComCall(4, this, "ptr", Term, "ptr", pParentTerm, "HRESULT")
        return pParentTerm
    }

    /**
     * Retrieves a mnemonic string.Note  Active Accessibility Text Services is deprecated.
     * @param {Pointer<Guid>} Term Type: <b>REFGUID</b>
     * 
     * A GUID representing a property.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * A mnemonic string for the property. This string is not localized.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccdictionary-getmnemonicstring
     */
    GetMnemonicString(Term) {
        pResult := BSTR()
        result := ComCall(5, this, "ptr", Term, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * Clients call the IAccDictionary::LookupMnemonicTerm method to find the property for a given mnemonic string.
     * @param {BSTR} bstrMnemonic Type: <b>BSTR</b>
     * 
     * A non-localized mnemonic string for a property.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A GUID representing the property in <i>bstrMnemonic</i>.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccdictionary-lookupmnemonicterm
     */
    LookupMnemonicTerm(bstrMnemonic) {
        bstrMnemonic := bstrMnemonic is String ? BSTR.Alloc(bstrMnemonic).Value : bstrMnemonic

        pTerm := Guid()
        result := ComCall(6, this, "ptr", bstrMnemonic, "ptr", pTerm, "HRESULT")
        return pTerm
    }

    /**
     * Clients call the IAccDictionary::ConvertValueToString method to convert a value to a localized string.
     * @param {Pointer<Guid>} Term Type: <b>REFGUID</b>
     * 
     * A GUID that represents a property.
     * @param {Integer} lcid Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LCID</a></b>
     * 
     * The locale of the string to be returned.
     * @param {VARIANT} varValue Type: <b>VARIANT</b>
     * 
     * The value of the item.
     * @param {Pointer<BSTR>} pbstrResult Type: <b>BSTR*</b>
     * 
     * A pointer to the converted value.
     * @param {Pointer<Integer>} plcid Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LCID</a>*</b>
     * 
     * A pointer to the language of the returned string.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccdictionary-convertvaluetostring
     */
    ConvertValueToString(Term, lcid, varValue, pbstrResult, plcid) {
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", Term, "uint", lcid, "ptr", varValue, "ptr", pbstrResult, plcidMarshal, plcid, "HRESULT")
        return result
    }
}
