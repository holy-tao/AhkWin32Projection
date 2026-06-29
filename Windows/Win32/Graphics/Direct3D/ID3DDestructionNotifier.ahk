#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * **ID3DDestructionNotifier** is an interface that you can use to register for callbacks when a Direct3D nano-COM object is destroyed.
 * @remarks
 * The <b>ID3DDestructionNotifier</b> can be used to track resources which are being unexpectedly released early, or providing a log of object disposal.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nn-d3dcommon-id3ddestructionotifier
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct ID3DDestructionNotifier extends IUnknown {
    /**
     * The interface identifier for ID3DDestructionNotifier
     * @type {Guid}
     */
    static IID := Guid("{a06eb39a-50da-425b-8c31-4eecd6c270f3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DDestructionNotifier interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterDestructionCallback   : IntPtr
        UnregisterDestructionCallback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DDestructionNotifier.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a user-defined callback to be invoked on destruction of the object from which this [ID3DDestructionNotifier](/windows/win32/api/d3dcommon/nn-d3dcommon-id3ddestructionotifier) was created.
     * @remarks
     * An example of this interface being used to log the destruction of an **ID3D12Resource**.
     * 
     * ```cppcx
     * @param {Pointer<PFN_DESTRUCTION_CALLBACK>} callbackFn Type: <b>PFN_DESTRUCTION_CALLBACK</b>
     * 
     * A user-defined callback to be invoked when the object is destroyed.
     * @param {Pointer<Void>} pData Type: **void\***
     * 
     * The data to pass to *callbackFn* when invoked
     * @returns {Integer} Type: **[UINT](/windows/win32/winprog/windows-data-types)\***
     * 
     * Pointer to a **UINT** used to identify the callback, and to pass to <a href="https://docs.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-unregisterdestructioncallback"></a> to unregister the callback.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-registerdestructioncallback
     */
    RegisterDestructionCallback(callbackFn, pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", callbackFn, pDataMarshal, pData, "uint*", &pCallbackID := 0, "HRESULT")
        return pCallbackID
    }

    /**
     * Unregisters a callback that was registered with [RegisterDestructionCallback](/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-registerdestructioncallback).
     * @param {Integer} callbackID Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * The **UINT** that was created by the *pCallbackID* argument to <b><a href="https://docs.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-registerdestructioncallback">ID3DDestructionNotifier::RegisterDestructionCallback</a></b>.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If this function succeeds, it returns **S_OK**.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-unregisterdestructioncallback
     */
    UnregisterDestructionCallback(callbackID) {
        result := ComCall(4, this, "uint", callbackID, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3DDestructionNotifier.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterDestructionCallback := CallbackCreate(GetMethod(implObj, "RegisterDestructionCallback"), flags, 4)
        this.vtbl.UnregisterDestructionCallback := CallbackCreate(GetMethod(implObj, "UnregisterDestructionCallback"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterDestructionCallback)
        CallbackFree(this.vtbl.UnregisterDestructionCallback)
    }
}
