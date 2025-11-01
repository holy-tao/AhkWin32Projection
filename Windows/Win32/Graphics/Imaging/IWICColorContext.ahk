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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromFilename", "InitializeFromMemory", "InitializeFromExifColorSpace", "GetType", "GetProfileBytes", "GetExifColorSpace"]

    /**
     * 
     * @param {PWSTR} wzFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-initializefromfilename
     */
    InitializeFromFilename(wzFilename) {
        wzFilename := wzFilename is String ? StrPtr(wzFilename) : wzFilename

        result := ComCall(3, this, "ptr", wzFilename, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Integer} cbBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-initializefrommemory
     */
    InitializeFromMemory(pbBuffer, cbBufferSize) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbBufferMarshal, pbBuffer, "uint", cbBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-initializefromexifcolorspace
     */
    InitializeFromExifColorSpace(value) {
        result := ComCall(5, this, "uint", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-gettype
     */
    GetType(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Pointer<Integer>} pcbActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-getprofilebytes
     */
    GetProfileBytes(cbBuffer, pbBuffer, pcbActual) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", cbBuffer, pbBufferMarshal, pbBuffer, pcbActualMarshal, pcbActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-getexifcolorspace
     */
    GetExifColorSpace(pValue) {
        pValueMarshal := pValue is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pValueMarshal, pValue, "HRESULT")
        return result
    }
}
