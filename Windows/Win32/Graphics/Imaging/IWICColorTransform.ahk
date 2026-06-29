#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import ".\IWICColorContext.ahk" { IWICColorContext }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes methods that transforms an IWICBitmapSource from one color context to another.
 * @remarks
 * A <b>IWICColorTransform</b> is an imaging pipeline component that knows how to pull pixels obtained from a given <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> through a color transform. The color transform is defined by mapping colors from the source color context to the destination color context in a given output pixel format.
 * 
 * Once initialized, a color transform cannot be reinitialized. Because of this, a color transform cannot be used with multiple sources or varying parameters.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwiccolortransform
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICColorTransform extends IWICBitmapSource {
    /**
     * The interface identifier for IWICColorTransform
     * @type {Guid}
     */
    static IID := Guid("{b66f034f-d0e2-40ab-b436-6de39e321a94}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICColorTransform interfaces
    */
    struct Vtbl extends IWICBitmapSource.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICColorTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes an IWICColorTransform with a IWICBitmapSource and transforms it from one IWICColorContext to another.
     * @remarks
     * The currently supported formats for the <i>pIContextSource</i>  and <i>pixelFmtDest</i> parameters are: 
     * 
     * 
     * <ul>
     * <li>GUID_WICPixelFormat8bppGray</li>
     * <li>GUID_WICPixelFormat16bppGray</li>
     * <li>GUID_WICPixelFormat16bppBGR555</li>
     * <li>GUID_WICPixelFormat16bppBGR565</li>
     * <li>GUID_WICPixelFormat24bppBGR</li>
     * <li>GUID_WICPixelFormat24bppRGB</li>
     * <li>GUID_WICPixelFormat32bppBGR</li>
     * <li>GUID_WICPixelFormat32bppBGRA</li>
     * <li>GUID_WICPixelFormat32bppPBGRA</li>
     * <li>GUID_WICPixelFormat32bppPRGBA (Windows 8 and later)</li>
     * <li>GUID_WICPixelFormat32bppRGBA</li>
     * <li>GUID_WICPixelFormat32bppBGR101010</li>
     * <li>GUID_WICPixelFormat32bppCMYK</li>
     * <li>GUID_WICPixelFormat48bppBGR</li>
     * <li>GUID_WICPixelFormat64bppBGRA 		(Windows 8 and later)</li>
     * <li>GUID_WICPixelFormat64bppPBGRA (Windows 8 and later)</li>
     * <li>GUID_WICPixelFormat64bppPRGBA (Windows 8 and later)</li>
     * <li>GUID_WICPixelFormat64bppRGBA 		 (Windows 8 and later)</li>
     * </ul>
     * In order to get correct behavior from a color transform, the input and output pixel formats must be compatible with the source and destination color profiles. For example, an sRGB destination color profile will produce incorrect results when used with a CMYK destination pixel format.
     * @param {IWICBitmapSource} pIBitmapSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The bitmap source used to initialize the color transform.
     * @param {IWICColorContext} pIContextSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>*</b>
     * 
     * The color context source.
     * @param {IWICColorContext} pIContextDest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>*</b>
     * 
     * The color context destination.
     * @param {Pointer<Guid>} pixelFmtDest Type: <b>REFWICPixelFormatGUID</b>
     * 
     * The GUID of the desired pixel format.
     * 
     * This parameter is limited to a subset of the native WIC pixel formats, see Remarks for a list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwiccolortransform-initialize
     */
    Initialize(pIBitmapSource, pIContextSource, pIContextDest, pixelFmtDest) {
        result := ComCall(8, this, "ptr", pIBitmapSource, "ptr", pIContextSource, "ptr", pIContextDest, Guid.Ptr, pixelFmtDest, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICColorTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
