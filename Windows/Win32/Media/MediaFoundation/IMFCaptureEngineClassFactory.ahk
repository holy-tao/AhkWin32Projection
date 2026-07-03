#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates an instance of the capture engine. (IMFCaptureEngineClassFactory)
 * @remarks
 * To get a pointer to this interface, call the <a href="https://docs.microsoft.com/windows/desktop/medfound/using-an-encoder-s-imftransform--interface">CoCreateInstance</a> function and specify the CLSID equal to <b>CLSID_MFCaptureEngineClassFactory</b>. 
 * 
 * Calling the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfcreatecaptureengine">MFCreateCaptureEngine</a> function is equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengineclassfactory-createinstance">IMFCaptureEngineClassFactory::CreateInstance</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nn-mfcaptureengine-imfcaptureengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCaptureEngineClassFactory extends IUnknown {
    /**
     * The interface identifier for IMFCaptureEngineClassFactory
     * @type {Guid}
     */
    static IID := Guid("{8f02d140-56fc-4302-a705-3a97c78be779}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCaptureEngineClassFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCaptureEngineClassFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instance of the capture engine. (IMFCaptureEngineClassFactory.CreateInstance)
     * @remarks
     * Before calling this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> function.
     * @param {Pointer<Guid>} clsid The CLSID of the object to create.
     * 
     * Currently, this parameter must equal <b>CLSID_MFCaptureEngine</b>.
     * @param {Pointer<Guid>} riid The IID of the requested interface. The capture engine supports the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcaptureengine">IMFCaptureEngine</a> interface.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengineclassfactory-createinstance
     */
    CreateInstance(clsid, riid) {
        result := ComCall(3, this, Guid.Ptr, clsid, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    Query(iid) {
        if (IMFCaptureEngineClassFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstance)
    }
}
