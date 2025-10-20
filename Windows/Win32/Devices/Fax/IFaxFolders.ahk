#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IFaxOutgoingQueue>} pFaxOutgoingQueue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_outgoingqueue
     */
    get_OutgoingQueue(pFaxOutgoingQueue) {
        result := ComCall(7, this, "ptr*", pFaxOutgoingQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxIncomingQueue>} pFaxIncomingQueue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_incomingqueue
     */
    get_IncomingQueue(pFaxIncomingQueue) {
        result := ComCall(8, this, "ptr*", pFaxIncomingQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxIncomingArchive>} pFaxIncomingArchive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_incomingarchive
     */
    get_IncomingArchive(pFaxIncomingArchive) {
        result := ComCall(9, this, "ptr*", pFaxIncomingArchive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxOutgoingArchive>} pFaxOutgoingArchive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxfolders-get_outgoingarchive
     */
    get_OutgoingArchive(pFaxOutgoingArchive) {
        result := ComCall(10, this, "ptr*", pFaxOutgoingArchive, "HRESULT")
        return result
    }
}
