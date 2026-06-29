#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\System\Com\IEnumString.ahk" { IEnumString }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the description of a spell checker option.
 * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ioptiondescription
 * @namespace Windows.Win32.Globalization
 */
export default struct IOptionDescription extends IUnknown {
    /**
     * The interface identifier for IOptionDescription
     * @type {Guid}
     */
    static IID := Guid("{432e5f85-35cf-4606-a801-6f70277e1d7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOptionDescription interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Id          : IntPtr
        get_Heading     : IntPtr
        get_Description : IntPtr
        get_Labels      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOptionDescription.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {PWSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {PWSTR} 
     */
    Heading {
        get => this.get_Heading()
    }

    /**
     * @type {PWSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {IEnumString} 
     */
    Labels {
        get => this.get_Labels()
    }

    /**
     * Gets the identifier of the spell checker option.
     * @remarks
     * Option identifiers all exist in the same area. Spell checker providers should use the engine identifier and the language tag (if the option is language-specific) to disambiguate potential collisions. 
     * 
     * Specifically, the structure for naming the option identifiers should be:
     * 
     * <ul>
     * <li><b>For the Microsoft spell checker engine:</b> &lt;language tag&gt;:&lt;option name&gt;. For example, "pt-BR:2009Reform."</li>
     * <li><b>For spell check provider engines:</b> &lt;engine id&gt;:&lt;language tag&gt;:&lt;option name&gt; (the language tag may be omitted if the option is not language specific). For example, "samplespell:fr-FR:AccentedUppercase".</li>
     * </ul>
     * <div class="alert"><b>Note</b>  Spell check providers are allowed to support existing Microsoft option identifiers, but they must not create new option identifiers in the Microsoft namespace. That is, spell check providers must use the engine identifier as a prefix.</div>
     * <div> </div>
     * An option identifier is linked to the set of labels and the semantics associated with them. If any change needs to be made between versions to the option (adding a label to the set of labels), a new option with a new identifier must be used. The only valid change that does not require a new identifier is to change from a single label to two labels and vice-versa when the semantics for values 0 and 1 do not change.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ioptiondescription-get_id
     */
    get_Id() {
        result := ComCall(3, this, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the heading for the spell checker option.
     * @remarks
     * The heading can be used to group sets of options by placing the header on the first item of that group. This should be in the language of the spell checker or localized to the user's UI language.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ioptiondescription-get_heading
     */
    get_Heading() {
        result := ComCall(4, this, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Get the description of the spell checker option.
     * @remarks
     * The description explains the implications of making the various choices associated with the option. This should be in the language of the spell checker or localized to the user's UI language.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ioptiondescription-get_description
     */
    get_Description() {
        result := ComCall(5, this, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the label enumerator for the spell checker option.
     * @remarks
     * When there is a single label, the valid values for this option are 0 (not chosen) and 1 (chosen). When there is more than one label, the first label is associated with the value 0, the second with 1, and so on, effectively forming an enumeration. The labels should be in the language of the spell checker or localized to the user's UI language.
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ioptiondescription-get_labels
     */
    get_Labels() {
        result := ComCall(6, this, "ptr*", &value := 0, "HRESULT")
        return IEnumString(value)
    }

    Query(iid) {
        if (IOptionDescription.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_Heading := CallbackCreate(GetMethod(implObj, "get_Heading"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_Labels := CallbackCreate(GetMethod(implObj, "get_Labels"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_Heading)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_Labels)
    }
}
