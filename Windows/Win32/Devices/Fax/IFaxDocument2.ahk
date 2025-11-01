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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SubmissionId", "get_Bodies", "put_Bodies", "Submit2", "ConnectedSubmit2"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubmissionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument2-get_submissionid
     */
    get_SubmissionId(pbstrSubmissionId) {
        result := ComCall(41, this, "ptr", pbstrSubmissionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvBodies 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument2-get_bodies
     */
    get_Bodies(pvBodies) {
        result := ComCall(42, this, "ptr", pvBodies, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vBodies 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument2-put_bodies
     */
    put_Bodies(vBodies) {
        result := ComCall(43, this, "ptr", vBodies, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFaxServerName 
     * @param {Pointer<VARIANT>} pvFaxOutgoingJobIDs 
     * @param {Pointer<Integer>} plErrorBodyFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument2-submit2
     */
    Submit2(bstrFaxServerName, pvFaxOutgoingJobIDs, plErrorBodyFile) {
        bstrFaxServerName := bstrFaxServerName is String ? BSTR.Alloc(bstrFaxServerName).Value : bstrFaxServerName

        plErrorBodyFileMarshal := plErrorBodyFile is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, "ptr", bstrFaxServerName, "ptr", pvFaxOutgoingJobIDs, plErrorBodyFileMarshal, plErrorBodyFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer} pFaxServer 
     * @param {Pointer<VARIANT>} pvFaxOutgoingJobIDs 
     * @param {Pointer<Integer>} plErrorBodyFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument2-connectedsubmit2
     */
    ConnectedSubmit2(pFaxServer, pvFaxOutgoingJobIDs, plErrorBodyFile) {
        plErrorBodyFileMarshal := plErrorBodyFile is VarRef ? "int*" : "ptr"

        result := ComCall(45, this, "ptr", pFaxServer, "ptr", pvFaxOutgoingJobIDs, plErrorBodyFileMarshal, plErrorBodyFile, "HRESULT")
        return result
    }
}
