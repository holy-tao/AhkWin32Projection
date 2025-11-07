#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLStorage.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMStorageEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMStorageEvent
     * @type {Guid}
     */
    static IID => Guid("{30510722-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMStorageEvent
     * @type {Guid}
     */
    static CLSID => Guid("{30510723-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_key", "get_oldValue", "get_newValue", "get_url", "get_storageArea", "initStorageEvent"]

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
     * @returns {BSTR} 
     */
    get_oldValue() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_newValue() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_url() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLStorage} 
     */
    get_storageArea() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStorage(p)
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {BSTR} keyArg 
     * @param {BSTR} oldValueArg 
     * @param {BSTR} newValueArg 
     * @param {BSTR} urlArg 
     * @param {IHTMLStorage} storageAreaArg 
     * @returns {HRESULT} 
     */
    initStorageEvent(eventType, canBubble, cancelable, keyArg, oldValueArg, newValueArg, urlArg, storageAreaArg) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        keyArg := keyArg is String ? BSTR.Alloc(keyArg).Value : keyArg
        oldValueArg := oldValueArg is String ? BSTR.Alloc(oldValueArg).Value : oldValueArg
        newValueArg := newValueArg is String ? BSTR.Alloc(newValueArg).Value : newValueArg
        urlArg := urlArg is String ? BSTR.Alloc(urlArg).Value : urlArg

        result := ComCall(12, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", keyArg, "ptr", oldValueArg, "ptr", newValueArg, "ptr", urlArg, "ptr", storageAreaArg, "HRESULT")
        return result
    }
}
