#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADs.ahk

/**
 * The IADsPrintJob interface is a dual interface that inherits from IADs.
 * @remarks
 * 
  * To manage a print job across a network, use the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsprintjoboperations">IADsPrintJobOperations</a> interface, which supports the functionality to examine the status of a print job and to pause or resume the operation of printing the document, and so on.
  * 
  * To access any print jobs in a print queue, call the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsprintqueueoperations-printjobs">IADsPrintQueueOperations::PrintJobs</a> method to obtain the collection object holding all the print jobs in the print queue.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsprintjob
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPrintJob extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsPrintJob
     * @type {Guid}
     */
    static IID => Guid("{32fb6780-1ed0-11cf-a988-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HostPrintQueue", "get_User", "get_UserPath", "get_TimeSubmitted", "get_TotalPages", "get_Size", "get_Description", "put_Description", "get_Priority", "put_Priority", "get_StartTime", "put_StartTime", "get_UntilTime", "put_UntilTime", "get_Notify", "put_Notify", "get_NotifyPath", "put_NotifyPath"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_HostPrintQueue() {
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_User() {
        retval := BSTR()
        result := ComCall(21, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserPath() {
        retval := BSTR()
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TimeSubmitted() {
        result := ComCall(23, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalPages() {
        result := ComCall(24, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        result := ComCall(25, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(26, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(27, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(28, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnPriority 
     * @returns {HRESULT} 
     */
    put_Priority(lnPriority) {
        result := ComCall(29, this, "int", lnPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StartTime() {
        result := ComCall(30, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Float} daStartTime 
     * @returns {HRESULT} 
     */
    put_StartTime(daStartTime) {
        result := ComCall(31, this, "double", daStartTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_UntilTime() {
        result := ComCall(32, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Float} daUntilTime 
     * @returns {HRESULT} 
     */
    put_UntilTime(daUntilTime) {
        result := ComCall(33, this, "double", daUntilTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Notify() {
        retval := BSTR()
        result := ComCall(34, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrNotify 
     * @returns {HRESULT} 
     */
    put_Notify(bstrNotify) {
        bstrNotify := bstrNotify is String ? BSTR.Alloc(bstrNotify).Value : bstrNotify

        result := ComCall(35, this, "ptr", bstrNotify, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NotifyPath() {
        retval := BSTR()
        result := ComCall(36, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrNotifyPath 
     * @returns {HRESULT} 
     */
    put_NotifyPath(bstrNotifyPath) {
        bstrNotifyPath := bstrNotifyPath is String ? BSTR.Alloc(bstrNotifyPath).Value : bstrNotifyPath

        result := ComCall(37, this, "ptr", bstrNotifyPath, "HRESULT")
        return result
    }
}
