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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "PrintJobs", "Pause", "Resume", "Purge"]

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Status(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IADsCollection>} pObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintqueueoperations-printjobs
     */
    PrintJobs(pObject) {
        result := ComCall(21, this, "ptr*", pObject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintqueueoperations-pause
     */
    Pause() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintqueueoperations-resume
     */
    Resume() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintqueueoperations-purge
     */
    Purge() {
        result := ComCall(24, this, "HRESULT")
        return result
    }
}
