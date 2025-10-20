#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IADs.ahk

/**
 * Used to control a printer from across a network.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsprintqueueoperations
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPrintQueueOperations extends IADs{
    /**
     * The interface identifier for IADsPrintQueueOperations
     * @type {Guid}
     */
    static IID => Guid("{124be5c0-156e-11cf-a986-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_Status(retval) {
        result := ComCall(20, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IADsCollection>} pObject 
     * @returns {HRESULT} 
     */
    PrintJobs(pObject) {
        result := ComCall(21, this, "ptr", pObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Purge() {
        result := ComCall(24, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
