#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IADsCollection.ahk
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
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(20, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * The IADsPrintQueueOperations::PrintJobs method gets an IADsCollection interface pointer on the collection of the print jobs processed in this print queue.
     * @returns {IADsCollection} Pointer to a pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscollection">IADsCollection</a> interface on the collection of objects added to this print queue. Objects in the collection implement the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsprintjob">IADsPrintJob</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsprintqueueoperations-printjobs
     */
    PrintJobs() {
        result := ComCall(21, this, "ptr*", &pObject := 0, "HRESULT")
        return IADsCollection(pObject)
    }

    /**
     * The IADsPrintQueueOperations::Pause method suspends the processing of print jobs within a print queue service.
     * @returns {HRESULT} This method supports the standard return values. For more information about other return values, see the  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsprintqueueoperations-pause
     */
    Pause() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * The IADsPrintQueueOperations::Resume method resumes processing of suspended print jobs in the print queue.
     * @returns {HRESULT} This method supports the standard return values. For more information about other return values, see the  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsprintqueueoperations-resume
     */
    Resume() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * The IADsPrintQueueOperations::Purge method clears the print queue of all print jobs without processing them.
     * @returns {HRESULT} This method supports the standard return values. For more information about other return values, see the  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsprintqueueoperations-purge
     */
    Purge() {
        result := ComCall(24, this, "HRESULT")
        return result
    }
}
