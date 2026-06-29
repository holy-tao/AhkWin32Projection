#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMDRMTranscryptor.ahk" { IWMDRMTranscryptor }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMDRMTranscryptionManager extends IUnknown {
    /**
     * The interface identifier for IWMDRMTranscryptionManager
     * @type {Guid}
     */
    static IID := Guid("{b1a887b2-a4f0-407a-b02e-efbd23bbecdf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDRMTranscryptionManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateTranscryptor : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDRMTranscryptionManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a DRM transcryptor object.
     * @returns {IWMDRMTranscryptor} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmdrmtranscryptor">IWMDRMTranscryptor</a> interface of the newly created DRM transcryptor object.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmtranscryptionmanager-createtranscryptor
     */
    CreateTranscryptor() {
        result := ComCall(3, this, "ptr*", &ppTranscryptor := 0, "HRESULT")
        return IWMDRMTranscryptor(ppTranscryptor)
    }

    Query(iid) {
        if (IWMDRMTranscryptionManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTranscryptor := CallbackCreate(GetMethod(implObj, "CreateTranscryptor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTranscryptor)
    }
}
