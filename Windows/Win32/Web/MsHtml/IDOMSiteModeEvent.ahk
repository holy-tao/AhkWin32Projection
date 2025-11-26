#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMSiteModeEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMSiteModeEvent
     * @type {Guid}
     */
    static IID => Guid("{30510765-98b6-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMSiteModeEvent
     * @type {Guid}
     */
    static CLSID => Guid("{30510766-98b6-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_buttonID", "get_actionURL"]

    /**
     * @type {Integer} 
     */
    buttonID {
        get => this.get_buttonID()
    }

    /**
     * @type {BSTR} 
     */
    actionURL {
        get => this.get_actionURL()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_buttonID() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_actionURL() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }
}
