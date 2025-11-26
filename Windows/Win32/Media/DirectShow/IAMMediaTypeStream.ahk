#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\MediaFoundation\AM_MEDIA_TYPE.ahk
#Include .\IAMMediaTypeSample.ahk
#Include .\ALLOCATOR_PROPERTIES.ahk
#Include .\IMediaStream.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-iammediatypestream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMMediaTypeStream extends IMediaStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMMediaTypeStream
     * @type {Guid}
     */
    static IID => Guid("{ab6b4afa-f6e4-11d0-900d-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormat", "SetFormat", "CreateSample", "GetStreamAllocatorRequirements", "SetStreamAllocatorRequirements"]

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetFormat method retrieves the format of the stream.
     * @param {Integer} dwFlags Reserved.
     * @returns {AM_MEDIA_TYPE} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that receives the stream format.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypestream-getformat
     */
    GetFormat(dwFlags) {
        pMediaType := AM_MEDIA_TYPE()
        result := ComCall(9, this, "ptr", pMediaType, "uint", dwFlags, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypestream-setformat
     */
    SetFormat(pMediaType, dwFlags) {
        result := ComCall(10, this, "ptr", pMediaType, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The CreateSample method creates a stream sample and optionally specifies the sample buffer.
     * @param {Integer} lSampleSize Size of the sample.
     * @param {Pointer<Integer>} pbBuffer [optional] Pointer to an array of bytes that contains the sample data, or <b>NULL</b>.
     * @param {Integer} dwFlags Reserved.
     * @param {IUnknown} pUnkOuter [optional] Pointer to the interface of an object that aggregates the stream sample.
     * @returns {IAMMediaTypeSample} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nn-amstream-iammediatypesample">IAMMediaTypeSample</a> interface pointer that receives a pointer to the created sample.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypestream-createsample
     */
    CreateSample(lSampleSize, pbBuffer, dwFlags, pUnkOuter) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, "int", lSampleSize, pbBufferMarshal, pbBuffer, "uint", dwFlags, "ptr", pUnkOuter, "ptr*", &ppAMMediaTypeSample := 0, "HRESULT")
        return IAMMediaTypeSample(ppAMMediaTypeSample)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetStreamAllocatorRequirements retrieves the allocator requirements for the stream. This method is not currently implemented.
     * @returns {ALLOCATOR_PROPERTIES} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ns-strmif-allocator_properties">ALLOCATOR_PROPERTIES</a> structure that receives the stream allocator requirements.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypestream-getstreamallocatorrequirements
     */
    GetStreamAllocatorRequirements() {
        pProps := ALLOCATOR_PROPERTIES()
        result := ComCall(12, this, "ptr", pProps, "HRESULT")
        return pProps
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetStreamAllocatorRequirements sets the allocator requirements for the stream. This method is not currently implemented.
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pProps Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ns-strmif-allocator_properties">ALLOCATOR_PROPERTIES</a> structure that contains the stream allocator requirements.
     * @returns {HRESULT} Returns E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypestream-setstreamallocatorrequirements
     */
    SetStreamAllocatorRequirements(pProps) {
        result := ComCall(13, this, "ptr", pProps, "HRESULT")
        return result
    }
}
