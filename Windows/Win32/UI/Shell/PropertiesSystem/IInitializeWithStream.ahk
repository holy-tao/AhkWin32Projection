#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that initializes a handler, such as a property handler, thumbnail handler, or preview handler, with a stream.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-iinitializewithstream
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IInitializeWithStream extends IUnknown {
    /**
     * The interface identifier for IInitializeWithStream
     * @type {Guid}
     */
    static IID := Guid("{b824b49d-22ac-4161-ac8a-9916e8fa3f7f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInitializeWithStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInitializeWithStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a handler with a stream.
     * @remarks
     * This method is preferred to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-iinitializewithfile-initialize">Initialize</a> due to its ability to use streams that are not accessible through a Win32 path, such as the contents of a compressed file with a .zip file name extension.
     * 
     * The stream pointed to by <i>pstream</i> must remain open for the lifetime of the handler or until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb761470(v=vs.85)">IPropertyStore::Commit</a> is called.
     * 
     * When first opened, the source stream reference points to the beginning of the stream. The handler can seek and read from the stream at any time. A handler can be implemented to read all properties from the stream during <b>Initialize</b> or it can wait until the calling process attempts to enumerate or read properties before fetching them from the stream.
     * 
     * A handler instance should be initialized only once in its lifetime. Attempts by the caller to reinitialize the handler should result in the error <c>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</c>.
     * @param {IStream} pstream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface that represents the stream source.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * One of the following <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM</a> values that indicates the access mode for <i>pstream</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-iinitializewithstream-initialize
     */
    Initialize(pstream, grfMode) {
        result := ComCall(3, this, "ptr", pstream, "uint", grfMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInitializeWithStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
