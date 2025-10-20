#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostTask extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostTask
     * @type {Guid}
     */
    static IID => Guid("{c2275828-c4b1-4b55-82c9-92135f74df1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Alert", "Join", "SetPriority", "GetPriority", "SetCLRTask"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Alert() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    Join(dwMilliseconds, option) {
        result := ComCall(5, this, "uint", dwMilliseconds, "uint", option, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} newPriority 
     * @returns {HRESULT} 
     */
    SetPriority(newPriority) {
        result := ComCall(6, this, "int", newPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPriority 
     * @returns {HRESULT} 
     */
    GetPriority(pPriority) {
        result := ComCall(7, this, "int*", pPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICLRTask} pCLRTask 
     * @returns {HRESULT} 
     */
    SetCLRTask(pCLRTask) {
        result := ComCall(8, this, "ptr", pCLRTask, "HRESULT")
        return result
    }
}
