#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IEnumString.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Represents the description of a spell checker option.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nn-spellcheck-ioptiondescription
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IOptionDescription extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOptionDescription
     * @type {Guid}
     */
    static IID => Guid("{432e5f85-35cf-4606-a801-6f70277e1d7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Heading", "get_Description", "get_Labels"]

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
     * 
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
     * 
     * 
     * @returns {PWSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nf-spellcheck-ioptiondescription-get_id
     */
    get_Id() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the heading for the spell checker option.
     * @remarks
     * 
     * The heading can be used to group sets of options by placing the header on the first item of that group. This should be in the language of the spell checker or localized to the user's UI language.
     * 
     * 
     * @returns {PWSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nf-spellcheck-ioptiondescription-get_heading
     */
    get_Heading() {
        result := ComCall(4, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Get the description of the spell checker option.
     * @remarks
     * 
     * The description explains the implications of making the various choices associated with the option. This should be in the language of the spell checker or localized to the user's UI language.
     * 
     * 
     * @returns {PWSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nf-spellcheck-ioptiondescription-get_description
     */
    get_Description() {
        result := ComCall(5, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the label enumerator for the spell checker option.
     * @remarks
     * 
     * When there is a single label, the valid values for this option are 0 (not chosen) and 1 (chosen). When there is more than one label, the first label is associated with the value 0, the second with 1, and so on, effectively forming an enumeration. The labels should be in the language of the spell checker or localized to the user's UI language.
     * 
     * 
     * @returns {IEnumString} 
     * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nf-spellcheck-ioptiondescription-get_labels
     */
    get_Labels() {
        result := ComCall(6, this, "ptr*", &value := 0, "HRESULT")
        return IEnumString(value)
    }
}
