#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISpeechPhraseRules.ahk" { ISpeechPhraseRules }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\SpeechEngineConfidence.ahk" { SpeechEngineConfidence }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechPhraseRule extends IDispatch {
    /**
     * The interface identifier for ISpeechPhraseRule
     * @type {Guid}
     */
    static IID := Guid("{a7bfe112-a4a0-48d9-b602-c313843f6964}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechPhraseRule interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name             : IntPtr
        get_Id               : IntPtr
        get_FirstElement     : IntPtr
        get_NumberOfElements : IntPtr
        get_Parent           : IntPtr
        get_Children         : IntPtr
        get_Confidence       : IntPtr
        get_EngineConfidence : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechPhraseRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
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
     * @type {ISpeechPhraseRule} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {ISpeechPhraseRules} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * @type {SpeechEngineConfidence} 
     */
    Confidence {
        get => this.get_Confidence()
    }

    /**
     * @type {Float} 
     */
    EngineConfidence {
        get => this.get_EngineConfidence()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(8, this, "int*", &Id := 0, "HRESULT")
        return Id
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

    /**
     * 
     * @returns {ISpeechPhraseRule} 
     */
    get_Parent() {
        result := ComCall(11, this, "ptr*", &Parent := 0, "HRESULT")
        return ISpeechPhraseRule(Parent)
    }

    /**
     * 
     * @returns {ISpeechPhraseRules} 
     */
    get_Children() {
        result := ComCall(12, this, "ptr*", &Children := 0, "HRESULT")
        return ISpeechPhraseRules(Children)
    }

    /**
     * 
     * @returns {SpeechEngineConfidence} 
     */
    get_Confidence() {
        result := ComCall(13, this, "int*", &ActualConfidence := 0, "HRESULT")
        return ActualConfidence
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EngineConfidence() {
        result := ComCall(14, this, "float*", &EngineConfidence := 0, "HRESULT")
        return EngineConfidence
    }

    Query(iid) {
        if (ISpeechPhraseRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_FirstElement := CallbackCreate(GetMethod(implObj, "get_FirstElement"), flags, 2)
        this.vtbl.get_NumberOfElements := CallbackCreate(GetMethod(implObj, "get_NumberOfElements"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.get_Children := CallbackCreate(GetMethod(implObj, "get_Children"), flags, 2)
        this.vtbl.get_Confidence := CallbackCreate(GetMethod(implObj, "get_Confidence"), flags, 2)
        this.vtbl.get_EngineConfidence := CallbackCreate(GetMethod(implObj, "get_EngineConfidence"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_FirstElement)
        CallbackFree(this.vtbl.get_NumberOfElements)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.get_Children)
        CallbackFree(this.vtbl.get_Confidence)
        CallbackFree(this.vtbl.get_EngineConfidence)
    }
}
