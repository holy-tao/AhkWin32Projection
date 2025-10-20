#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaAsyncOperation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchemaAsyncOperation
     * @type {Guid}
     */
    static IID => Guid("{143c8dcb-d37f-47f7-88e8-6b1d21f2c5f7}")

    /**
     * The class identifier for PrintSchemaAsyncOperation
     * @type {Guid}
     */
    static CLSID => Guid("{43b2f83d-10f2-48ab-831b-55fdbdbd34a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Cancel"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
