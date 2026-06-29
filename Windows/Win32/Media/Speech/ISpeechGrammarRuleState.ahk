#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechGrammarRule.ahk" { ISpeechGrammarRule }
#Import ".\ISpeechGrammarRuleStateTransitions.ahk" { ISpeechGrammarRuleStateTransitions }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SpeechSpecialTransitionType.ahk" { SpeechSpecialTransitionType }
#Import ".\SpeechGrammarWordType.ahk" { SpeechGrammarWordType }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechGrammarRuleState extends IDispatch {
    /**
     * The interface identifier for ISpeechGrammarRuleState
     * @type {Guid}
     */
    static IID := Guid("{d4286f2c-ee67-45ae-b928-28d695362eda}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechGrammarRuleState interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Rule             : IntPtr
        get_Transitions      : IntPtr
        AddWordTransition    : IntPtr
        AddRuleTransition    : IntPtr
        AddSpecialTransition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechGrammarRuleState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISpeechGrammarRule} 
     */
    Rule {
        get => this.get_Rule()
    }

    /**
     * @type {ISpeechGrammarRuleStateTransitions} 
     */
    Transitions {
        get => this.get_Transitions()
    }

    /**
     * 
     * @returns {ISpeechGrammarRule} 
     */
    get_Rule() {
        result := ComCall(7, this, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * 
     * @returns {ISpeechGrammarRuleStateTransitions} 
     */
    get_Transitions() {
        result := ComCall(8, this, "ptr*", &Transitions := 0, "HRESULT")
        return ISpeechGrammarRuleStateTransitions(Transitions)
    }

    /**
     * 
     * @param {ISpeechGrammarRuleState} DestState 
     * @param {BSTR} Words 
     * @param {BSTR} Separators 
     * @param {SpeechGrammarWordType} Type 
     * @param {BSTR} PropertyName 
     * @param {Integer} PropertyId 
     * @param {Pointer<VARIANT>} _PropertyValue 
     * @param {Float} Weight 
     * @returns {HRESULT} 
     */
    AddWordTransition(DestState, Words, Separators, Type, PropertyName, PropertyId, _PropertyValue, Weight) {
        Words := Words is String ? BSTR.Alloc(Words).Value : Words
        Separators := Separators is String ? BSTR.Alloc(Separators).Value : Separators
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(9, this, "ptr", DestState, BSTR, Words, BSTR, Separators, SpeechGrammarWordType, Type, BSTR, PropertyName, "int", PropertyId, VARIANT.Ptr, _PropertyValue, "float", Weight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpeechGrammarRuleState} DestinationState 
     * @param {ISpeechGrammarRule} Rule 
     * @param {BSTR} PropertyName 
     * @param {Integer} PropertyId 
     * @param {Pointer<VARIANT>} _PropertyValue 
     * @param {Float} Weight 
     * @returns {HRESULT} 
     */
    AddRuleTransition(DestinationState, Rule, PropertyName, PropertyId, _PropertyValue, Weight) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(10, this, "ptr", DestinationState, "ptr", Rule, BSTR, PropertyName, "int", PropertyId, VARIANT.Ptr, _PropertyValue, "float", Weight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpeechGrammarRuleState} DestinationState 
     * @param {SpeechSpecialTransitionType} Type 
     * @param {BSTR} PropertyName 
     * @param {Integer} PropertyId 
     * @param {Pointer<VARIANT>} _PropertyValue 
     * @param {Float} Weight 
     * @returns {HRESULT} 
     */
    AddSpecialTransition(DestinationState, Type, PropertyName, PropertyId, _PropertyValue, Weight) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(11, this, "ptr", DestinationState, SpeechSpecialTransitionType, Type, BSTR, PropertyName, "int", PropertyId, VARIANT.Ptr, _PropertyValue, "float", Weight, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechGrammarRuleState.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Rule := CallbackCreate(GetMethod(implObj, "get_Rule"), flags, 2)
        this.vtbl.get_Transitions := CallbackCreate(GetMethod(implObj, "get_Transitions"), flags, 2)
        this.vtbl.AddWordTransition := CallbackCreate(GetMethod(implObj, "AddWordTransition"), flags, 9)
        this.vtbl.AddRuleTransition := CallbackCreate(GetMethod(implObj, "AddRuleTransition"), flags, 7)
        this.vtbl.AddSpecialTransition := CallbackCreate(GetMethod(implObj, "AddSpecialTransition"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Rule)
        CallbackFree(this.vtbl.get_Transitions)
        CallbackFree(this.vtbl.AddWordTransition)
        CallbackFree(this.vtbl.AddRuleTransition)
        CallbackFree(this.vtbl.AddSpecialTransition)
    }
}
