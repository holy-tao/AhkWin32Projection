#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import ".\IMediaStream.ahk" { IMediaStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ALLOCATOR_PROPERTIES.ahk" { ALLOCATOR_PROPERTIES }
#Import ".\IAMMediaTypeSample.ahk" { IAMMediaTypeSample }

/**
 * Note  This interface is deprecated.
 * @see https://learn.microsoft.com/windows/win32/api/amstream/nn-amstream-iammediatypestream
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMMediaTypeStream extends IMediaStream {
    /**
     * The interface identifier for IAMMediaTypeStream
     * @type {Guid}
     */
    static IID := Guid("{ab6b4afa-f6e4-11d0-900d-00c04fd9189d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMMediaTypeStream interfaces
    */
    struct Vtbl extends IMediaStream.Vtbl {
        GetFormat                      : IntPtr
        SetFormat                      : IntPtr
        CreateSample                   : IntPtr
        GetStreamAllocatorRequirements : IntPtr
        SetStreamAllocatorRequirements : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMMediaTypeStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetFormat method retrieves the format of the stream.
     * @param {Integer} dwFlags Reserved.
     * @returns {AM_MEDIA_TYPE} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that receives the stream format.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypestream-getformat
     */
    GetFormat(dwFlags) {
        pMediaType := AM_MEDIA_TYPE()
        result := ComCall(9, this, AM_MEDIA_TYPE.Ptr, pMediaType, "uint", dwFlags, "HRESULT")
        return pMediaType
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetFormat method sets the format of the stream.
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that contains the stream format.
     * @param {Integer} dwFlags Reserved.
     * @returns {HRESULT} Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MS_E_SAMPLEALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream has already allocated a sample with another media type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypestream-setformat
     */
    SetFormat(pMediaType, dwFlags) {
        result := ComCall(10, this, AM_MEDIA_TYPE.Ptr, pMediaType, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The CreateSample method creates a stream sample and optionally specifies the sample buffer.
     * @remarks
     * If <i>pUnkOuter</i> is non-<b>NULL</b>, the new stream sample is aggregated into the specified object. Filters that receive the sample can then query it for interfaces supported by the aggregating object.
     * @param {Integer} lSampleSize Size of the sample.
     * @param {Pointer<Integer>} pbBuffer [optional] Pointer to an array of bytes that contains the sample data, or <b>NULL</b>.
     * @param {Integer} dwFlags Reserved.
     * @param {IUnknown} pUnkOuter [optional] Pointer to the interface of an object that aggregates the stream sample.
     * @returns {IAMMediaTypeSample} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nn-amstream-iammediatypesample">IAMMediaTypeSample</a> interface pointer that receives a pointer to the created sample.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypestream-createsample
     */
    CreateSample(lSampleSize, pbBuffer, dwFlags, pUnkOuter) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, "int", lSampleSize, pbBufferMarshal, pbBuffer, "uint", dwFlags, "ptr", pUnkOuter, "ptr*", &ppAMMediaTypeSample := 0, "HRESULT")
        return IAMMediaTypeSample(ppAMMediaTypeSample)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetStreamAllocatorRequirements retrieves the allocator requirements for the stream. This method is not currently implemented.
     * @returns {ALLOCATOR_PROPERTIES} Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-allocator_properties">ALLOCATOR_PROPERTIES</a> structure that receives the stream allocator requirements.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypestream-getstreamallocatorrequirements
     */
    GetStreamAllocatorRequirements() {
        pProps := ALLOCATOR_PROPERTIES()
        result := ComCall(12, this, ALLOCATOR_PROPERTIES.Ptr, pProps, "HRESULT")
        return pProps
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetStreamAllocatorRequirements sets the allocator requirements for the stream. This method is not currently implemented.
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pProps Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-allocator_properties">ALLOCATOR_PROPERTIES</a> structure that contains the stream allocator requirements.
     * @returns {HRESULT} Returns E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypestream-setstreamallocatorrequirements
     */
    SetStreamAllocatorRequirements(pProps) {
        result := ComCall(13, this, ALLOCATOR_PROPERTIES.Ptr, pProps, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMMediaTypeStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 3)
        this.vtbl.SetFormat := CallbackCreate(GetMethod(implObj, "SetFormat"), flags, 3)
        this.vtbl.CreateSample := CallbackCreate(GetMethod(implObj, "CreateSample"), flags, 6)
        this.vtbl.GetStreamAllocatorRequirements := CallbackCreate(GetMethod(implObj, "GetStreamAllocatorRequirements"), flags, 2)
        this.vtbl.SetStreamAllocatorRequirements := CallbackCreate(GetMethod(implObj, "SetStreamAllocatorRequirements"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFormat)
        CallbackFree(this.vtbl.SetFormat)
        CallbackFree(this.vtbl.CreateSample)
        CallbackFree(this.vtbl.GetStreamAllocatorRequirements)
        CallbackFree(this.vtbl.SetStreamAllocatorRequirements)
    }
}
