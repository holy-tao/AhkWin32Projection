#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICLRTask.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRTask2 extends ICLRTask{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRTask2
     * @type {Guid}
     */
    static IID => Guid("{28e66a4a-9906-4225-b231-9187c3eb8612}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginPreventAsyncAbort", "EndPreventAsyncAbort"]

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginPreventAsyncAbort() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndPreventAsyncAbort() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
