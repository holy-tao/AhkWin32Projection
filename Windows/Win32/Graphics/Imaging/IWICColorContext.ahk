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
     * Initializes the color context from the given file.
     * @param {PWSTR} wzFilename Type: <b>LPCWSTR</b>
     * 
     * The name of the file.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccolorcontext-initializefromfilename
     */
    InitializeFromFilename(wzFilename) {
        wzFilename := wzFilename is String ? StrPtr(wzFilename) : wzFilename

        result := ComCall(3, this, "ptr", wzFilename, "HRESULT")
        return result
    }

    /**
     * Initializes the color context from a memory block.
     * @param {Pointer<Integer>} pbBuffer Type: <b>const BYTE*</b>
     * 
     * The buffer used to initialize the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>.
     * @param {Integer} cbBufferSize Type: <b>UINT</b>
     * 
     * The size of the <i>pbBuffer</i> buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccolorcontext-initializefrommemory
     */
    InitializeFromMemory(pbBuffer, cbBufferSize) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbBufferMarshal, pbBuffer, "uint", cbBufferSize, "HRESULT")
        return result
    }

    /**
     * Initializes the color context using an Exchangeable Image File (EXIF) color space.
     * @param {Integer} value Type: <b>UINT</b>
     * 
     * The value of the EXIF color space.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A sRGB color space.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An Adobe RGB color space.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccolorcontext-initializefromexifcolorspace
     */
    InitializeFromExifColorSpace(value) {
        result := ComCall(5, this, "uint", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the color context type.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccolorcontexttype">WICColorContextType</a>*</b>
     * 
     * A pointer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccolorcontexttype">WICColorContextType</a> of the color context.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccolorcontext-gettype
     */
    GetType() {
        result := ComCall(6, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Retrieves the color context profile.
     * @param {Integer} cbBuffer Type: <b>UINT</b>
     * 
     * The size of the <i>pbBuffer</i> buffer.
     * @param {Pointer<Integer>} pbBuffer Type: <b>BYTE*</b>
     * 
     * A pointer that receives the color context profile.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the actual buffer size needed to retrieve the entire color context profile.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccolorcontext-getprofilebytes
     */
    GetProfileBytes(cbBuffer, pbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", cbBuffer, pbBufferMarshal, pbBuffer, "uint*", &pcbActual := 0, "HRESULT")
        return pcbActual
    }

    /**
     * Retrieves the Exchangeable Image File (EXIF) color space color context.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the EXIF color space color context.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A sRGB color space.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An Adobe RGB color space.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>3 through 65534</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccolorcontext-getexifcolorspace
     */
    GetExifColorSpace() {
        result := ComCall(8, this, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }
}
