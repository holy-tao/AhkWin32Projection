#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Contains methods for interacting with the file catalog.
 * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nn-indexsrv-isimplecommandcreator
 * @namespace Windows.Win32.System.Search
 */
export default struct ISimpleCommandCreator extends IUnknown {
    /**
     * The interface identifier for ISimpleCommandCreator
     * @type {Guid}
     */
    static IID := Guid("{5e341ab7-02d0-11d1-900c-00a0c9063796}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISimpleCommandCreator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateICommand    : IntPtr
        VerifyCatalog     : IntPtr
        GetDefaultCatalog : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISimpleCommandCreator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an ICommand.
     * @param {IUnknown} pOuterUnk Optional outer unknown pointer.
     * @returns {IUnknown} Returns the IUnknown for the command.
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-isimplecommandcreator-createicommand
     */
    CreateICommand(pOuterUnk) {
        result := ComCall(3, this, "ptr*", &ppIUnknown := 0, "ptr", pOuterUnk, "HRESULT")
        return IUnknown(ppIUnknown)
    }

    /**
     * Validates the catalog location.
     * @param {PWSTR} pwszMachine Machine on which the catalog exists.
     * @param {PWSTR} pwszCatalogName The catalog name.
     * @returns {HRESULT} If the catalog is accessible, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-isimplecommandcreator-verifycatalog
     */
    VerifyCatalog(pwszMachine, pwszCatalogName) {
        pwszMachine := pwszMachine is String ? StrPtr(pwszMachine) : pwszMachine
        pwszCatalogName := pwszCatalogName is String ? StrPtr(pwszCatalogName) : pwszCatalogName

        result := ComCall(4, this, "ptr", pwszMachine, "ptr", pwszCatalogName, "HRESULT")
        return result
    }

    /**
     * Determines the default catalog for the system.
     * @param {PWSTR} pwszCatalogName The catalog name.
     * @param {Integer} cwcIn The size in characters of <i>pwszCatalogName</i>.
     * @param {Pointer<Integer>} pcwcOut Size of the catalog name.
     * @returns {HRESULT} If this method succeeds, it returns the contents of the IsapiDefaultCatalogDirectory registry value. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-isimplecommandcreator-getdefaultcatalog
     */
    GetDefaultCatalog(pwszCatalogName, cwcIn, pcwcOut) {
        pwszCatalogName := pwszCatalogName is String ? StrPtr(pwszCatalogName) : pwszCatalogName

        pcwcOutMarshal := pcwcOut is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pwszCatalogName, "uint", cwcIn, pcwcOutMarshal, pcwcOut, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISimpleCommandCreator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateICommand := CallbackCreate(GetMethod(implObj, "CreateICommand"), flags, 3)
        this.vtbl.VerifyCatalog := CallbackCreate(GetMethod(implObj, "VerifyCatalog"), flags, 3)
        this.vtbl.GetDefaultCatalog := CallbackCreate(GetMethod(implObj, "GetDefaultCatalog"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateICommand)
        CallbackFree(this.vtbl.VerifyCatalog)
        CallbackFree(this.vtbl.GetDefaultCatalog)
    }
}
