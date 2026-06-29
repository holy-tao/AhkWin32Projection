#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXpsOMResource.ahk" { IXpsOMResource }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides an IStream interface to a PrintTicket resource.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMPrintTicketResource extends IXpsOMResource {
    /**
     * The interface identifier for IXpsOMPrintTicketResource
     * @type {Guid}
     */
    static IID := Guid("{e7ff32d2-34aa-499b-bbe9-9cd4ee6c59f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMPrintTicketResource interfaces
    */
    struct Vtbl extends IXpsOMResource.Vtbl {
        GetStream  : IntPtr
        SetContent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMPrintTicketResource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a new, read-only copy of the stream that is associated with this resource. (IXpsOMPrintTicketResource.GetStream)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object returned by this method might return an error of E_PENDING, which indicates that the stream length has not been determined yet.  This behavior is different from that of a standard <b>IStream</b> object.
     * 
     * This method calls the stream's <b>Clone</b> method to create the stream returned in <i>stream</i>. As a result, the performance of this method will depend on that of the stream's <b>Clone</b> method.
     * @returns {IStream} A new, read-only copy of the stream that is associated with this resource.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomprintticketresource-getstream
     */
    GetStream() {
        result := ComCall(5, this, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }

    /**
     * Sets the read-only stream to be associated with this resource. (IXpsOMPrintTicketResource.SetContent)
     * @remarks
     * The calling method  should treat this stream as a single-threaded apartment (STA) model object and not re-enter any of the stream interface's methods.
     * 
     * Because <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomprintticketresource-getstream">GetStream</a> gets a clone of  the stream that is set by this method, the provided stream should have an efficient cloning method. A stream with an inefficient cloning method will reduce the performance of <b>GetStream</b>.
     * @param {IStream} sourceStream The read-only stream to be associated with this resource.
     * @param {IOpcPartUri} partName The part name to be assigned to this resource.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomprintticketresource-setcontent
     */
    SetContent(sourceStream, partName) {
        result := ComCall(6, this, "ptr", sourceStream, "ptr", partName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsOMPrintTicketResource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 2)
        this.vtbl.SetContent := CallbackCreate(GetMethod(implObj, "SetContent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStream)
        CallbackFree(this.vtbl.SetContent)
    }
}
