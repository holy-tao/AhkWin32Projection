#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows users to enumerate the supported package target types and to create one with a given type ID. IPrintDocumentPackageTarget also supports the tracking of the package printing progress and cancelling.
 * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nn-documenttarget-iprintdocumentpackagetarget
 * @namespace Windows.Win32.Storage.Xps.Printing
 */
export default struct IPrintDocumentPackageTarget extends IUnknown {
    /**
     * The interface identifier for IPrintDocumentPackageTarget
     * @type {Guid}
     */
    static IID := Guid("{1b8efec4-3019-4c27-964e-367202156906}")

    /**
     * The class identifier for PrintDocumentPackageTarget
     * @type {Guid}
     */
    static CLSID := Guid("{4842669e-9947-46ea-8ba2-d8cce432c2ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintDocumentPackageTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPackageTargetTypes : IntPtr
        GetPackageTarget      : IntPtr
        Cancel                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintDocumentPackageTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enumerates the supported target types.
     * @remarks
     * In the case of a multi-format driver, the first GUID returned in the <i>targetTypes</i> array is the XPS format preferred by the driver.
     * @param {Pointer<Integer>} targetCount The number of supported target types.
     * @param {Pointer<Pointer<Guid>>} targetTypes The array of supported target types. An array of GUIDs.
     * @returns {HRESULT} If the <b>GetPackageTargetTypes</b> method completes successfully, it returns an S_OK. Otherwise it returns the appropriate HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nf-documenttarget-iprintdocumentpackagetarget-getpackagetargettypes
     */
    GetPackageTargetTypes(targetCount, targetTypes) {
        targetCountMarshal := targetCount is VarRef ? "uint*" : "ptr"
        targetTypesMarshal := targetTypes is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, targetCountMarshal, targetCount, targetTypesMarshal, targetTypes, "HRESULT")
        return result
    }

    /**
     * Retrieves the pointer to the specific document package target, which allows the client to add a document with the given target type. Clients can call this method multiple times but they always have to use the same target ID.
     * @param {Pointer<Guid>} guidTargetType The target type GUID obtained from <a href="https://docs.microsoft.com/windows/desktop/api/documenttarget/nf-documenttarget-iprintdocumentpackagetarget-getpackagetargettypes">GetPackageTargetTypes</a>.
     * @param {Pointer<Guid>} riid The identifier of the interface being requested.
     * @returns {Pointer<Void>} The requested document target interface. The returned pointer is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsdocumentpackagetarget">IXpsDocumentPackageTarget</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nf-documenttarget-iprintdocumentpackagetarget-getpackagetarget
     */
    GetPackageTarget(guidTargetType, riid) {
        result := ComCall(4, this, Guid.Ptr, guidTargetType, Guid.Ptr, riid, "ptr*", &ppvTarget := 0, "HRESULT")
        return ppvTarget
    }

    /**
     * Cancels the current print job.
     * @returns {HRESULT} If the <b>Cancel</b> method completes successfully, it returns an S_OK. Otherwise it returns the appropriate HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nf-documenttarget-iprintdocumentpackagetarget-cancel
     */
    Cancel() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintDocumentPackageTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPackageTargetTypes := CallbackCreate(GetMethod(implObj, "GetPackageTargetTypes"), flags, 3)
        this.vtbl.GetPackageTarget := CallbackCreate(GetMethod(implObj, "GetPackageTarget"), flags, 4)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPackageTargetTypes)
        CallbackFree(this.vtbl.GetPackageTarget)
        CallbackFree(this.vtbl.Cancel)
    }
}
