#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SpeechGrammarRuleStateTransitionType.ahk" { SpeechGrammarRuleStateTransitionType }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ISpeechGrammarRule.ahk" { ISpeechGrammarRule }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISpeechGrammarRuleState.ahk" { ISpeechGrammarRuleState }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechGrammarRuleStateTransition extends IDispatch {
    /**
     * The interface identifier for ISpeechGrammarRuleStateTransition
     * @type {Guid}
     */
    static IID := Guid("{cafd1db1-41d1-4a06-9863-e2e81da17a9a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechGrammarRuleStateTransition interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Type          : IntPtr
        get_Text          : IntPtr
        get_Rule          : IntPtr
        get_Weight        : IntPtr
        get_PropertyName  : IntPtr
        get_PropertyId    : IntPtr
        get_PropertyValue : IntPtr
        get_NextState     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechGrammarRuleStateTransition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {SpeechGrammarRuleStateTransitionType} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {BSTR} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * @type {ISpeechGrammarRule} 
     */
    Rule {
        get => this.get_Rule()
    }

    /**
     * @type {VARIANT} 
     */
    Weight {
        get => this.get_Weight()
    }

    /**
     * @type {BSTR} 
     */
    PropertyName {
        get => this.get_PropertyName()
    }

    /**
     * @type {Integer} 
     */
    PropertyId {
        get => this.get_PropertyId()
    }

    /**
     * @type {VARIANT} 
     */
    PropertyValue {
        get => this.get_PropertyValue()
    }

    /**
     * @type {ISpeechGrammarRuleState} 
     */
    NextState {
        get => this.get_NextState()
    }

    /**
     * 
     * @returns {SpeechGrammarRuleStateTransitionType} 
     */
    get_Type() {
        result := ComCall(7, this, "int*", &Type := 0, "HRESULT")
        return Type
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
     * @returns {ISpeechGrammarRule} 
     */
    get_Rule() {
        result := ComCall(9, this, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Weight() {
        Weight := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, Weight, "HRESULT")
        return Weight
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PropertyName() {
        PropertyName := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, PropertyName, "HRESULT")
        return PropertyName
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PropertyId() {
        result := ComCall(12, this, "int*", &PropertyId := 0, "HRESULT")
        return PropertyId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PropertyValue() {
        _PropertyValue := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, _PropertyValue, "HRESULT")
        return _PropertyValue
    }

    /**
     * 
     * @returns {ISpeechGrammarRuleState} 
     */
    get_NextState() {
        result := ComCall(14, this, "ptr*", &NextState := 0, "HRESULT")
        return ISpeechGrammarRuleState(NextState)
    }

    Query(iid) {
        if (ISpeechGrammarRuleStateTransition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Text := CallbackCreate(GetMethod(implObj, "get_Text"), flags, 2)
        this.vtbl.get_Rule := CallbackCreate(GetMethod(implObj, "get_Rule"), flags, 2)
        this.vtbl.get_Weight := CallbackCreate(GetMethod(implObj, "get_Weight"), flags, 2)
        this.vtbl.get_PropertyName := CallbackCreate(GetMethod(implObj, "get_PropertyName"), flags, 2)
        this.vtbl.get_PropertyId := CallbackCreate(GetMethod(implObj, "get_PropertyId"), flags, 2)
        this.vtbl.get_PropertyValue := CallbackCreate(GetMethod(implObj, "get_PropertyValue"), flags, 2)
        this.vtbl.get_NextState := CallbackCreate(GetMethod(implObj, "get_NextState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Text)
        CallbackFree(this.vtbl.get_Rule)
        CallbackFree(this.vtbl.get_Weight)
        CallbackFree(this.vtbl.get_PropertyName)
        CallbackFree(this.vtbl.get_PropertyId)
        CallbackFree(this.vtbl.get_PropertyValue)
        CallbackFree(this.vtbl.get_NextState)
    }
}
