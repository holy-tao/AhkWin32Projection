#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostFunctionLocalStorage.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionLocalStorageEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostFunctionLocalStorageEnumerator
     * @type {Guid}
     */
    static IID => Guid("{026c9e81-8b9f-4d32-9606-a394ec62b045}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "GetNext"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugHostFunctionLocalStorage} 
     */
    GetNext() {
        result := ComCall(4, this, "ptr*", &storage := 0, "HRESULT")
        return IDebugHostFunctionLocalStorage(storage)
    }
}
