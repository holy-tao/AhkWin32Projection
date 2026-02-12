#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IFaxDocument.ahk

/**
 * Defines a messaging object used by a fax client application to compose a fax document and submit it to the fax service for processing.
 * @remarks
 * A default implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdocument">IFaxDocument</a> and <b>IFaxDocument2</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument">FaxDocument</a> object.
 * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nn-faxcomex-ifaxdocument2
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
     * @type {BSTR} 
     */
    SubmissionId {
        get => this.get_SubmissionId()
    }

    /**
     * @type {VARIANT} 
     */
    Bodies {
        get => this.get_Bodies()
        set => this.put_Bodies(value)
    }

    /**
     * Retrieves the submission identifier for the fax document.
     * @remarks
     * This property is set whenever a method that submits a fax completes.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxdocument2-get_submissionid
     */
    get_SubmissionId() {
        pbstrSubmissionId := BSTR()
        result := ComCall(41, this, "ptr", pbstrSubmissionId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrSubmissionId
    }

    /**
     * Provides a collection of one or more documents to the fax document. (Get)
     * @remarks
     * Examples of documents that you can send as fax bodies include text files (.txt), Microsoft Word documents (.doc), or Microsoft Excel spreadsheets (.xls). Filenames are separated with semi-colons ";". For example, "myfile.txt;anotherfile.doc".
     * 
     * Either the <b>IFaxDocument2::Bodies</b> property or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-body-vb">Body</a> property must be <b>NULL</b>. You must use <b>IFaxDocument2::Bodies</b> if you will be submitting using either <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-connectedsubmit2-vb">IFaxDocument2::ConnectedSubmit2</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-submit2-vb">IFaxDocument2::Submit2</a> (both available only in Windows Vista or later). You must use <b>Body</b> if you will be submitting using either <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-connectedsubmit">ConnectedSubmit</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-submit-vb">Submit</a>.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxdocument2-get_bodies
     */
    get_Bodies() {
        pvBodies := VARIANT()
        result := ComCall(42, this, "ptr", pvBodies, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvBodies
    }

    /**
     * Provides a collection of one or more documents to the fax document. (Put)
     * @remarks
     * Examples of documents that you can send as fax bodies include text files (.txt), Microsoft Word documents (.doc), or Microsoft Excel spreadsheets (.xls). Filenames are separated with semi-colons ";". For example, "myfile.txt;anotherfile.doc".
     * 
     * Either the <b>IFaxDocument2::Bodies</b> property or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-body-vb">Body</a> property must be <b>NULL</b>. You must use <b>IFaxDocument2::Bodies</b> if you will be submitting using either <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-connectedsubmit2-vb">IFaxDocument2::ConnectedSubmit2</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-submit2-vb">IFaxDocument2::Submit2</a> (both available only in Windows Vista or later). You must use <b>Body</b> if you will be submitting using either <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-connectedsubmit">ConnectedSubmit</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-submit-vb">Submit</a>.
     * @param {VARIANT} vBodies 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxdocument2-put_bodies
     */
    put_Bodies(vBodies) {
        result := ComCall(43, this, "ptr", vBodies, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Submits one or more documents to the fax service for processing.Note  This method is supported only in Windows Vista and later.
     * @remarks
     * You must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-bodies-vb">IFaxDocument2::Bodies</a> property with a semi-colon delimited list of the files to be faxed before calling <b>IFaxDocument2::Submit2</b>. 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-body-vb">Body</a> property must be <b>NULL</b> to use <b>IFaxDocument2::Submit2</b>.</div>
     * <div> </div>
     * You must provide the server name when submitting the document. To submit the document to the local server, set the <i>bstrFaxServerName</i> parameter to <b>NULL</b> or an empty string. The method returns a collection of fax job IDs, one for each recipient of the fax.
     * 
     * To succeed, the <b>IFaxDocument2::Submit2</b> method requires that the fax has at least one recipient, and either a cover page or a fax body. You can only use this method if the server (remote or local) is installed as a network printer on the local computer.
     * 
     * This method is not supported for a remote connection to a fax server running Windows XP Home Edition or Windows XP Professional, and will return the error <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-error-codes">FAX_E_NOT_SUPPORTED_ON_THIS_SKU</a>.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_LOW</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_NORMAL</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_HIGH</a> access set correctly, depending on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-priority-vb">Priority</a> of the fax document.
     * 
     * As an example of <i>plErrorBodyFile</i>, consider the following example: The following list of files is submitted as the value of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-bodies-vb">IFaxDocument2::Bodies</a>:
     * 
     * "MyTextFile.txt;AnotherTextFile.txt;MyPDFfile.pdf;MyWordFile.doc".
     * 
     * Because the "*.pdf" extension is not supported, the send operation will fail and <i>plErrorBodyFile</i> will return as 2.
     * @param {BSTR} bstrFaxServerName Type: <b>BSTR</b>
     * 
     * <b>BSTR</b> that specifies a fax server. If this parameter is <b>NULL</b> or an empty string, the local fax server is specified.
     * @param {Pointer<VARIANT>} pvFaxOutgoingJobIDs Type: <b>VARIANT*</b>
     * 
     * <b>VARIANT</b> that specifies a collection of outbound job IDs, one for each recipient of the fax.
     * @param {Pointer<Integer>} plErrorBodyFile Type: <b>LONG*</b>
     * 
     * A <b>LONG</b> representing the zero-based position of the submitted file that caused the fax send operation to fail. See Remarks.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxdocument2-submit2
     */
    Submit2(bstrFaxServerName, pvFaxOutgoingJobIDs, plErrorBodyFile) {
        if(bstrFaxServerName is String) {
            pin := BSTR.Alloc(bstrFaxServerName)
            bstrFaxServerName := pin.Value
        }

        plErrorBodyFileMarshal := plErrorBodyFile is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, "ptr", bstrFaxServerName, "ptr", pvFaxOutgoingJobIDs, plErrorBodyFileMarshal, plErrorBodyFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Submits one or more fax documents to the connected FaxServer.
     * @remarks
     * <div class="alert"><b>Note</b>  To succeed, the <b>IFaxDocument2::ConnectedSubmit2</b> method requires that the fax have at least one recipient, and either a cover page or a fax body. You can only use this method if the server (remote or local) is installed as a network printer on the local computer.</div>
     * <div> </div>
     * You must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-bodies-vb">IFaxDocument2::Bodies</a> property with a semi-colon delimited list of the files to be faxed before calling <b>IFaxDocument2::ConnectedSubmit2</b>. 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-body-vb">Body</a> property must be <b>NULL</b> to use <b>IFaxDocument2::ConnectedSubmit2</b>.</div>
     * <div> </div>
     * This method is not supported for a remote connection to a fax server running Windows XP Home Edition or Windows XP Professional, and will return the error: <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-error-codes">FAX_E_NOT_SUPPORTED_ON_THIS_SKU</a>.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_LOW</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_NORMAL</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_HIGH</a> access set correctly, depending on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-priority-vb">Priority</a> of the fax document.
     * 
     * To illustrate <i>plErrorBodyFile</i>, here is an example: The following list of files is submitted as the value of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-bodies-vb">IFaxDocument2::Bodies</a>:
     * 
     * "MyTextFile.txt;AnotherTextFile.txt;MyPDFfile.pdf;MyWordFile.doc".
     * 
     * Because the "*.pdf" extension is not supported, the send operation will fail and <i>plErrorBodyFile</i> will return as 2.
     * @param {IFaxServer} pFaxServer Type: <b>IFaxServer*</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver">FaxServer</a> object that specifies a connected fax server.
     * @param {Pointer<VARIANT>} pvFaxOutgoingJobIDs Type: <b>VARIANT*</b>
     * 
     * A <b>VARIANT</b> that holds an array of outbound job ID strings, one for each recipient of the fax.
     * @param {Pointer<Integer>} plErrorBodyFile Type: <b>LONG*</b>
     * 
     * A <b>LONG</b> representing the zero-based position of the submitted file that caused the fax send operation to fail. See Remarks.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxdocument2-connectedsubmit2
     */
    ConnectedSubmit2(pFaxServer, pvFaxOutgoingJobIDs, plErrorBodyFile) {
        plErrorBodyFileMarshal := plErrorBodyFile is VarRef ? "int*" : "ptr"

        result := ComCall(45, this, "ptr", pFaxServer, "ptr", pvFaxOutgoingJobIDs, plErrorBodyFileMarshal, plErrorBodyFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
