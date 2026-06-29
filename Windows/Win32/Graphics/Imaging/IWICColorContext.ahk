#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WICColorContextType.ahk" { WICColorContextType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods for color management.
 * @remarks
 * A Color Context is an abstraction for a color profile. The profile can either be loaded from a file (like "sRGB Color Space Profile.icm"), read from a memory buffer, or can be defined by an EXIF color space. The system color profile directory can be obtained by calling [GetColorDirectoryW](/windows/win32/api/icm/nf-icm-getcolordirectoryw).
 * 
 * Once a color context has been initialized, it cannot be re-initialized.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwiccolorcontext
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICColorContext extends IUnknown {
    /**
     * The interface identifier for IWICColorContext
     * @type {Guid}
     */
    static IID := Guid("{3c613a02-34b2-44ea-9a7c-45aea9c6fd6d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICColorContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeFromFilename       : IntPtr
        InitializeFromMemory         : IntPtr
        InitializeFromExifColorSpace : IntPtr
        GetType                      : IntPtr
        GetProfileBytes              : IntPtr
        GetExifColorSpace            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICColorContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the color context from the given file.
     * @remarks
     * Once a color context has been initialized, it can't be re-initialized.
     * @param {PWSTR} wzFilename Type: <b>LPCWSTR</b>
     * 
     * The name of the file.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-initializefromfilename
     */
    InitializeFromFilename(wzFilename) {
        wzFilename := wzFilename is String ? StrPtr(wzFilename) : wzFilename

        result := ComCall(3, this, "ptr", wzFilename, "HRESULT")
        return result
    }

    /**
     * Initializes the color context from a memory block.
     * @remarks
     * Once a color context has been initialized, it can't be re-initialized.
     * @param {Pointer<Integer>} pbBuffer Type: <b>const BYTE*</b>
     * 
     * The buffer used to initialize the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>.
     * @param {Integer} cbBufferSize Type: <b>UINT</b>
     * 
     * The size of the <i>pbBuffer</i> buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-initializefrommemory
     */
    InitializeFromMemory(pbBuffer, cbBufferSize) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbBufferMarshal, pbBuffer, "uint", cbBufferSize, "HRESULT")
        return result
    }

    /**
     * Initializes the color context using an Exchangeable Image File (EXIF) color space.
     * @remarks
     * Once a color context has been initialized, it can't be re-initialized.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-initializefromexifcolorspace
     */
    InitializeFromExifColorSpace(value) {
        result := ComCall(5, this, "uint", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the color context type. (IWICColorContext.GetType)
     * @returns {WICColorContextType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccolorcontexttype">WICColorContextType</a>*</b>
     * 
     * A pointer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccolorcontexttype">WICColorContextType</a> of the color context.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-gettype
     */
    GetType() {
        result := ComCall(6, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Retrieves the color context profile.
     * @remarks
     * Only use this method if the context type is <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccolorcontexttype">WICColorContextProfile</a>.
     * 
     * 
     * Calling this method with <i>pbBuffer</i> set to <b>NULL</b> will cause it to return the required buffer size in <i>pcbActual</i>.
     * @param {Integer} cbBuffer Type: <b>UINT</b>
     * 
     * The size of the <i>pbBuffer</i> buffer.
     * @param {Pointer<Integer>} pbBuffer Type: <b>BYTE*</b>
     * 
     * A pointer that receives the color context profile.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the actual buffer size needed to retrieve the entire color context profile.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-getprofilebytes
     */
    GetProfileBytes(cbBuffer, pbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", cbBuffer, pbBufferMarshal, pbBuffer, "uint*", &pcbActual := 0, "HRESULT")
        return pcbActual
    }

    /**
     * Retrieves the Exchangeable Image File (EXIF) color space color context.
     * @remarks
     * This method should only be used when <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwiccolorcontext-gettype">IWICColorContext::GetType</a> indicates <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccolorcontexttype">WICColorContextExifColorSpace</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolorcontext-getexifcolorspace
     */
    GetExifColorSpace() {
        result := ComCall(8, this, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IWICColorContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeFromFilename := CallbackCreate(GetMethod(implObj, "InitializeFromFilename"), flags, 2)
        this.vtbl.InitializeFromMemory := CallbackCreate(GetMethod(implObj, "InitializeFromMemory"), flags, 3)
        this.vtbl.InitializeFromExifColorSpace := CallbackCreate(GetMethod(implObj, "InitializeFromExifColorSpace"), flags, 2)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.GetProfileBytes := CallbackCreate(GetMethod(implObj, "GetProfileBytes"), flags, 4)
        this.vtbl.GetExifColorSpace := CallbackCreate(GetMethod(implObj, "GetExifColorSpace"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeFromFilename)
        CallbackFree(this.vtbl.InitializeFromMemory)
        CallbackFree(this.vtbl.InitializeFromExifColorSpace)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.GetProfileBytes)
        CallbackFree(this.vtbl.GetExifColorSpace)
    }
}
