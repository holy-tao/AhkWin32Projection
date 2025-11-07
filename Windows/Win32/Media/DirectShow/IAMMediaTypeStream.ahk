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
     * 
     * @param {Integer} dwFlags 
     * @returns {AM_MEDIA_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypestream-getformat
     */
    GetFormat(dwFlags) {
        pMediaType := AM_MEDIA_TYPE()
        result := ComCall(9, this, "ptr", pMediaType, "uint", dwFlags, "HRESULT")
        return pMediaType
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypestream-setformat
     */
    SetFormat(pMediaType, dwFlags) {
        result := ComCall(10, this, "ptr", pMediaType, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSampleSize 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Integer} dwFlags 
     * @param {IUnknown} pUnkOuter 
     * @returns {IAMMediaTypeSample} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypestream-createsample
     */
    CreateSample(lSampleSize, pbBuffer, dwFlags, pUnkOuter) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, "int", lSampleSize, pbBufferMarshal, pbBuffer, "uint", dwFlags, "ptr", pUnkOuter, "ptr*", &ppAMMediaTypeSample := 0, "HRESULT")
        return IAMMediaTypeSample(ppAMMediaTypeSample)
    }

    /**
     * 
     * @returns {ALLOCATOR_PROPERTIES} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypestream-getstreamallocatorrequirements
     */
    GetStreamAllocatorRequirements() {
        pProps := ALLOCATOR_PROPERTIES()
        result := ComCall(12, this, "ptr", pProps, "HRESULT")
        return pProps
    }

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypestream-setstreamallocatorrequirements
     */
    SetStreamAllocatorRequirements(pProps) {
        result := ComCall(13, this, "ptr", pProps, "HRESULT")
        return result
    }
}
