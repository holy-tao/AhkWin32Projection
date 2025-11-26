#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCPresencePropertyEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCPresencePropertyEvent
     * @type {Guid}
     */
    static IID => Guid("{f777f570-a820-49d5-86bd-e099493f1518}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StatusCode", "get_StatusText", "get_PresenceProperty", "get_Value"]

    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * @type {BSTR} 
     */
    StatusText {
        get => this.get_StatusText()
    }

    /**
     * @type {Integer} 
     */
    PresenceProperty {
        get => this.get_PresenceProperty()
    }

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(7, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StatusText() {
        pbstrStatusText := BSTR()
        result := ComCall(8, this, "ptr", pbstrStatusText, "HRESULT")
        return pbstrStatusText
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PresenceProperty() {
        result := ComCall(9, this, "int*", &penPresProp := 0, "HRESULT")
        return penPresProp
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Value() {
        pbstrValue := BSTR()
        result := ComCall(10, this, "ptr", pbstrValue, "HRESULT")
        return pbstrValue
    }
}
