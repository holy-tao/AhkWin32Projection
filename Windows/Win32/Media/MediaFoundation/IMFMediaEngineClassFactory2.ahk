#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IMFMediaKeys.ahk" { IMFMediaKeys }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates an instance of the IMFMediaKeys object.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaengineclassfactory2
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineClassFactory2 extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineClassFactory2
     * @type {Guid}
     */
    static IID := Guid("{09083cef-867f-4bf6-8776-dee3a7b42fca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineClassFactory2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateMediaKeys2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineClassFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a media keys object based on the specified key system. (IMFMediaEngineClassFactory2.CreateMediaKeys2)
     * @param {BSTR} keySystem The media key system.
     * @param {BSTR} defaultCdmStorePath Points to the default file location for the  store Content Decryption Module (CDM) data.
     * @param {BSTR} inprivateCdmStorePath Points to a the inprivate location for the  store Content Decryption Module (CDM) data. Specifying this path allows the CDM to comply with the application’s privacy policy by putting personal information in the file location indicated by this path.
     * @returns {IMFMediaKeys} Receives the media keys.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory2-createmediakeys2
     */
    CreateMediaKeys2(keySystem, defaultCdmStorePath, inprivateCdmStorePath) {
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem
        defaultCdmStorePath := defaultCdmStorePath is String ? BSTR.Alloc(defaultCdmStorePath).Value : defaultCdmStorePath
        inprivateCdmStorePath := inprivateCdmStorePath is String ? BSTR.Alloc(inprivateCdmStorePath).Value : inprivateCdmStorePath

        result := ComCall(3, this, BSTR, keySystem, BSTR, defaultCdmStorePath, BSTR, inprivateCdmStorePath, "ptr*", &ppKeys := 0, "HRESULT")
        return IMFMediaKeys(ppKeys)
    }

    Query(iid) {
        if (IMFMediaEngineClassFactory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateMediaKeys2 := CallbackCreate(GetMethod(implObj, "CreateMediaKeys2"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateMediaKeys2)
    }
}
