#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechPhraseProperties.ahk" { ISpeechPhraseProperties }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\SpeechEngineConfidence.ahk" { SpeechEngineConfidence }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechPhraseProperty extends IDispatch {
    /**
     * The interface identifier for ISpeechPhraseProperty
     * @type {Guid}
     */
    static IID := Guid("{ce563d48-961e-4732-a2e1-378a42b430be}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechPhraseProperty interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name             : IntPtr
        get_Id               : IntPtr
        get_Value            : IntPtr
        get_FirstElement     : IntPtr
        get_NumberOfElements : IntPtr
        get_EngineConfidence : IntPtr
        get_Confidence       : IntPtr
        get_Parent           : IntPtr
        get_Children         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechPhraseProperty.Vtbl()
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
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
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
     * @type {Float} 
     */
    EngineConfidence {
        get => this.get_EngineConfidence()
    }

    /**
     * @type {SpeechEngineConfidence} 
     */
    Confidence {
        get => this.get_Confidence()
    }

    /**
     * @type {ISpeechPhraseProperty} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {ISpeechPhraseProperties} 
     */
    Children {
        get => this.get_Children()
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
     * @returns {VARIANT} 
     */
    get_Value() {
        Value := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, Value, "HRESULT")
        return Value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstElement() {
        result := ComCall(10, this, "int*", &FirstElement := 0, "HRESULT")
        return FirstElement
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfElements() {
        result := ComCall(11, this, "int*", &NumberOfElements := 0, "HRESULT")
        return NumberOfElements
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EngineConfidence() {
        result := ComCall(12, this, "float*", &Confidence := 0, "HRESULT")
        return Confidence
    }

    /**
     * 
     * @returns {SpeechEngineConfidence} 
     */
    get_Confidence() {
        result := ComCall(13, this, "int*", &Confidence := 0, "HRESULT")
        return Confidence
    }

    /**
     * 
     * @returns {ISpeechPhraseProperty} 
     */
    get_Parent() {
        result := ComCall(14, this, "ptr*", &ParentProperty := 0, "HRESULT")
        return ISpeechPhraseProperty(ParentProperty)
    }

    /**
     * 
     * @returns {ISpeechPhraseProperties} 
     */
    get_Children() {
        result := ComCall(15, this, "ptr*", &Children := 0, "HRESULT")
        return ISpeechPhraseProperties(Children)
    }

    Query(iid) {
        if (ISpeechPhraseProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.get_FirstElement := CallbackCreate(GetMethod(implObj, "get_FirstElement"), flags, 2)
        this.vtbl.get_NumberOfElements := CallbackCreate(GetMethod(implObj, "get_NumberOfElements"), flags, 2)
        this.vtbl.get_EngineConfidence := CallbackCreate(GetMethod(implObj, "get_EngineConfidence"), flags, 2)
        this.vtbl.get_Confidence := CallbackCreate(GetMethod(implObj, "get_Confidence"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.get_Children := CallbackCreate(GetMethod(implObj, "get_Children"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.get_FirstElement)
        CallbackFree(this.vtbl.get_NumberOfElements)
        CallbackFree(this.vtbl.get_EngineConfidence)
        CallbackFree(this.vtbl.get_Confidence)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.get_Children)
    }
}
