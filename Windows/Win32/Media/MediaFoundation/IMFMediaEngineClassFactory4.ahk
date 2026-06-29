#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the CreateContentDecryptionModuleFactory method for creating an instance of IMFContentDecryptionModuleFactory, a class factory for Content Decryption Module (CDM) objects for a specified key system.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaengineclassfactory4
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineClassFactory4 extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineClassFactory4
     * @type {Guid}
     */
    static IID := Guid("{fbe256c1-43cf-4a9b-8cb8-ce8632a34186}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineClassFactory4 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateContentDecryptionModuleFactory : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineClassFactory4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instance of IMFContentDecryptionModuleFactory, a class factory for Content Decryption Module (CDM) objects for a specified key system.
     * @param {PWSTR} keySystem An LPWSTR identifying the Key System for which the interface is created.
     * @param {Pointer<Guid>} riid The IID of the **IMFContentDecryptionModuleFactory** interface to create.
     * @returns {Pointer<Void>} Receives a pointer to the created interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory4-createcontentdecryptionmodulefactory
     */
    CreateContentDecryptionModuleFactory(keySystem, riid) {
        keySystem := keySystem is String ? StrPtr(keySystem) : keySystem

        result := ComCall(3, this, "ptr", keySystem, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    Query(iid) {
        if (IMFMediaEngineClassFactory4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateContentDecryptionModuleFactory := CallbackCreate(GetMethod(implObj, "CreateContentDecryptionModuleFactory"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateContentDecryptionModuleFactory)
    }
}
