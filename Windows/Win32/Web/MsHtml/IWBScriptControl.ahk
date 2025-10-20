#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IWBScriptControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWBScriptControl
     * @type {Guid}
     */
    static IID => Guid("{a5170870-0cf8-11d1-8b91-0080c744f389}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["raiseEvent", "bubbleEvent", "setContextMenu", "put_selectableContent", "get_selectableContent", "get_frozen", "put_scrollbar", "get_scrollbar", "get_version", "get_visibility", "put_onvisibilitychange", "get_onvisibilitychange"]

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} eventData 
     * @returns {HRESULT} 
     */
    raiseEvent(name, eventData) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, "ptr", name, "ptr", eventData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    bubbleEvent() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} menuItemPairs 
     * @returns {HRESULT} 
     */
    setContextMenu(menuItemPairs) {
        result := ComCall(9, this, "ptr", menuItemPairs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_selectableContent(v) {
        result := ComCall(10, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_selectableContent(p) {
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_frozen(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_scrollbar(v) {
        result := ComCall(13, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_scrollbar(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_version(p) {
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_visibility(p) {
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onvisibilitychange(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onvisibilitychange(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
    }
}
