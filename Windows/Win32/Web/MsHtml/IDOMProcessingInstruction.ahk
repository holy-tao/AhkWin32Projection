#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMProcessingInstruction extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMProcessingInstruction
     * @type {Guid}
     */
    static IID => Guid("{30510742-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMProcessingInstruction
     * @type {Guid}
     */
    static CLSID => Guid("{30510743-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_target", "put_data", "get_data"]

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_target(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_data(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_data(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }
}
