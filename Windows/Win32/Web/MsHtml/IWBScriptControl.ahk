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
     * @type {VARIANT_BOOL} 
     */
    selectableContent {
        get => this.get_selectableContent()
        set => this.put_selectableContent(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    frozen {
        get => this.get_frozen()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    scrollbar {
        get => this.get_scrollbar()
        set => this.put_scrollbar(value)
    }

    /**
     * @type {BSTR} 
     */
    version {
        get => this.get_version()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    visibility {
        get => this.get_visibility()
    }

    /**
     * @type {VARIANT} 
     */
    onvisibilitychange {
        get => this.get_onvisibilitychange()
        set => this.put_onvisibilitychange(value)
    }

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
     * @returns {VARIANT_BOOL} 
     */
    get_selectableContent() {
        result := ComCall(11, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_frozen() {
        result := ComCall(12, this, "short*", &p := 0, "HRESULT")
        return p
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
     * @returns {VARIANT_BOOL} 
     */
    get_scrollbar() {
        result := ComCall(14, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_version() {
        p := BSTR()
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_visibility() {
        result := ComCall(16, this, "short*", &p := 0, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onvisibilitychange() {
        p := VARIANT()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }
}
