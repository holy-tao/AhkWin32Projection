#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import ".\IXpsOMPackageWriter.ahk" { IXpsOMPackageWriter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMPrintTicketResource.ahk" { IXpsOMPrintTicketResource }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the method to create an IXpsOMPackageWriter that can be used by a print job that was created by the StartXpsPrintJob1 function.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface writes the application data in the order in which they will appear to the user.
 * 
 * To create an instance of an <b>IXpsOMPackageTarget</b> interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-startxpsprintjob1">StartXpsPrintJob1</a> function.
 * 
 * To create the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface to use to write the document to a printer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ff970305(v=vs.85)">CreateXpsOMPackageWriter</a> method of this interface.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagetarget
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMPackageTarget extends IUnknown {
    /**
     * The interface identifier for IXpsOMPackageTarget
     * @type {Guid}
     */
    static IID := Guid("{219a9db0-4959-47d0-8034-b1ce84f41a4d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMPackageTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateXpsOMPackageWriter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMPackageTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Create an IXpsOMPackageWriter interface for use with a print job that the StartXpsPrintJob1 function created.
     * @param {IOpcPartUri} documentSequencePartName The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the document sequence in the new file.
     * @param {IXpsOMPrintTicketResource} documentSequencePrintTicket The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface that contains the package-level print ticket to be assigned to the new file. Set this parameter to <b>NULL</b> if you do not have a package-level print ticket.
     * @param {IOpcPartUri} discardControlPartName The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the name of the discard control part. Set this parameter to <b>NULL</b> if you do not have a discard control part.
     * @returns {IXpsOMPackageWriter} A pointer to the new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface that this method created.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackagetarget-createxpsompackagewriter
     */
    CreateXpsOMPackageWriter(documentSequencePartName, documentSequencePrintTicket, discardControlPartName) {
        result := ComCall(3, this, "ptr", documentSequencePartName, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter(packageWriter)
    }

    Query(iid) {
        if (IXpsOMPackageTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateXpsOMPackageWriter := CallbackCreate(GetMethod(implObj, "CreateXpsOMPackageWriter"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateXpsOMPackageWriter)
    }
}
