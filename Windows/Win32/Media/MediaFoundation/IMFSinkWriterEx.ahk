#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFTransform.ahk" { IMFTransform }
#Import ".\IMFSinkWriter.ahk" { IMFSinkWriter }

/**
 * Extends the IMFSinkWriter interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nn-mfreadwrite-imfsinkwriterex
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSinkWriterEx extends IMFSinkWriter {
    /**
     * The interface identifier for IMFSinkWriterEx
     * @type {Guid}
     */
    static IID := Guid("{588d72ab-5bc1-496a-8714-b70617141b25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSinkWriterEx interfaces
    */
    struct Vtbl extends IMFSinkWriter.Vtbl {
        GetTransformForStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSinkWriterEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a pointer to a Media Foundation transform (MFT) for a specified stream. (IMFSinkWriterEx.GetTransformForStream)
     * @param {Integer} dwStreamIndex The zero-based index of a stream.
     * @param {Integer} dwTransformIndex The zero-based index of the MFT to retrieve.
     * @param {Pointer<Guid>} pGuidCategory Receives a pointer to a GUID that specifies the category of the MFT. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
     * @param {Pointer<IMFTransform>} ppTransform Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface of the MFT. The caller must release the interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriterex-gettransformforstream
     */
    GetTransformForStream(dwStreamIndex, dwTransformIndex, pGuidCategory, ppTransform) {
        result := ComCall(14, this, "uint", dwStreamIndex, "uint", dwTransformIndex, Guid.Ptr, pGuidCategory, IMFTransform.Ptr, ppTransform, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSinkWriterEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTransformForStream := CallbackCreate(GetMethod(implObj, "GetTransformForStream"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTransformForStream)
    }
}
