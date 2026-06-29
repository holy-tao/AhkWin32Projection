#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that recompress images.
 * @remarks
 * Implement <b>IImageRecompress</b> if you are implementing
 * 			an image object that may need recompressing. The
 * 			<b>IImageRecompress</b> interface is implemented in the
 * 			<a href="https://docs.microsoft.com/windows/desktop/shell/known-folders">ImageRecompress</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iimagerecompress
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IImageRecompress extends IUnknown {
    /**
     * The interface identifier for IImageRecompress
     * @type {Guid}
     */
    static IID := Guid("{505f1513-6b3e-4892-a272-59f8889a4d3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImageRecompress interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RecompressImage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImageRecompress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Recompresses an image. Implemented in an ImageRecompress object, this method accepts x and y dimensions with a designation of quality. The method creates a stream containing the new image that has been recompressed to the specified size.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the object containing the stream of the image to read.
     * @param {Integer} cx Type: <b>int</b>
     * 
     * The x dimension of the image to return.
     * @param {Integer} _cy Type: <b>int</b>
     * 
     * The y dimension of the image to return.
     * @param {Integer} iQuality Type: <b>int</b>
     * 
     * An indication of recompression quality that can range from 0 to 100.
     * @param {IStorage} pstg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the
     * 				object that contains the stream to be written to.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface pointer
     * 				variable that receives the output stream written to.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iimagerecompress-recompressimage
     */
    RecompressImage(psi, cx, _cy, iQuality, pstg) {
        result := ComCall(3, this, "ptr", psi, "int", cx, "int", _cy, "int", iQuality, "ptr", pstg, "ptr*", &ppstrmOut := 0, "HRESULT")
        return IStream(ppstrmOut)
    }

    Query(iid) {
        if (IImageRecompress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RecompressImage := CallbackCreate(GetMethod(implObj, "RecompressImage"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RecompressImage)
    }
}
