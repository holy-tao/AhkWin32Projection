#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods to create Explorer commands and command enumerators.
 * @remarks
 * None of the methods of this interface should communicate with network resources; they are called on the UI thread and doing so would cause the UI to stop responding.
 * 
 * Each command should have its own unique GUID; the command provider is expected to create a command instance on a per-GUID basis.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorercommandprovider
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IExplorerCommandProvider extends IUnknown {
    /**
     * The interface identifier for IExplorerCommandProvider
     * @type {Guid}
     */
    static IID := Guid("{64961751-0835-43c0-8ffe-d57686530e64}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExplorerCommandProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCommands : IntPtr
        GetCommand  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExplorerCommandProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a specified Explorer command enumerator instance.
     * @param {IUnknown} punkSite Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an interface used to set a site.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the requested interface.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in riid. This will typically be <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumexplorercommand">IEnumExplorerCommand</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommandprovider-getcommands
     */
    GetCommands(punkSite, riid) {
        result := ComCall(3, this, "ptr", punkSite, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets a specified Explorer command instance.
     * @param {Pointer<Guid>} rguidCommandId Type: <b>REFGUID</b>
     * 
     * A reference to a command ID as a <b>GUID</b>. Used to obtain a command definition.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the requested interface.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in riid. This will typically be <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorercommand">IExplorerCommand</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommandprovider-getcommand
     */
    GetCommand(rguidCommandId, riid) {
        result := ComCall(4, this, Guid.Ptr, rguidCommandId, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IExplorerCommandProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCommands := CallbackCreate(GetMethod(implObj, "GetCommands"), flags, 4)
        this.vtbl.GetCommand := CallbackCreate(GetMethod(implObj, "GetCommand"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCommands)
        CallbackFree(this.vtbl.GetCommand)
    }
}
