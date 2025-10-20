#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for color management.
 * @remarks
 * 
  * A Color Context is an abstraction for a color profile. The profile can either be loaded from a file (like "sRGB Color Space Profile.icm"), read from a memory buffer, or can be defined by an EXIF color space. The system color profile directory can be obtained by calling [GetColorDirectoryW](/windows/win32/api/icm/nf-icm-getcolordirectoryw).
  * 
  * Once a color context has been initialized, it cannot be re-initialized.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwiccolorcontext
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICColorContext extends IUnknown{
    /**
     * The interface identifier for IWICColorContext
     * @type {Guid}
     */
    static IID => Guid("{3c613a02-34b2-44ea-9a7c-45aea9c6fd6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} wzFilename 
     * @returns {HRESULT} 
     */
    InitializeFromFilename(wzFilename) {
        wzFilename := wzFilename is String ? StrPtr(wzFilename) : wzFilename

        result := ComCall(3, this, "ptr", wzFilename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Integer} cbBufferSize 
     * @returns {HRESULT} 
     */
    InitializeFromMemory(pbBuffer, cbBufferSize) {
        result := ComCall(4, this, "char*", pbBuffer, "uint", cbBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    InitializeFromExifColorSpace(value) {
        result := ComCall(5, this, "uint", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetType(pType) {
        result := ComCall(6, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {HRESULT} 
     */
    GetProfileBytes(cbBuffer, pbBuffer, pcbActual) {
        result := ComCall(7, this, "uint", cbBuffer, "char*", pbBuffer, "uint*", pcbActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pValue 
     * @returns {HRESULT} 
     */
    GetExifColorSpace(pValue) {
        result := ComCall(8, this, "uint*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
