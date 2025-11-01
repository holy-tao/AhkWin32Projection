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
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_HostPrintQueue(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_User(retval) {
        result := ComCall(21, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_UserPath(retval) {
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     */
    get_TimeSubmitted(retval) {
        retvalMarshal := retval is VarRef ? "double*" : "ptr"

        result := ComCall(23, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_TotalPages(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Size(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Description(retval) {
        result := ComCall(26, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Priority(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, retvalMarshal, retval, "HRESULT")
        return result
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
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     */
    get_StartTime(retval) {
        retvalMarshal := retval is VarRef ? "double*" : "ptr"

        result := ComCall(30, this, retvalMarshal, retval, "HRESULT")
        return result
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
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     */
    get_UntilTime(retval) {
        retvalMarshal := retval is VarRef ? "double*" : "ptr"

        result := ComCall(32, this, retvalMarshal, retval, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Notify(retval) {
        result := ComCall(34, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_NotifyPath(retval) {
        result := ComCall(36, this, "ptr", retval, "HRESULT")
        return result
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
