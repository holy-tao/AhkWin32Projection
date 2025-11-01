#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_key(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_location(p) {
        result := ComCall(8, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_ctrlKey(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_shiftKey(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_altKey(p) {
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_metaKey(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_repeat(p) {
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} keyArg 
     * @param {Pointer<VARIANT_BOOL>} state 
     * @returns {HRESULT} 
     */
    getModifierState(keyArg, state) {
        keyArg := keyArg is String ? BSTR.Alloc(keyArg).Value : keyArg

        result := ComCall(14, this, "ptr", keyArg, "ptr", state, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_keyCode(p) {
        result := ComCall(16, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_charCode(p) {
        result := ComCall(17, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_which(p) {
        result := ComCall(18, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ie9_char(p) {
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_locale(p) {
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return result
    }
}
