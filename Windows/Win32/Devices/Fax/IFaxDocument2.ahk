#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxDocument.ahk

/**
 * Defines a messaging object used by a fax client application to compose a fax document and submit it to the fax service for processing.
 * @remarks
 * 
  * A default implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdocument">IFaxDocument</a> and <b>IFaxDocument2</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument">FaxDocument</a> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxdocument2
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxDocument2 extends IFaxDocument{
    /**
     * The interface identifier for IFaxDocument2
     * @type {Guid}
     */
    static IID => Guid("{e1347661-f9ef-4d6d-b4a5-c0a068b65cff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 41

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubmissionId 
     * @returns {HRESULT} 
     */
    get_SubmissionId(pbstrSubmissionId) {
        result := ComCall(41, this, "ptr", pbstrSubmissionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvBodies 
     * @returns {HRESULT} 
     */
    get_Bodies(pvBodies) {
        result := ComCall(42, this, "ptr", pvBodies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vBodies 
     * @returns {HRESULT} 
     */
    put_Bodies(vBodies) {
        result := ComCall(43, this, "ptr", vBodies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFaxServerName 
     * @param {Pointer<VARIANT>} pvFaxOutgoingJobIDs 
     * @param {Pointer<Int32>} plErrorBodyFile 
     * @returns {HRESULT} 
     */
    Submit2(bstrFaxServerName, pvFaxOutgoingJobIDs, plErrorBodyFile) {
        bstrFaxServerName := bstrFaxServerName is String ? BSTR.Alloc(bstrFaxServerName).Value : bstrFaxServerName

        result := ComCall(44, this, "ptr", bstrFaxServerName, "ptr", pvFaxOutgoingJobIDs, "int*", plErrorBodyFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxServer>} pFaxServer 
     * @param {Pointer<VARIANT>} pvFaxOutgoingJobIDs 
     * @param {Pointer<Int32>} plErrorBodyFile 
     * @returns {HRESULT} 
     */
    ConnectedSubmit2(pFaxServer, pvFaxOutgoingJobIDs, plErrorBodyFile) {
        result := ComCall(45, this, "ptr", pFaxServer, "ptr", pvFaxOutgoingJobIDs, "int*", plErrorBodyFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
