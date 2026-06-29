#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SpeechDisplayAttributes.ahk" { SpeechDisplayAttributes }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechPhraseReplacement extends IDispatch {
    /**
     * The interface identifier for ISpeechPhraseReplacement
     * @type {Guid}
     */
    static IID := Guid("{2890a410-53a7-4fb5-94ec-06d4998e3d02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechPhraseReplacement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DisplayAttributes : IntPtr
        get_Text              : IntPtr
        get_FirstElement      : IntPtr
        get_NumberOfElements  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechPhraseReplacement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {SpeechDisplayAttributes} 
     */
    DisplayAttributes {
        get => this.get_DisplayAttributes()
    }

    /**
     * @type {BSTR} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * @type {Integer} 
     */
    FirstElement {
        get => this.get_FirstElement()
    }

    /**
     * @type {Integer} 
     */
    NumberOfElements {
        get => this.get_NumberOfElements()
    }

    /**
     * 
     * @returns {SpeechDisplayAttributes} 
     */
    get_DisplayAttributes() {
        result := ComCall(7, this, "int*", &DisplayAttributes := 0, "HRESULT")
        return DisplayAttributes
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Text() {
        Text := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, Text, "HRESULT")
        return Text
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstElement() {
        result := ComCall(9, this, "int*", &FirstElement := 0, "HRESULT")
        return FirstElement
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfElements() {
        result := ComCall(10, this, "int*", &NumberOfElements := 0, "HRESULT")
        return NumberOfElements
    }

    Query(iid) {
        if (ISpeechPhraseReplacement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DisplayAttributes := CallbackCreate(GetMethod(implObj, "get_DisplayAttributes"), flags, 2)
        this.vtbl.get_Text := CallbackCreate(GetMethod(implObj, "get_Text"), flags, 2)
        this.vtbl.get_FirstElement := CallbackCreate(GetMethod(implObj, "get_FirstElement"), flags, 2)
        this.vtbl.get_NumberOfElements := CallbackCreate(GetMethod(implObj, "get_NumberOfElements"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DisplayAttributes)
        CallbackFree(this.vtbl.get_Text)
        CallbackFree(this.vtbl.get_FirstElement)
        CallbackFree(this.vtbl.get_NumberOfElements)
    }
}
