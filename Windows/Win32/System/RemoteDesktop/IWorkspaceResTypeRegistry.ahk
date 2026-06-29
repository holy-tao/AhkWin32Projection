#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes methods that allow a plug-in to manage third-party file name extensions in RemoteApp and Desktop Connection runtime.
 * @see https://learn.microsoft.com/windows/win32/api/workspaceax/nn-workspaceax-iworkspacerestyperegistry
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWorkspaceResTypeRegistry extends IDispatch {
    /**
     * The interface identifier for IWorkspaceResTypeRegistry
     * @type {Guid}
     */
    static IID := Guid("{1d428c79-6e2e-4351-a361-c0401a03a0ba}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWorkspaceResTypeRegistry interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        AddResourceType             : IntPtr
        DeleteResourceType          : IntPtr
        GetRegisteredFileExtensions : IntPtr
        GetResourceTypeInfo         : IntPtr
        ModifyResourceType          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWorkspaceResTypeRegistry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a third-party file name extension with the RemoteApp and Desktop Connections runtime.
     * @remarks
     * This method is called when the plug-in is installed to register non-RDP resources.
     * @param {VARIANT_BOOL} fMachineWide Specifies whether the resource is to be registered per user or per machine.
     * @param {BSTR} bstrFileExtension A string that contains the file name extension to register. The period must be included in the extension, for example, ".txt".
     * @param {BSTR} bstrLauncher A string that contains the fully qualified path and file name of the application to use to launch files with the extension specified by the <i>bstrFileExtension</i> parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceax/nf-workspaceax-iworkspacerestyperegistry-addresourcetype
     */
    AddResourceType(fMachineWide, bstrFileExtension, bstrLauncher) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension
        bstrLauncher := bstrLauncher is String ? BSTR.Alloc(bstrLauncher).Value : bstrLauncher

        result := ComCall(7, this, VARIANT_BOOL, fMachineWide, BSTR, bstrFileExtension, BSTR, bstrLauncher, "HRESULT")
        return result
    }

    /**
     * Unregisters a third-party file name extension with the RemoteApp and Desktop Connections runtime.
     * @remarks
     * This method is called when the plug-in is uninstalled to unregister non-RDP resources.
     * @param {VARIANT_BOOL} fMachineWide Specifies whether the resource is registered per user or per machine.
     * @param {BSTR} bstrFileExtension A string that contains the file name extension to unregister. The period must be included in the extension, 
     *    for example, ".txt".
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceax/nf-workspaceax-iworkspacerestyperegistry-deleteresourcetype
     */
    DeleteResourceType(fMachineWide, bstrFileExtension) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension

        result := ComCall(8, this, VARIANT_BOOL, fMachineWide, BSTR, bstrFileExtension, "HRESULT")
        return result
    }

    /**
     * Retrieves the third-party file name extensions that are registered with the RemoteApp and Desktop Connections runtime.
     * @param {VARIANT_BOOL} fMachineWide Specifies whether the resource is registered per user or per machine.
     * @returns {Pointer<SAFEARRAY>} The address of a pointer to a <b>SAFEARRAY</b> variable that receives an array of <b>BSTR</b>s that contain the registered file name extensions.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceax/nf-workspaceax-iworkspacerestyperegistry-getregisteredfileextensions
     */
    GetRegisteredFileExtensions(fMachineWide) {
        result := ComCall(9, this, VARIANT_BOOL, fMachineWide, "ptr*", &psaFileExtensions := 0, "HRESULT")
        return psaFileExtensions
    }

    /**
     * Retrieves information about a third-party file name extension that is registered with the RemoteApp and Desktop Connections runtime.
     * @param {VARIANT_BOOL} fMachineWide Specifies whether the resource is registered per user or per machine.
     * @param {BSTR} bstrFileExtension A string that contains the file name extension to retrieve the information for. The period must be included in the extension, for example, ".txt".
     * @returns {BSTR} A pointer to a <b>BSTR</b> variable that receives the fully qualified path and file name of the application to use to launch files with the extension specified by the <i>bstrFileExtension</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceax/nf-workspaceax-iworkspacerestyperegistry-getresourcetypeinfo
     */
    GetResourceTypeInfo(fMachineWide, bstrFileExtension) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension

        pbstrLauncher := BSTR.Owned()
        result := ComCall(10, this, VARIANT_BOOL, fMachineWide, BSTR, bstrFileExtension, BSTR.Ptr, pbstrLauncher, "HRESULT")
        return pbstrLauncher
    }

    /**
     * Modifies a third-party file name extension that is registered with the RemoteApp and Desktop Connections runtime.
     * @param {VARIANT_BOOL} fMachineWide Specifies whether the resource is registered per user or per machine.
     * @param {BSTR} bstrFileExtension A string that contains the file name extension to update. The period must be included in the extension, for example, ".txt".
     * @param {BSTR} bstrLauncher A string that contains the new fully qualified path and file name of the application to use to launch files with the extension specified by the <i>bstrFileExtension</i> parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceax/nf-workspaceax-iworkspacerestyperegistry-modifyresourcetype
     */
    ModifyResourceType(fMachineWide, bstrFileExtension, bstrLauncher) {
        bstrFileExtension := bstrFileExtension is String ? BSTR.Alloc(bstrFileExtension).Value : bstrFileExtension
        bstrLauncher := bstrLauncher is String ? BSTR.Alloc(bstrLauncher).Value : bstrLauncher

        result := ComCall(11, this, VARIANT_BOOL, fMachineWide, BSTR, bstrFileExtension, BSTR, bstrLauncher, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWorkspaceResTypeRegistry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddResourceType := CallbackCreate(GetMethod(implObj, "AddResourceType"), flags, 4)
        this.vtbl.DeleteResourceType := CallbackCreate(GetMethod(implObj, "DeleteResourceType"), flags, 3)
        this.vtbl.GetRegisteredFileExtensions := CallbackCreate(GetMethod(implObj, "GetRegisteredFileExtensions"), flags, 3)
        this.vtbl.GetResourceTypeInfo := CallbackCreate(GetMethod(implObj, "GetResourceTypeInfo"), flags, 4)
        this.vtbl.ModifyResourceType := CallbackCreate(GetMethod(implObj, "ModifyResourceType"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddResourceType)
        CallbackFree(this.vtbl.DeleteResourceType)
        CallbackFree(this.vtbl.GetRegisteredFileExtensions)
        CallbackFree(this.vtbl.GetResourceTypeInfo)
        CallbackFree(this.vtbl.ModifyResourceType)
    }
}
