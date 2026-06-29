#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMPrintTicketResource.ahk" { IXpsOMPrintTicketResource }
#Import ".\IXpsOMDocumentCollection.ahk" { IXpsOMDocumentCollection }
#Import ".\IXpsOMPart.ahk" { IXpsOMPart }
#Import ".\IXpsOMPackage.ahk" { IXpsOMPackage }

/**
 * The root object that has the XPS document content.
 * @remarks
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMDocumentSequence    *newInterface;
 * IOpcPartUri               *partUri;
 * 
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *     __uuidof(XpsOMObjectFactory),
 *     NULL,
 *     CLSCTX_INPROC_SERVER,
 *     _uuidof(IXpsOMObjectFactory),
 *     reinterpret_cast<LPVOID*>(&xpsFactory)
 *     );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     hr = xpsFactory->CreatePartUri(partUriString, &partUri);
 *     
 *     if (SUCCEEDED(hr))
 *     {
 *         hr = xpsFactory->CreateDocumentSequence (partUri, &newInterface);
 * 
 *         if (SUCCEEDED(hr))
 *         {
 *             // use newInterface
 * 
 *             newInterface->Release();
 *         }
 *         partUri->Release();
 *     }
 *     xpsFactory->Release();
 * }
 * else
 * {
 *     // evaluate HRESULT error returned in hr
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentsequence
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMDocumentSequence extends IXpsOMPart {
    /**
     * The interface identifier for IXpsOMDocumentSequence
     * @type {Guid}
     */
    static IID := Guid("{56492eb4-d8d5-425e-8256-4c2b64ad0264}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMDocumentSequence interfaces
    */
    struct Vtbl extends IXpsOMPart.Vtbl {
        GetOwner               : IntPtr
        GetDocuments           : IntPtr
        GetPrintTicketResource : IntPtr
        SetPrintTicketResource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMDocumentSequence.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a pointer to the IXpsOMPackage interface that contains the document sequence.
     * @returns {IXpsOMPackage} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage">IXpsOMPackage</a> interface that contains the document sequence.  If the document sequence does not belong to a package, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentsequence-getowner
     */
    GetOwner() {
        result := ComCall(5, this, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage(package)
    }

    /**
     * Gets a pointer to the IXpsOMDocumentCollection interface, which contains the documents specified in the document sequence.
     * @remarks
     * If the document sequence does not have any documents, the document collection that is returned in <i>documents</i> will be empty. To get  the number of documents in the collection, call the collection's <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentcollection-getcount">GetCount</a> method.
     * @returns {IXpsOMDocumentCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentcollection">IXpsOMDocumentCollection</a> interface, which contains the documents specified in the document sequence. If the sequence does not have any documents, the <b>IXpsOMDocumentCollection</b> interface will be empty.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentsequence-getdocuments
     */
    GetDocuments() {
        result := ComCall(6, this, "ptr*", &documents := 0, "HRESULT")
        return IXpsOMDocumentCollection(documents)
    }

    /**
     * Gets the IXpsOMPrintTicketResource interface to the job-level print ticket that is assigned to the document sequence.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMPrintTicketResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface of the job-level print ticket that is  assigned to the document sequence. If no <b>IXpsOMPrintTicketResource</b> interface has been assigned to the document sequence, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentsequence-getprintticketresource
     */
    GetPrintTicketResource() {
        result := ComCall(7, this, "ptr*", &printTicketResource := 0, "HRESULT")
        return IXpsOMPrintTicketResource(printTicketResource)
    }

    /**
     * Sets the job-level print ticket resource for the document sequence.
     * @remarks
     * If the document contains an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface when this method is called, that interface is released before the new <b>IXpsOMPrintTicketResource</b> interface, which is passed in <i>printTicketResource</i>, is set.
     * @param {IXpsOMPrintTicketResource} printTicketResource A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface of the job-level print ticket that will be set for the document sequence.
     *           If the document sequence has a print ticket resource, a <b>NULL</b> pointer will release it.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentsequence-setprintticketresource
     */
    SetPrintTicketResource(printTicketResource) {
        result := ComCall(8, this, "ptr", printTicketResource, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsOMDocumentSequence.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOwner := CallbackCreate(GetMethod(implObj, "GetOwner"), flags, 2)
        this.vtbl.GetDocuments := CallbackCreate(GetMethod(implObj, "GetDocuments"), flags, 2)
        this.vtbl.GetPrintTicketResource := CallbackCreate(GetMethod(implObj, "GetPrintTicketResource"), flags, 2)
        this.vtbl.SetPrintTicketResource := CallbackCreate(GetMethod(implObj, "SetPrintTicketResource"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOwner)
        CallbackFree(this.vtbl.GetDocuments)
        CallbackFree(this.vtbl.GetPrintTicketResource)
        CallbackFree(this.vtbl.SetPrintTicketResource)
    }
}
