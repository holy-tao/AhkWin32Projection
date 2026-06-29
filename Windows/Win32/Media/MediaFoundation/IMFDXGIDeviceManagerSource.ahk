#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFDXGIDeviceManager.ahk" { IMFDXGIDeviceManager }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides functionality for getting the IMFDXGIDeviceManager from the Microsoft Media Foundation video rendering sink.
 * @see https://learn.microsoft.com/windows/win32/medfound/imfdxgidevicemanagersource
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFDXGIDeviceManagerSource extends IUnknown {
    /**
     * The interface identifier for IMFDXGIDeviceManagerSource
     * @type {Guid}
     */
    static IID := Guid("{20bc074b-7a8d-4609-8c3b-64a0a3b5d7ce}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFDXGIDeviceManagerSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetManager : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFDXGIDeviceManagerSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the IMFDXGIDeviceManager from the Microsoft Media Foundation video rendering sink.
     * @returns {IMFDXGIDeviceManager} The [**IMFDXGIDeviceManager**](/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager) object.
     * @see https://learn.microsoft.com/windows/win32/medfound/imfdxgidevicemanagersource-getmanager
     */
    GetManager() {
        result := ComCall(3, this, "ptr*", &ppManager := 0, "HRESULT")
        return IMFDXGIDeviceManager(ppManager)
    }

    Query(iid) {
        if (IMFDXGIDeviceManagerSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetManager := CallbackCreate(GetMethod(implObj, "GetManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetManager)
    }
}
