#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFaxDocument.ahk" { IFaxDocument }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxServer.ahk" { IFaxServer }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Defines a messaging object used by a fax client application to compose a fax document and submit it to the fax service for processing.
 * @remarks
 * A default implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdocument">IFaxDocument</a> and <b>IFaxDocument2</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument">FaxDocument</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxdocument2
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxDocument2 extends IFaxDocument {
    /**
     * The interface identifier for IFaxDocument2
     * @type {Guid}
     */
    static IID := Guid("{e1347661-f9ef-4d6d-b4a5-c0a068b65cff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxDocument2 interfaces
    */
    struct Vtbl extends IFaxDocument.Vtbl {
        get_SubmissionId : IntPtr
        get_Bodies       : IntPtr
        put_Bodies       : IntPtr
        Submit2          : IntPtr
        ConnectedSubmit2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxDocument2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument2-get_submissionid
     */
    get_SubmissionId() {
        pbstrSubmissionId := BSTR.Owned()
        result := ComCall(41, this, BSTR.Ptr, pbstrSubmissionId, "HRESULT")
        return pbstrSubmissionId
    }

    /**
     * Provides a collection of one or more documents to the fax document. (Get)
     * @remarks
     * Examples of documents that you can send as fax bodies include text files (.txt), Microsoft Word documents (.doc), or Microsoft Excel spreadsheets (.xls). Filenames are separated with semi-colons ";". For example, "myfile.txt;anotherfile.doc".
     * 
     * Either the <b>IFaxDocument2::Bodies</b> property or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-body-vb">Body</a> property must be <b>NULL</b>. You must use <b>IFaxDocument2::Bodies</b> if you will be submitting using either <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-connectedsubmit2-vb">IFaxDocument2::ConnectedSubmit2</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-submit2-vb">IFaxDocument2::Submit2</a> (both available only in Windows Vista or later). You must use <b>Body</b> if you will be submitting using either <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-connectedsubmit">ConnectedSubmit</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-submit-vb">Submit</a>.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument2-get_bodies
     */
    get_Bodies() {
        pvBodies := VARIANT()
        result := ComCall(42, this, VARIANT.Ptr, pvBodies, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument2-put_bodies
     */
    put_Bodies(vBodies) {
        result := ComCall(43, this, VARIANT, vBodies, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument2-submit2
     */
    Submit2(bstrFaxServerName, pvFaxOutgoingJobIDs, plErrorBodyFile) {
        bstrFaxServerName := bstrFaxServerName is String ? BSTR.Alloc(bstrFaxServerName).Value : bstrFaxServerName

        plErrorBodyFileMarshal := plErrorBodyFile is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, BSTR, bstrFaxServerName, VARIANT.Ptr, pvFaxOutgoingJobIDs, plErrorBodyFileMarshal, plErrorBodyFile, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument2-connectedsubmit2
     */
    ConnectedSubmit2(pFaxServer, pvFaxOutgoingJobIDs, plErrorBodyFile) {
        plErrorBodyFileMarshal := plErrorBodyFile is VarRef ? "int*" : "ptr"

        result := ComCall(45, this, "ptr", pFaxServer, VARIANT.Ptr, pvFaxOutgoingJobIDs, plErrorBodyFileMarshal, plErrorBodyFile, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxDocument2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SubmissionId := CallbackCreate(GetMethod(implObj, "get_SubmissionId"), flags, 2)
        this.vtbl.get_Bodies := CallbackCreate(GetMethod(implObj, "get_Bodies"), flags, 2)
        this.vtbl.put_Bodies := CallbackCreate(GetMethod(implObj, "put_Bodies"), flags, 2)
        this.vtbl.Submit2 := CallbackCreate(GetMethod(implObj, "Submit2"), flags, 4)
        this.vtbl.ConnectedSubmit2 := CallbackCreate(GetMethod(implObj, "ConnectedSubmit2"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SubmissionId)
        CallbackFree(this.vtbl.get_Bodies)
        CallbackFree(this.vtbl.put_Bodies)
        CallbackFree(this.vtbl.Submit2)
        CallbackFree(this.vtbl.ConnectedSubmit2)
    }
}
