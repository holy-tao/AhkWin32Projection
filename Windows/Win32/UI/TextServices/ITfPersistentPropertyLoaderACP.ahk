#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TF_PERSISTENT_PROPERTY_HEADER_ACP.ahk" { TF_PERSISTENT_PROPERTY_HEADER_ACP }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfPersistentPropertyLoaderACP interface is implemented by an application and used by the TSF manager to load properties asynchronously.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfpersistentpropertyloaderacp
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfPersistentPropertyLoaderACP extends IUnknown {
    /**
     * The interface identifier for ITfPersistentPropertyLoaderACP
     * @type {Guid}
     */
    static IID := Guid("{4ef89150-0807-11d3-8df0-00105a2799b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfPersistentPropertyLoaderACP interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LoadProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfPersistentPropertyLoaderACP.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfPersistentPropertyLoaderACP::LoadProperty method
     * @remarks
     * Only property data is written to the stream. The header data is not written to the stream.
     * 
     * Obtain the original position of the stream before writing to the stream. The original position should be restored in the stream before returning from this method.
     * @param {Pointer<TF_PERSISTENT_PROPERTY_HEADER_ACP>} pHdr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_persistent_property_header_acp">TF_PERSISTENT_PROPERTY_HEADER_ACP</a> structure that identifies the property to load. This structure contains the same data as the structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itextstoreacpservices-unserialize">ITextStoreACPServices::Unserialize</a>.
     * @returns {IStream} Pointer to an <b>IStream</b> interface pointer that receives the stream object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpersistentpropertyloaderacp-loadproperty
     */
    LoadProperty(pHdr) {
        result := ComCall(3, this, TF_PERSISTENT_PROPERTY_HEADER_ACP.Ptr, pHdr, "ptr*", &ppStream := 0, "HRESULT")
        return IStream(ppStream)
    }

    Query(iid) {
        if (ITfPersistentPropertyLoaderACP.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadProperty := CallbackCreate(GetMethod(implObj, "LoadProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadProperty)
    }
}
