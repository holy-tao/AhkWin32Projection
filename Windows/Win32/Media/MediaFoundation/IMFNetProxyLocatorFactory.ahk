#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFNetProxyLocator.ahk" { IMFNetProxyLocator }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates a proxy locator object, which determines the proxy to use.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfnetproxylocatorfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFNetProxyLocatorFactory extends IUnknown {
    /**
     * The interface identifier for IMFNetProxyLocatorFactory
     * @type {Guid}
     */
    static IID := Guid("{e9cd0384-a268-4bb4-82de-658d53574d41}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFNetProxyLocatorFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateProxyLocator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFNetProxyLocatorFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an IMFNetProxyLocator interface proxy locator object based on the protocol name.
     * @param {PWSTR} pszProtocol Null-terminated wide-character string containing the protocol name (for example, RTSP or HTTP).
     * @returns {IMFNetProxyLocator} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetproxylocator">IMFNetProxyLocator</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetproxylocatorfactory-createproxylocator
     */
    CreateProxyLocator(pszProtocol) {
        pszProtocol := pszProtocol is String ? StrPtr(pszProtocol) : pszProtocol

        result := ComCall(3, this, "ptr", pszProtocol, "ptr*", &ppProxyLocator := 0, "HRESULT")
        return IMFNetProxyLocator(ppProxyLocator)
    }

    Query(iid) {
        if (IMFNetProxyLocatorFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateProxyLocator := CallbackCreate(GetMethod(implObj, "CreateProxyLocator"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateProxyLocator)
    }
}
