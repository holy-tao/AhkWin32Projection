#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\InputScope.ahk" { InputScope }

/**
 * The ITfInputScope interface is used by the text input processors to get the InputScope value that represents a document context associated with a window.
 * @remarks
 * To use this interface with window-less controls, an application has two options.
 * 
 * <ol>
 * <li><b>Make the application TSF-aware:  </b>A TSF-aware application must implement either <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nn-textstor-itextstoreacp">ITextStoreACP</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontextowner">ITfContextOwner</a> to get a pointer to <b>ITfInputScope</b>.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/inputscope/nf-inputscope-setinputscopes">SetInputScopes</a>  This is not recommended, but if the application is not TSF-aware, there is no other way to maintain the association between the input scope and the application. In this case, the application must call SetInputScopes whenever focus changes among window-less controls.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api/inputscope/nn-inputscope-itfinputscope
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfInputScope extends IUnknown {
    /**
     * The interface identifier for ITfInputScope
     * @type {Guid}
     */
    static IID := Guid("{fde1eaee-6924-4cdf-91e7-da38cff5559d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfInputScope interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInputScopes       : IntPtr
        GetPhrase            : IntPtr
        GetRegularExpression : IntPtr
        GetSRGS              : IntPtr
        GetXML               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfInputScope.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfInputScope::GetInputScopes method
     * @param {Pointer<Pointer<InputScope>>} pprgInputScopes Pointer to an array of pointers to the input scopes. The calling function must call <b>CoTaskMemFree()</b> to free the buffer.
     * @param {Pointer<Integer>} pcCount Pointer to the number of input scopes returned.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/inputscope/nf-inputscope-itfinputscope-getinputscopes
     */
    GetInputScopes(pprgInputScopes, pcCount) {
        pprgInputScopesMarshal := pprgInputScopes is VarRef ? "ptr*" : "ptr"
        pcCountMarshal := pcCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pprgInputScopesMarshal, pprgInputScopes, pcCountMarshal, pcCount, "HRESULT")
        return result
    }

    /**
     * ITfInputScope::GetPhrase method
     * @param {Pointer<Pointer<BSTR>>} ppbstrPhrases Pointer to an array of pointers to strings containing phrases. The calling function must call <b>SystFreeString()</b> to free the memory allocated to the strings and <b>CoTaskMemFree</b> to free the buffer.
     * @param {Pointer<Integer>} pcCount Pointer to the number of phrases returned.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/inputscope/nf-inputscope-itfinputscope-getphrase
     */
    GetPhrase(ppbstrPhrases, pcCount) {
        ppbstrPhrasesMarshal := ppbstrPhrases is VarRef ? "ptr*" : "ptr"
        pcCountMarshal := pcCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, ppbstrPhrasesMarshal, ppbstrPhrases, pcCountMarshal, pcCount, "HRESULT")
        return result
    }

    /**
     * ITfInputScope::GetRegularExpression method
     * @returns {BSTR} Pointer to a string containing the regular expression. The calling function must call <b>SystFreeString()</b> to free the memory allocated to the strings.
     * @see https://learn.microsoft.com/windows/win32/api/inputscope/nf-inputscope-itfinputscope-getregularexpression
     */
    GetRegularExpression() {
        pbstrRegExp := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pbstrRegExp, "HRESULT")
        return pbstrRegExp
    }

    /**
     * ITfInputScope::GetSRGS method
     * @remarks
     * <a href="https://www.w3.org/tr/speech-grammar">http://www.w3.org/TR/speech-grammar</a>
     * @returns {BSTR} The xml string. The calling function must call <b>SysFreeString()</b> to free the buffer.
     * @see https://learn.microsoft.com/windows/win32/api/inputscope/nf-inputscope-itfinputscope-getsrgs
     */
    GetSRGS() {
        pbstrSRGS := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, pbstrSRGS, "HRESULT")
        return pbstrSRGS
    }

    /**
     * ITfInputScope::GetXML method
     * @returns {BSTR} Pointer to a string containing the xml string. The calling function must call <b>SysFreeString()</b> to free the buffer.
     * @see https://learn.microsoft.com/windows/win32/api/inputscope/nf-inputscope-itfinputscope-getxml
     */
    GetXML() {
        pbstrXML := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrXML, "HRESULT")
        return pbstrXML
    }

    Query(iid) {
        if (ITfInputScope.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInputScopes := CallbackCreate(GetMethod(implObj, "GetInputScopes"), flags, 3)
        this.vtbl.GetPhrase := CallbackCreate(GetMethod(implObj, "GetPhrase"), flags, 3)
        this.vtbl.GetRegularExpression := CallbackCreate(GetMethod(implObj, "GetRegularExpression"), flags, 2)
        this.vtbl.GetSRGS := CallbackCreate(GetMethod(implObj, "GetSRGS"), flags, 2)
        this.vtbl.GetXML := CallbackCreate(GetMethod(implObj, "GetXML"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInputScopes)
        CallbackFree(this.vtbl.GetPhrase)
        CallbackFree(this.vtbl.GetRegularExpression)
        CallbackFree(this.vtbl.GetSRGS)
        CallbackFree(this.vtbl.GetXML)
    }
}
