#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMTextEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMTextEvent
     * @type {Guid}
     */
    static IID => Guid("{305106d4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMTextEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305106d5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_data", "get_inputMethod", "initTextEvent", "get_locale"]

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_data(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_inputMethod(p) {
        result := ComCall(8, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} viewArg 
     * @param {BSTR} dataArg 
     * @param {Integer} inputMethod 
     * @param {BSTR} locale 
     * @returns {HRESULT} 
     */
    initTextEvent(eventType, canBubble, cancelable, viewArg, dataArg, inputMethod, locale) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        dataArg := dataArg is String ? BSTR.Alloc(dataArg).Value : dataArg
        locale := locale is String ? BSTR.Alloc(locale).Value : locale

        result := ComCall(9, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", viewArg, "ptr", dataArg, "uint", inputMethod, "ptr", locale, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_locale(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }
}
