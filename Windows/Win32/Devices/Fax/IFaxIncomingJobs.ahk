#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxIncomingJobs interface is used by a fax client application to manage the inbound fax jobs in a fax server's job queue. Each incoming job is represented by a FaxIncomingJob object.
 * @remarks
 * 
  * To create a <b>FaxIncomingJobs</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingqueue-getjobs-vb">IFaxIncomingQueue::GetJobs</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxincomingjobs
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxIncomingJobs extends IDispatch{
    /**
     * The interface identifier for IFaxIncomingJobs
     * @type {Guid}
     */
    static IID => Guid("{011f04e9-4fd6-4c23-9513-b6b66bb26be9}")

    /**
     * The class identifier for FaxIncomingJobs
     * @type {Guid}
     */
    static CLSID => Guid("{a1bb8a43-8866-4fb7-a15d-6266c875a5cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppUnk) {
        result := ComCall(7, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vIndex 
     * @param {Pointer<IFaxIncomingJob>} pFaxIncomingJob 
     * @returns {HRESULT} 
     */
    get_Item(vIndex, pFaxIncomingJob) {
        result := ComCall(8, this, "ptr", vIndex, "ptr", pFaxIncomingJob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(9, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
