#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMKeyboardEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMKeyboardEvent
     * @type {Guid}
     */
    static IID => Guid("{305106d6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMKeyboardEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305106d7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_key", "get_location", "get_ctrlKey", "get_shiftKey", "get_altKey", "get_metaKey", "get_repeat", "getModifierState", "initKeyboardEvent", "get_keyCode", "get_charCode", "get_which", "get_ie9_char", "get_locale"]

    /**
     * @type {BSTR} 
     */
    key {
        get => this.get_key()
    }

    /**
     * @type {Integer} 
     */
    location {
        get => this.get_location()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ctrlKey {
        get => this.get_ctrlKey()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    shiftKey {
        get => this.get_shiftKey()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    altKey {
        get => this.get_altKey()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    metaKey {
        get => this.get_metaKey()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    repeat {
        get => this.get_repeat()
    }

    /**
     * @type {Integer} 
     */
    keyCode {
        get => this.get_keyCode()
    }

    /**
     * @type {Integer} 
     */
    charCode {
        get => this.get_charCode()
    }

    /**
     * @type {Integer} 
     */
    which {
        get => this.get_which()
    }

    /**
     * @type {VARIANT} 
     */
    ie9_char {
        get => this.get_ie9_char()
    }

    /**
     * @type {BSTR} 
     */
    locale {
        get => this.get_locale()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_key() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_location() {
        result := ComCall(8, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ctrlKey() {
        result := ComCall(9, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shiftKey() {
        result := ComCall(10, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_altKey() {
        result := ComCall(11, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_metaKey() {
        result := ComCall(12, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_repeat() {
        result := ComCall(13, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} keyArg 
     * @returns {VARIANT_BOOL} 
     */
    getModifierState(keyArg) {
        keyArg := keyArg is String ? BSTR.Alloc(keyArg).Value : keyArg

        result := ComCall(14, this, "ptr", keyArg, "short*", &state := 0, "HRESULT")
        return state
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} viewArg 
     * @param {BSTR} keyArg 
     * @param {Integer} locationArg 
     * @param {BSTR} modifiersListArg 
     * @param {VARIANT_BOOL} repeat 
     * @param {BSTR} locale 
     * @returns {HRESULT} 
     */
    initKeyboardEvent(eventType, canBubble, cancelable, viewArg, keyArg, locationArg, modifiersListArg, repeat, locale) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        keyArg := keyArg is String ? BSTR.Alloc(keyArg).Value : keyArg
        modifiersListArg := modifiersListArg is String ? BSTR.Alloc(modifiersListArg).Value : modifiersListArg
        locale := locale is String ? BSTR.Alloc(locale).Value : locale

        result := ComCall(15, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", viewArg, "ptr", keyArg, "uint", locationArg, "ptr", modifiersListArg, "short", repeat, "ptr", locale, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_keyCode() {
        result := ComCall(16, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_charCode() {
        result := ComCall(17, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_which() {
        result := ComCall(18, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ie9_char() {
        p := VARIANT()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_locale() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }
}
