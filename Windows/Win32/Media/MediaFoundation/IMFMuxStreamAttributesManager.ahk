#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the IMFAttributes of the substreams of a multiplexed media source.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfmuxstreamattributesmanager
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMuxStreamAttributesManager extends IUnknown {
    /**
     * The interface identifier for IMFMuxStreamAttributesManager
     * @type {Guid}
     */
    static IID := Guid("{ce8bd576-e440-43b3-be34-1e53f565f7e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMuxStreamAttributesManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStreamCount : IntPtr
        GetAttributes  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMuxStreamAttributesManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the count of substreams managed by the multiplexed media source. (IMFMuxStreamAttributesManager.GetStreamCount)
     * @returns {Integer} The count of substreams managed by the multiplexed media source.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamattributesmanager-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pdwMuxStreamCount := 0, "HRESULT")
        return pdwMuxStreamCount
    }

    /**
     * Gets the IMFAttributes for the substream with the specified index.
     * @param {Integer} dwMuxStreamIndex The index of the substream for which attributes are retrieved.
     * @returns {IMFAttributes} The attributes for the specified substream.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamattributesmanager-getattributes
     */
    GetAttributes(dwMuxStreamIndex) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr*", &ppStreamAttributes := 0, "HRESULT")
        return IMFAttributes(ppStreamAttributes)
    }

    Query(iid) {
        if (IMFMuxStreamAttributesManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStreamCount := CallbackCreate(GetMethod(implObj, "GetStreamCount"), flags, 2)
        this.vtbl.GetAttributes := CallbackCreate(GetMethod(implObj, "GetAttributes"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStreamCount)
        CallbackFree(this.vtbl.GetAttributes)
    }
}
