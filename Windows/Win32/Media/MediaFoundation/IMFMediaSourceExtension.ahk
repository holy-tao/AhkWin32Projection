#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFSourceBuffer.ahk" { IMFSourceBuffer }
#Import ".\IMFSourceBufferList.ahk" { IMFSourceBufferList }
#Import ".\MF_MSE_READY.ahk" { MF_MSE_READY }
#Import ".\IMFSourceBufferNotify.ahk" { IMFSourceBufferNotify }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MF_MSE_ERROR.ahk" { MF_MSE_ERROR }

/**
 * Provides functionality for the Media Source Extension (MSE).
 * @remarks
 * Media Source Extensions (MSE) is a World Wide Web Consortium (W3C) standard that extends the HTML5 media  elements to enable dynamically changing the media stream without the use of plug-ins. The   <b>IMFMediaSourceExtension</b> interface  and the related Microsoft Win32 API implement MSE and are expected to only be called by web browsers implementing MSE.  
 * 
 * The MSE media source keeps track of the ready state of the of the source as well as a list of <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfsourcebuffer">IMFSourceBuffer</a> objects which provide media data for the source.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediasourceextension
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaSourceExtension extends IUnknown {
    /**
     * The interface identifier for IMFMediaSourceExtension
     * @type {Guid}
     */
    static IID := Guid("{e467b94e-a713-4562-a802-816a42e9008a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaSourceExtension interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSourceBuffers       : IntPtr
        GetActiveSourceBuffers : IntPtr
        GetReadyState          : IntPtr
        GetDuration            : IntPtr
        SetDuration            : IntPtr
        AddSourceBuffer        : IntPtr
        RemoveSourceBuffer     : IntPtr
        SetEndOfStream         : IntPtr
        IsTypeSupported        : IntPtr
        GetSourceBuffer        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaSourceExtension.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the collection of source buffers associated with this media source.
     * @returns {IMFSourceBufferList} The collection of source buffers.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextension-getsourcebuffers
     */
    GetSourceBuffers() {
        result := ComCall(3, this, IMFSourceBufferList)
        return result
    }

    /**
     * Gets the source buffers that are actively supplying media data to the media source.
     * @returns {IMFSourceBufferList} The list of active source buffers.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextension-getactivesourcebuffers
     */
    GetActiveSourceBuffers() {
        result := ComCall(4, this, IMFSourceBufferList)
        return result
    }

    /**
     * Gets the ready state of the media source.
     * @returns {MF_MSE_READY} The ready state of the media source.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextension-getreadystate
     */
    GetReadyState() {
        result := ComCall(5, this, MF_MSE_READY)
        return result
    }

    /**
     * Gets the duration of the media source in 100-nanosecond units.
     * @returns {Float} The duration of the media source in 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextension-getduration
     */
    GetDuration() {
        result := ComCall(6, this, Float64)
        return result
    }

    /**
     * Sets the duration of the media source in 100-nanosecond units.
     * @param {Float} duration The duration of the media source in 100-nanosecond units.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextension-setduration
     */
    SetDuration(duration) {
        result := ComCall(7, this, "double", duration, "HRESULT")
        return result
    }

    /**
     * Adds a IMFSourceBuffer to the collection of buffers associated with the IMFMediaSourceExtension.
     * @param {BSTR} type 
     * @param {IMFSourceBufferNotify} pNotify 
     * @returns {IMFSourceBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextension-addsourcebuffer
     */
    AddSourceBuffer(type, pNotify) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(8, this, BSTR, type, "ptr", pNotify, "ptr*", &ppSourceBuffer := 0, "HRESULT")
        return IMFSourceBuffer(ppSourceBuffer)
    }

    /**
     * Removes the specified source buffer from the collection of source buffers managed by the IMFMediaSourceExtension object.
     * @param {IMFSourceBuffer} pSourceBuffer The buffer to remove.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextension-removesourcebuffer
     */
    RemoveSourceBuffer(pSourceBuffer) {
        result := ComCall(9, this, "ptr", pSourceBuffer, "HRESULT")
        return result
    }

    /**
     * Indicate that the end of the media stream has been reached.
     * @param {MF_MSE_ERROR} _error Used to pass error information.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextension-setendofstream
     */
    SetEndOfStream(_error) {
        result := ComCall(10, this, MF_MSE_ERROR, _error, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates if the specified MIME type is supported by the media source.
     * @param {BSTR} type The media type to check support for.
     * @returns {BOOL} <b>true</b> if the media type is supported; otherwise, <b>false</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextension-istypesupported
     */
    IsTypeSupported(type) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(11, this, BSTR, type, BOOL)
        return result
    }

    /**
     * Gets the IMFSourceBuffer at the specified index in the collection of buffers.
     * @param {Integer} dwStreamIndex The location of the buffer in the collection.
     * @returns {IMFSourceBuffer} The source buffer.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediasourceextension-getsourcebuffer
     */
    GetSourceBuffer(dwStreamIndex) {
        result := ComCall(12, this, "uint", dwStreamIndex, IMFSourceBuffer)
        return result
    }

    Query(iid) {
        if (IMFMediaSourceExtension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSourceBuffers := CallbackCreate(GetMethod(implObj, "GetSourceBuffers"), flags, 1)
        this.vtbl.GetActiveSourceBuffers := CallbackCreate(GetMethod(implObj, "GetActiveSourceBuffers"), flags, 1)
        this.vtbl.GetReadyState := CallbackCreate(GetMethod(implObj, "GetReadyState"), flags, 1)
        this.vtbl.GetDuration := CallbackCreate(GetMethod(implObj, "GetDuration"), flags, 1)
        this.vtbl.SetDuration := CallbackCreate(GetMethod(implObj, "SetDuration"), flags, 2)
        this.vtbl.AddSourceBuffer := CallbackCreate(GetMethod(implObj, "AddSourceBuffer"), flags, 4)
        this.vtbl.RemoveSourceBuffer := CallbackCreate(GetMethod(implObj, "RemoveSourceBuffer"), flags, 2)
        this.vtbl.SetEndOfStream := CallbackCreate(GetMethod(implObj, "SetEndOfStream"), flags, 2)
        this.vtbl.IsTypeSupported := CallbackCreate(GetMethod(implObj, "IsTypeSupported"), flags, 2)
        this.vtbl.GetSourceBuffer := CallbackCreate(GetMethod(implObj, "GetSourceBuffer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSourceBuffers)
        CallbackFree(this.vtbl.GetActiveSourceBuffers)
        CallbackFree(this.vtbl.GetReadyState)
        CallbackFree(this.vtbl.GetDuration)
        CallbackFree(this.vtbl.SetDuration)
        CallbackFree(this.vtbl.AddSourceBuffer)
        CallbackFree(this.vtbl.RemoveSourceBuffer)
        CallbackFree(this.vtbl.SetEndOfStream)
        CallbackFree(this.vtbl.IsTypeSupported)
        CallbackFree(this.vtbl.GetSourceBuffer)
    }
}
