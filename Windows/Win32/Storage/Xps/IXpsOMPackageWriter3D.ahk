#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\IXpsOMPackageWriter.ahk" { IXpsOMPackageWriter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Contains methods that support model textures and print ticket.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_2/nn-xpsobjectmodel_2-ixpsompackagewriter3d
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMPackageWriter3D extends IXpsOMPackageWriter {
    /**
     * The interface identifier for IXpsOMPackageWriter3D
     * @type {Guid}
     */
    static IID := Guid("{e8a45033-640e-43fa-9bdf-fddeaa31c6a0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMPackageWriter3D interfaces
    */
    struct Vtbl extends IXpsOMPackageWriter.Vtbl {
        AddModelTexture     : IntPtr
        SetModelPrintTicket : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMPackageWriter3D.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new 3D model texture from the specified texture part and stream.
     * @remarks
     * Each time this method is called, it creates a new part with a specified name, content and hardcoded content type “application/vnd.ms-package.3dmanufacturing-3dmodeltexture”. That part is linked from the model part with relationship type “http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodeltexture”.
     * @param {IOpcPartUri} texturePartName The Open Package Convention (OPC)  name of the texture part. This part is added to the package and becomes a relationship target of the model part.
     * @param {IStream} textureData A readable stream which holds 3D model texture. When calling this method, you must provide PNG or JPEG data.
     * @returns {HRESULT} Returns the appropriate HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsompackagewriter3d-addmodeltexture
     */
    AddModelTexture(texturePartName, textureData) {
        result := ComCall(8, this, "ptr", texturePartName, "ptr", textureData, "HRESULT")
        return result
    }

    /**
     * Creates a print ticket with the specified part.
     * @remarks
     * Call this method at most once per package writer. Calling this method creates a part with content type “application/vnd.ms-printing.printticket+xml”. It is linked from model part with relationship type “http://schemas.microsoft.com/3dmanufacturing/2013/01/printticket” .
     * @param {IOpcPartUri} printTicketPartName The part is added to package and becomes a target of relationship from model part.
     * @param {IStream} printTicketData A readable stream that  holds the 3D model print ticket.
     * @returns {HRESULT} Returns the appropriate HRESULT error code. Calling this method more than once per package writer returns the error XPS_E_MULTIPLE_PRINTICKETS_ON_DOCUMENT.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_2/nf-xpsobjectmodel_2-ixpsompackagewriter3d-setmodelprintticket
     */
    SetModelPrintTicket(printTicketPartName, printTicketData) {
        result := ComCall(9, this, "ptr", printTicketPartName, "ptr", printTicketData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsOMPackageWriter3D.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddModelTexture := CallbackCreate(GetMethod(implObj, "AddModelTexture"), flags, 3)
        this.vtbl.SetModelPrintTicket := CallbackCreate(GetMethod(implObj, "SetModelPrintTicket"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddModelTexture)
        CallbackFree(this.vtbl.SetModelPrintTicket)
    }
}
