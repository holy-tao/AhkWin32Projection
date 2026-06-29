#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import ".\IMFMediaType.ahk" { IMFMediaType }

/**
 * . (IMFSensorStream)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsensorstream
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSensorStream extends IMFAttributes {
    /**
     * The interface identifier for IMFSensorStream
     * @type {Guid}
     */
    static IID := Guid("{e9a42171-c56e-498a-8b39-eda5a070b7fc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSensorStream interfaces
    */
    struct Vtbl extends IMFAttributes.Vtbl {
        GetMediaTypeCount : IntPtr
        GetMediaType      : IntPtr
        CloneSensorStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSensorStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the count of media types supported by the sensor stream.
     * @returns {Integer} If the call completes successfully, receives the count of media types supported by the stream.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorstream-getmediatypecount
     */
    GetMediaTypeCount() {
        result := ComCall(33, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Retrieves an IMFMediaType representing a supported media type for the sensor stream.
     * @param {Integer} dwIndex The 0-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> to retrieve. This value must be between 0 and the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensorstream-getmediatypecount">GetMediaTypeCount</a> - 1.
     * @returns {IMFMediaType} The retrieved media type.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorstream-getmediatype
     */
    GetMediaType(dwIndex) {
        result := ComCall(34, this, "uint", dwIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Clones the IMFSensorStream.
     * @returns {IMFSensorStream} If the call is successful, <i>ppStream</i> receives the cloned <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorstream">IMFSensorStream</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorstream-clonesensorstream
     */
    CloneSensorStream() {
        result := ComCall(35, this, "ptr*", &ppStream := 0, "HRESULT")
        return IMFSensorStream(ppStream)
    }

    Query(iid) {
        if (IMFSensorStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMediaTypeCount := CallbackCreate(GetMethod(implObj, "GetMediaTypeCount"), flags, 2)
        this.vtbl.GetMediaType := CallbackCreate(GetMethod(implObj, "GetMediaType"), flags, 3)
        this.vtbl.CloneSensorStream := CallbackCreate(GetMethod(implObj, "CloneSensorStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMediaTypeCount)
        CallbackFree(this.vtbl.GetMediaType)
        CallbackFree(this.vtbl.CloneSensorStream)
    }
}
