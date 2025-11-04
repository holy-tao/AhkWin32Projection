#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class AsyncIUnknown extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIUnknown
     * @type {Guid}
     */
    static IID => Guid("{000e0000-0000-0000-c000-000000000046}")

    /**
     * The class identifier for AsyncIUnknown
     * @type {Guid}
     */
    static CLSID => Guid("{000e0000-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_QueryInterface", "Finish_QueryInterface", "Begin_AddRef", "Finish_AddRef", "Begin_Release", "Finish_Release"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     */
    Begin_QueryInterface(riid) {
        result := ComCall(3, this, "ptr", riid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    Finish_QueryInterface(ppvObject) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_AddRef() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    Finish_AddRef() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_Release() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    Finish_Release() {
        result := ComCall(8, this, "uint")
        return result
    }
}
