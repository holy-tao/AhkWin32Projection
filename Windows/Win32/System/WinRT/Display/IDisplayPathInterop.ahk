#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Display
 */
export default struct IDisplayPathInterop extends IUnknown {
    /**
     * The interface identifier for IDisplayPathInterop
     * @type {Guid}
     */
    static IID := Guid("{a6ba4205-e59e-4e71-b25b-4e436d21ee3d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDisplayPathInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateSourcePresentationHandle : IntPtr
        GetSourceId                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDisplayPathInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an NT handle for controlling access to scanout on this path.
     * @remarks
     * Multiple processes can have handles of the same object, enabling use of the object for interprocess synchronization or sharing. These object-sharing mechanisms are available.
     * 
     * * A process can specify the object handle in a call to the [DuplicateHandle](../handleapi/nf-handleapi-duplicatehandle.md) function to create a duplicate handle that can be used by another process.
     * * A process can specify the name of the object in a call to the [IDisplayDeviceInterop.OpenSharedHandle](nf-windows-devices-display-core-interop-idisplaydeviceinterop-opensharedhandle.md) function.
     * 
     * Use the [CloseHandle](../handleapi/nf-handleapi-closehandle.md) function to close the handle. The system closes the handle automatically when the process terminates. The object is destroyed when its last handle has been closed and its last interface reference has been released.
     * @returns {HANDLE} Type: **[HANDLE](/windows/win32/winprog/windows-data-types)\***
     * 
     * A pointer to a **HANDLE** that receives the newly created source presentation object.
     * @see https://learn.microsoft.com/windows/win32/api/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaypathinterop-createsourcepresentationhandle
     */
    CreateSourcePresentationHandle() {
        pValue := HANDLE.Owned()
        result := ComCall(3, this, HANDLE.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * TBDI
     * @returns {Integer} The unique identifier.
     * @see https://learn.microsoft.com/windows/win32/api/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaypathinterop-getsourceid
     */
    GetSourceId() {
        result := ComCall(4, this, "uint*", &pSourceId := 0, "HRESULT")
        return pSourceId
    }

    Query(iid) {
        if (IDisplayPathInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSourcePresentationHandle := CallbackCreate(GetMethod(implObj, "CreateSourcePresentationHandle"), flags, 2)
        this.vtbl.GetSourceId := CallbackCreate(GetMethod(implObj, "GetSourceId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSourcePresentationHandle)
        CallbackFree(this.vtbl.GetSourceId)
    }
}
