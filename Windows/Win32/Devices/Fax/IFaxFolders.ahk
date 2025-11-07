#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFaxOutgoingQueue.ahk
#Include .\IFaxIncomingQueue.ahk
#Include .\IFaxIncomingArchive.ahk
#Include .\IFaxOutgoingArchive.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxFolders interface defines a configuration object used by a fax client application to access the folders, queued jobs, and archived messages on a fax server.
 * @remarks
 * 
  * A default implementation of <b>IFaxFolders</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxfolders">FaxFolders</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxfolders
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxFolders extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxFolders
     * @type {Guid}
     */
    static IID => Guid("{dce3b2a8-a7ab-42bc-9d0a-3149457261a0}")

    /**
     * The class identifier for FaxFolders
     * @type {Guid}
     */
    static CLSID => Guid("{c35211d7-5776-48cb-af44-c31be3b2cfe5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OutgoingQueue", "get_IncomingQueue", "get_IncomingArchive", "get_OutgoingArchive"]

    /**
     * 
     * @returns {IFaxOutgoingQueue} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_outgoingqueue
     */
    get_OutgoingQueue() {
        result := ComCall(7, this, "ptr*", &pFaxOutgoingQueue := 0, "HRESULT")
        return IFaxOutgoingQueue(pFaxOutgoingQueue)
    }

    /**
     * 
     * @returns {IFaxIncomingQueue} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_incomingqueue
     */
    get_IncomingQueue() {
        result := ComCall(8, this, "ptr*", &pFaxIncomingQueue := 0, "HRESULT")
        return IFaxIncomingQueue(pFaxIncomingQueue)
    }

    /**
     * 
     * @returns {IFaxIncomingArchive} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_incomingarchive
     */
    get_IncomingArchive() {
        result := ComCall(9, this, "ptr*", &pFaxIncomingArchive := 0, "HRESULT")
        return IFaxIncomingArchive(pFaxIncomingArchive)
    }

    /**
     * 
     * @returns {IFaxOutgoingArchive} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_outgoingarchive
     */
    get_OutgoingArchive() {
        result := ComCall(10, this, "ptr*", &pFaxOutgoingArchive := 0, "HRESULT")
        return IFaxOutgoingArchive(pFaxOutgoingArchive)
    }
}
