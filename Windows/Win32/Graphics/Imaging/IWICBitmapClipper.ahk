#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WICRect.ahk" { WICRect }
#Import ".\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes methods that produce a clipped version of the input bitmap for a specified rectangular region of interest.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapclipper
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapClipper extends IWICBitmapSource {
    /**
     * The interface identifier for IWICBitmapClipper
     * @type {Guid}
     */
    static IID := Guid("{e4fbcf03-223d-4e81-9333-d635556dd1b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapClipper interfaces
    */
    struct Vtbl extends IWICBitmapSource.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapClipper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the bitmap clipper with the provided parameters.
     * @param {IWICBitmapSource} pISource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * he input bitmap source.
     * @param {Pointer<WICRect>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrect">WICRect</a>*</b>
     * 
     * The rectangle of the bitmap source to clip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapclipper-initialize
     */
    Initialize(pISource, prc) {
        result := ComCall(8, this, "ptr", pISource, WICRect.Ptr, prc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICBitmapClipper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
