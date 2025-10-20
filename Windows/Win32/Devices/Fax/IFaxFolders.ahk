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
     * 
     * @param {Pointer<IFaxOutgoingQueue>} pFaxOutgoingQueue 
     * @returns {HRESULT} 
     */
    get_OutgoingQueue(pFaxOutgoingQueue) {
        result := ComCall(7, this, "ptr", pFaxOutgoingQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxIncomingQueue>} pFaxIncomingQueue 
     * @returns {HRESULT} 
     */
    get_IncomingQueue(pFaxIncomingQueue) {
        result := ComCall(8, this, "ptr", pFaxIncomingQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxIncomingArchive>} pFaxIncomingArchive 
     * @returns {HRESULT} 
     */
    get_IncomingArchive(pFaxIncomingArchive) {
        result := ComCall(9, this, "ptr", pFaxIncomingArchive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxOutgoingArchive>} pFaxOutgoingArchive 
     * @returns {HRESULT} 
     */
    get_OutgoingArchive(pFaxOutgoingArchive) {
        result := ComCall(10, this, "ptr", pFaxOutgoingArchive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
