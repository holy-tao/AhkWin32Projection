#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IMFImageSharingEngine.ahk" { IMFImageSharingEngine }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates an instance of the IMFImageSharingEngine.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nn-mfsharingengine-imfimagesharingengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFImageSharingEngineClassFactory extends IUnknown {
    /**
     * The interface identifier for IMFImageSharingEngineClassFactory
     * @type {Guid}
     */
    static IID := Guid("{1fc55727-a7fb-4fc8-83ae-8af024990af1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFImageSharingEngineClassFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstanceFromUDN : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFImageSharingEngineClassFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instance of the IMFImageSharingEngine from the provided unique device name.
     * @param {BSTR} pUniqueDeviceName The unique device name of the device with which the sharing engine is created.
     * @returns {IMFImageSharingEngine} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/nn-mfsharingengine-imfimagesharingengine">IMFImageSharingEngine</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfimagesharingengineclassfactory-createinstancefromudn
     */
    CreateInstanceFromUDN(pUniqueDeviceName) {
        pUniqueDeviceName := pUniqueDeviceName is String ? BSTR.Alloc(pUniqueDeviceName).Value : pUniqueDeviceName

        result := ComCall(3, this, BSTR, pUniqueDeviceName, "ptr*", &ppEngine := 0, "HRESULT")
        return IMFImageSharingEngine(ppEngine)
    }

    Query(iid) {
        if (IMFImageSharingEngineClassFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstanceFromUDN := CallbackCreate(GetMethod(implObj, "CreateInstanceFromUDN"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstanceFromUDN)
    }
}
