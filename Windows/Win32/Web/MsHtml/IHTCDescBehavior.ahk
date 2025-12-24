#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTCDescBehavior extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTCDescBehavior
     * @type {Guid}
     */
    static IID => Guid("{3050f5dc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTCDescBehavior
     * @type {Guid}
     */
    static CLSID => Guid("{3050f5dd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_urn", "get_name"]

    /**
     * @type {BSTR} 
     */
    urn {
        get => this.get_urn()
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_urn() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }
}
