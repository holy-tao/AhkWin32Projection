#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Exposes methods for string manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/msaatext/nn-msaatext-iaccdictionary
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct IAccDictionary extends IUnknown {
    /**
     * The interface identifier for IAccDictionary
     * @type {Guid}
     */
    static IID := Guid("{1dc4cb5f-d737-474d-ade9-5ccfc9bc1cc9}")

    /**
     * The class identifier for AccDictionary
     * @type {Guid}
     */
    static CLSID := Guid("{6572ee16-5fe5-4331-bb6d-76a49c56e423}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccDictionary interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLocalizedString   : IntPtr
        GetParentTerm        : IntPtr
        GetMnemonicString    : IntPtr
        LookupMnemonicTerm   : IntPtr
        ConvertValueToString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccDictionary.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Clients call the IAccDictionary::GetLocalizedString method to get localized strings for all system properties and their values.
     * @remarks
     * This method returns the names of a property in the language specified by <i>lcid</i>. If that language is not on the system, Microsoft Active Accessibility finds the best match and returns the string in that language. If the <i>Term</i> parameter is not found in the dictionary, the <i>pResult</i> will be <b>NULL</b>.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccdictionary-getlocalizedstring
     */
    GetLocalizedString(Term, lcid, pResult, plcid) {
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, Term, "uint", lcid, BSTR.Ptr, pResult, plcidMarshal, plcid, "HRESULT")
        return result
    }

    /**
     * Clients call the IAccDictionary::GetParentTerm method to navigate through the object hierarchy tree. This method returns the parent object of a specified property.
     * @remarks
     * If there is not a parent term for <i>Term</i>, then <i>pParentTerm</i> will point to GUID_NULL.
     * @param {Pointer<Guid>} Term Type: <b>REFGUID</b>
     * 
     * A GUID for a property.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * The parent of the property specified in the <i>Term</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccdictionary-getparentterm
     */
    GetParentTerm(Term) {
        pParentTerm := Guid()
        result := ComCall(4, this, Guid.Ptr, Term, Guid.Ptr, pParentTerm, "HRESULT")
        return pParentTerm
    }

    /**
     * Retrieves a mnemonic string.Note  Active Accessibility Text Services is deprecated.
     * @remarks
     * If the <i>Term</i> parameter is not found in the dictionary, then <i>pResult</i> will be <b>NULL</b>.
     * @param {Pointer<Guid>} Term Type: <b>REFGUID</b>
     * 
     * A GUID representing a property.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * A mnemonic string for the property. This string is not localized.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccdictionary-getmnemonicstring
     */
    GetMnemonicString(Term) {
        pResult := BSTR.Owned()
        result := ComCall(5, this, Guid.Ptr, Term, BSTR.Ptr, pResult, "HRESULT")
        return pResult
    }

    /**
     * Clients call the IAccDictionary::LookupMnemonicTerm method to find the property for a given mnemonic string.
     * @remarks
     * If the <i>bstrMnemonic</i> parameter is not found in the dictionary, then <i>pTerm</i> will be <b>NULL</b>.
     * @param {BSTR} bstrMnemonic Type: <b>BSTR</b>
     * 
     * A non-localized mnemonic string for a property.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A GUID representing the property in <i>bstrMnemonic</i>.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccdictionary-lookupmnemonicterm
     */
    LookupMnemonicTerm(bstrMnemonic) {
        bstrMnemonic := bstrMnemonic is String ? BSTR.Alloc(bstrMnemonic).Value : bstrMnemonic

        pTerm := Guid()
        result := ComCall(6, this, BSTR, bstrMnemonic, Guid.Ptr, pTerm, "HRESULT")
        return pTerm
    }

    /**
     * Clients call the IAccDictionary::ConvertValueToString method to convert a value to a localized string.
     * @remarks
     * If the <i>Term</i> parameter can be true or false, <b>ConvertValueToString</b> will return a localized string or <b>TRUE</b> or <b>FALSE</b>. If the <i>Term</i> parameter represents a color, <b>ConvertValueToString</b> will return a string for the closest color name. If the <i>Term</i> parameter is not found in the dictionary, then <i>pbstrResult</i> will be <b>NULL</b>.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccdictionary-convertvaluetostring
     */
    ConvertValueToString(Term, lcid, varValue, pbstrResult, plcid) {
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, Guid.Ptr, Term, "uint", lcid, VARIANT, varValue, BSTR.Ptr, pbstrResult, plcidMarshal, plcid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAccDictionary.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLocalizedString := CallbackCreate(GetMethod(implObj, "GetLocalizedString"), flags, 5)
        this.vtbl.GetParentTerm := CallbackCreate(GetMethod(implObj, "GetParentTerm"), flags, 3)
        this.vtbl.GetMnemonicString := CallbackCreate(GetMethod(implObj, "GetMnemonicString"), flags, 3)
        this.vtbl.LookupMnemonicTerm := CallbackCreate(GetMethod(implObj, "LookupMnemonicTerm"), flags, 3)
        this.vtbl.ConvertValueToString := CallbackCreate(GetMethod(implObj, "ConvertValueToString"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLocalizedString)
        CallbackFree(this.vtbl.GetParentTerm)
        CallbackFree(this.vtbl.GetMnemonicString)
        CallbackFree(this.vtbl.LookupMnemonicTerm)
        CallbackFree(this.vtbl.ConvertValueToString)
    }
}
