#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaStream.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-iammediatypestream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMMediaTypeStream extends IMediaStream{
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
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetFormat(pMediaType, dwFlags) {
        result := ComCall(9, this, "ptr", pMediaType, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetFormat(pMediaType, dwFlags) {
        result := ComCall(10, this, "ptr", pMediaType, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lSampleSize 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<IAMMediaTypeSample>} ppAMMediaTypeSample 
     * @returns {HRESULT} 
     */
    CreateSample(lSampleSize, pbBuffer, dwFlags, pUnkOuter, ppAMMediaTypeSample) {
        result := ComCall(11, this, "int", lSampleSize, "char*", pbBuffer, "uint", dwFlags, "ptr", pUnkOuter, "ptr", ppAMMediaTypeSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pProps 
     * @returns {HRESULT} 
     */
    GetStreamAllocatorRequirements(pProps) {
        result := ComCall(12, this, "ptr", pProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pProps 
     * @returns {HRESULT} 
     */
    SetStreamAllocatorRequirements(pProps) {
        result := ComCall(13, this, "ptr", pProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
