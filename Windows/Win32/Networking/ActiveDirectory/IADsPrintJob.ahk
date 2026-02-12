#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADs.ahk

/**
 * The IADsPrintJob interface is a dual interface that inherits from IADs.
 * @remarks
 * To manage a print job across a network, use the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsprintjoboperations">IADsPrintJobOperations</a> interface, which supports the functionality to examine the status of a print job and to pause or resume the operation of printing the document, and so on.
 * 
 * To access any print jobs in a print queue, call the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsprintqueueoperations-printjobs">IADsPrintQueueOperations::PrintJobs</a> method to obtain the collection object holding all the print jobs in the print queue.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadsprintjob
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
     * @type {BSTR} 
     */
    HostPrintQueue {
        get => this.get_HostPrintQueue()
    }

    /**
     * @type {BSTR} 
     */
    User {
        get => this.get_User()
    }

    /**
     * @type {BSTR} 
     */
    UserPath {
        get => this.get_UserPath()
    }

    /**
     * @type {Float} 
     */
    TimeSubmitted {
        get => this.get_TimeSubmitted()
    }

    /**
     * @type {Integer} 
     */
    TotalPages {
        get => this.get_TotalPages()
    }

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * @type {Float} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * @type {Float} 
     */
    UntilTime {
        get => this.get_UntilTime()
        set => this.put_UntilTime(value)
    }

    /**
     * @type {BSTR} 
     */
    Notify {
        get => this.get_Notify()
        set => this.put_Notify(value)
    }

    /**
     * @type {BSTR} 
     */
    NotifyPath {
        get => this.get_NotifyPath()
        set => this.put_NotifyPath(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_HostPrintQueue() {
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_User() {
        retval := BSTR()
        result := ComCall(21, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserPath() {
        retval := BSTR()
        result := ComCall(22, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TimeSubmitted() {
        result := ComCall(23, this, "double*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalPages() {
        result := ComCall(24, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        result := ComCall(25, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(26, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        if(bstrDescription is String) {
            pin := BSTR.Alloc(bstrDescription)
            bstrDescription := pin.Value
        }

        result := ComCall(27, this, "ptr", bstrDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(28, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Integer} lnPriority 
     * @returns {HRESULT} 
     */
    put_Priority(lnPriority) {
        result := ComCall(29, this, "int", lnPriority, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StartTime() {
        result := ComCall(30, this, "double*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Float} daStartTime 
     * @returns {HRESULT} 
     */
    put_StartTime(daStartTime) {
        result := ComCall(31, this, "double", daStartTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_UntilTime() {
        result := ComCall(32, this, "double*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Float} daUntilTime 
     * @returns {HRESULT} 
     */
    put_UntilTime(daUntilTime) {
        result := ComCall(33, this, "double", daUntilTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Notify() {
        retval := BSTR()
        result := ComCall(34, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrNotify 
     * @returns {HRESULT} 
     */
    put_Notify(bstrNotify) {
        if(bstrNotify is String) {
            pin := BSTR.Alloc(bstrNotify)
            bstrNotify := pin.Value
        }

        result := ComCall(35, this, "ptr", bstrNotify, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NotifyPath() {
        retval := BSTR()
        result := ComCall(36, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrNotifyPath 
     * @returns {HRESULT} 
     */
    put_NotifyPath(bstrNotifyPath) {
        if(bstrNotifyPath is String) {
            pin := BSTR.Alloc(bstrNotifyPath)
            bstrNotifyPath := pin.Value
        }

        result := ComCall(37, this, "ptr", bstrNotifyPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
