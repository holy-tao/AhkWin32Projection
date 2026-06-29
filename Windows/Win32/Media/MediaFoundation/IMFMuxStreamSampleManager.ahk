#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFSample.ahk" { IMFSample }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the ability to retrieve IMFSample objects for individual substreams within the output of a multiplexed media source.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfmuxstreamsamplemanager
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMuxStreamSampleManager extends IUnknown {
    /**
     * The interface identifier for IMFMuxStreamSampleManager
     * @type {Guid}
     */
    static IID := Guid("{74abbc19-b1cc-4e41-bb8b-9d9b86a8f6ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMuxStreamSampleManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStreamCount         : IntPtr
        GetSample              : IntPtr
        GetStreamConfiguration : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMuxStreamSampleManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the count of substreams managed by the multiplexed media source. (IMFMuxStreamSampleManager.GetStreamCount)
     * @returns {Integer} The count of substreams managed by the multiplexed media source.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pdwMuxStreamCount := 0, "HRESULT")
        return pdwMuxStreamCount
    }

    /**
     * Gets the IMFSample associated with the substream with the specified index.
     * @param {Integer} dwMuxStreamIndex The index of the substream for which a sample is retrieved.
     * @returns {IMFSample} The retrieved sample.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getsample
     */
    GetSample(dwMuxStreamIndex) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr*", &ppSample := 0, "HRESULT")
        return IMFSample(ppSample)
    }

    /**
     * Gets the active stream configuration for the media source, which defines the set of substreams that are included the multiplexed output.
     * @returns {Integer} Gets a  bitmask value where the bits that are on represent the indices of the substreams that are included in the stream configuration.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getstreamconfiguration
     */
    GetStreamConfiguration() {
        result := ComCall(5, this, Int64)
        return result
    }

    Query(iid) {
        if (IMFMuxStreamSampleManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStreamCount := CallbackCreate(GetMethod(implObj, "GetStreamCount"), flags, 2)
        this.vtbl.GetSample := CallbackCreate(GetMethod(implObj, "GetSample"), flags, 3)
        this.vtbl.GetStreamConfiguration := CallbackCreate(GetMethod(implObj, "GetStreamConfiguration"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStreamCount)
        CallbackFree(this.vtbl.GetSample)
        CallbackFree(this.vtbl.GetStreamConfiguration)
    }
}
