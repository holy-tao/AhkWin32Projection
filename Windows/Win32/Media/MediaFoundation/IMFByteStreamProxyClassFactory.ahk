#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFByteStream.ahk" { IMFByteStream }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates a proxy to a byte stream. (IMFByteStreamProxyClassFactory)
 * @remarks
 * This interface provides a factory object for creating a proxy to an existing Microsoft Media Foundation byte stream. The CLSID of the factory object is <b>CLSID_MFByteStreamProxyClassFactory</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfbytestreamproxyclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFByteStreamProxyClassFactory extends IUnknown {
    /**
     * The interface identifier for IMFByteStreamProxyClassFactory
     * @type {Guid}
     */
    static IID := Guid("{a6b43f84-5c0a-42e8-a44d-b1857a76992f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFByteStreamProxyClassFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateByteStreamProxy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFByteStreamProxyClassFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a proxy to a byte stream. (IMFByteStreamProxyClassFactory.CreateByteStreamProxy)
     * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the byte stream to proxy.
     * @param {IMFAttributes} pAttributes Reserved. Set to <b>NULL</b>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
     * @returns {Pointer<Void>} Receives a pointer to the interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestreamproxyclassfactory-createbytestreamproxy
     */
    CreateByteStreamProxy(pByteStream, pAttributes, riid) {
        result := ComCall(3, this, "ptr", pByteStream, "ptr", pAttributes, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    Query(iid) {
        if (IMFByteStreamProxyClassFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateByteStreamProxy := CallbackCreate(GetMethod(implObj, "CreateByteStreamProxy"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateByteStreamProxy)
    }
}
