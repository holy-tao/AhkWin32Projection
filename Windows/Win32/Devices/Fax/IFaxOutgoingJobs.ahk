#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IFaxOutgoingJob.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutgoingJobs interface describes a messaging collection that is used by a fax client application to manage the outbound fax jobs in a fax server's job queue. Each outbound job is represented by a IFaxOutgoingJob interface.
 * @remarks
 * 
 * A default implementation of <b>IFaxOutgoingJobs</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjobs">FaxOutgoingJobs</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutgoingjobs
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutgoingJobs extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutgoingJobs
     * @type {Guid}
     */
    static IID => Guid("{2c56d8e6-8c2f-4573-944c-e505f8f5aeed}")

    /**
     * The class identifier for FaxOutgoingJobs
     * @type {Guid}
     */
    static CLSID => Guid("{92bf2a6c-37be-43fa-a37d-cb0e5f753b35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjobs-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @param {VARIANT} vIndex 
     * @returns {IFaxOutgoingJob} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjobs-get_item
     */
    get_Item(vIndex) {
        result := ComCall(8, this, "ptr", vIndex, "ptr*", &pFaxOutgoingJob := 0, "HRESULT")
        return IFaxOutgoingJob(pFaxOutgoingJob)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjobs-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }
}
