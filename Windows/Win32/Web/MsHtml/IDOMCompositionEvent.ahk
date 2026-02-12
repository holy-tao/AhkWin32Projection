#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMCompositionEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMCompositionEvent
     * @type {Guid}
     */
    static IID => Guid("{305106d8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMCompositionEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305106d9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_data", "initCompositionEvent", "get_locale"]

    /**
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
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
    get_data() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} viewArg 
     * @param {BSTR} data 
     * @param {BSTR} locale 
     * @returns {HRESULT} 
     */
    initCompositionEvent(eventType, canBubble, cancelable, viewArg, data, locale) {
        if(eventType is String) {
            pin := BSTR.Alloc(eventType)
            eventType := pin.Value
        }
        if(data is String) {
            pin := BSTR.Alloc(data)
            data := pin.Value
        }
        if(locale is String) {
            pin := BSTR.Alloc(locale)
            locale := pin.Value
        }

        result := ComCall(8, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", viewArg, "ptr", data, "ptr", locale, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_locale() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }
}
