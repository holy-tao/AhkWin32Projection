#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ISpeechGrammarRule.ahk" { ISpeechGrammarRule }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\SpeechRuleAttributes.ahk" { SpeechRuleAttributes }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechGrammarRules extends IDispatch {
    /**
     * The interface identifier for ISpeechGrammarRules
     * @type {Guid}
     */
    static IID := Guid("{6ffa3b44-fc2d-40d1-8afc-32911c7f1ad1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechGrammarRules interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count     : IntPtr
        FindRule      : IntPtr
        Item          : IntPtr
        get__NewEnum  : IntPtr
        get_Dynamic   : IntPtr
        Add           : IntPtr
        Commit        : IntPtr
        CommitAndSave : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechGrammarRules.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Dynamic {
        get => this.get_Dynamic()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {VARIANT} RuleNameOrId 
     * @returns {ISpeechGrammarRule} 
     */
    FindRule(RuleNameOrId) {
        result := ComCall(8, this, VARIANT, RuleNameOrId, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} Index 
     * @returns {ISpeechGrammarRule} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(Index) {
        result := ComCall(9, this, "int", Index, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(10, this, "ptr*", &EnumVARIANT := 0, "HRESULT")
        return IUnknown(EnumVARIANT)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Dynamic() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &Dynamic := 0, "HRESULT")
        return Dynamic
    }

    /**
     * 
     * @param {BSTR} RuleName 
     * @param {SpeechRuleAttributes} Attributes 
     * @param {Integer} RuleId 
     * @returns {ISpeechGrammarRule} 
     */
    Add(RuleName, Attributes, RuleId) {
        RuleName := RuleName is String ? BSTR.Alloc(RuleName).Value : RuleName

        result := ComCall(12, this, BSTR, RuleName, SpeechRuleAttributes, Attributes, "int", RuleId, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ErrorText 
     * @param {Pointer<VARIANT>} SaveStream 
     * @returns {HRESULT} 
     */
    CommitAndSave(ErrorText, SaveStream) {
        result := ComCall(14, this, BSTR.Ptr, ErrorText, VARIANT.Ptr, SaveStream, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechGrammarRules.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.FindRule := CallbackCreate(GetMethod(implObj, "FindRule"), flags, 3)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Dynamic := CallbackCreate(GetMethod(implObj, "get_Dynamic"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 5)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 1)
        this.vtbl.CommitAndSave := CallbackCreate(GetMethod(implObj, "CommitAndSave"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.FindRule)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Dynamic)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Commit)
        CallbackFree(this.vtbl.CommitAndSave)
    }
}
