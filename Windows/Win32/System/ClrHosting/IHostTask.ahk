#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostTask extends IUnknown{
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
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Alert() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    Join(dwMilliseconds, option) {
        result := ComCall(5, this, "uint", dwMilliseconds, "uint", option, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newPriority 
     * @returns {HRESULT} 
     */
    SetPriority(newPriority) {
        result := ComCall(6, this, "int", newPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPriority 
     * @returns {HRESULT} 
     */
    GetPriority(pPriority) {
        result := ComCall(7, this, "int*", pPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICLRTask>} pCLRTask 
     * @returns {HRESULT} 
     */
    SetCLRTask(pCLRTask) {
        result := ComCall(8, this, "ptr", pCLRTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
