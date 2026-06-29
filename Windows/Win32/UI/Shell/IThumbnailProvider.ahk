#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WTS_ALPHATYPE.ahk" { WTS_ALPHATYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method for getting a thumbnail image and is intended to be implemented for thumbnail handlers. The object that implements this interface must also implement IInitializeWithStream.
 * @remarks
 * The Shell calls <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailprovider-getthumbnail">IThumbnailProvider::GetThumbnail</a> to obtain an image to use as a representation of the item.
 * 
 * An implementation of this interface for photo thumbnails is supplied in Microsoft Windows as CLSID_PhotoThumbnailProvider. Applications that use the supplied implementation must define a constant CLSID identifier using the GUID {C7657C4A-9F68-40fa-A4DF-96BC08EB3551}.
 * 				
 * 
 * 
 * ```
 * // {C7657C4A-9F68-40fa-A4DF-96BC08EB3551}
 * const CLSID CLSID_PhotoThumbnailProvider = {0xC7657C4A, 0x9F68, 0x40fa, {0xA4, 0xDF, 0x96, 0xBC, 0x08, 0xEB, 0x35, 0x51}} ;
 * ```
 * 
 * 
 * <b>Initializing</b> The object that implements this interface must also implement <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-iinitializewithstream">IInitializeWithStream</a>. The Shell calls <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-iinitializewithstream-initialize">IInitializeWithStream::Initialize</a> with the stream of the item, and  <b>IInitializeWithStream</b> is the only initialization interface used when IThumbnailProvider instances are loaded out-of-proc (for isolation purposes).  This is the primary code path for Windows  for all IThumbnailCache code paths.
 * 
 * It is possible for a thumbnail implementation to be initialized with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iinitializewithitem">IInitializeWithItem</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-iinitializewithfile">IInitializeWithFile</a> when the handler is request by a 3rd party without using the IThumbnailCache API, but this is uncommon.  If you implement <b>IInitializeWithItem</b>, the Shell calls <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iinitializewithitem-initialize">IInitializeWithItem::Initialize</a> with the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> representation of the item. If you implement <b>IInitializeWithFile</b>, the Shell calls <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-iinitializewithfile-initialize">IInitializeWithFile::Initialize</a> with the path of the file.
 * 
 * If none of these interfaces is present, <b>IThumbnailProvider</b> is not called.
 * 
 * <b>Client apps</b> If you're developing a client app, you should use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemimagefactory">IShellItemImageFactory</a> instead. 
 * 
 * <b>Windows Vista</b> IThumbnailProivder is new for Vista and replaces <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iextractimage">IExtractImage</a>. Vista still supports IExtractImage but lacks the ability to return the image type (alpha or not).
 * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nn-thumbcache-ithumbnailprovider
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IThumbnailProvider extends IUnknown {
    /**
     * The interface identifier for IThumbnailProvider
     * @type {Guid}
     */
    static IID := Guid("{e357fccd-a995-4576-b01f-234630154e96}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IThumbnailProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetThumbnail : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IThumbnailProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a thumbnail image and alpha type.
     * @param {Integer} cx Type: <b>UINT</b>
     * 
     * The maximum thumbnail size, in pixels. The Shell draws the returned bitmap at this size or smaller. The returned bitmap should fit into a square of width and height <i>cx</i>, though it does not need to be a square image. The Shell  scales the bitmap to render at lower sizes. For example, if the image has a 6:4 aspect ratio, then the returned bitmap should also have a 6:4 aspect ratio.
     * @param {Pointer<HBITMAP>} phbmp Type: <b>HBITMAP*</b>
     * 
     * When this method returns, contains a pointer to the thumbnail image handle. The image must be a DIB section and 32 bits per pixel. The Shell scales down the bitmap if its width or height is larger than the size specified by <i>cx</i>. The Shell always respects the aspect ratio and never scales a bitmap larger than its original size.
     * @param {Pointer<WTS_ALPHATYPE>} pdwAlpha Type: <b>WTS_ALPHATYPE*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-ithumbnailprovider-getthumbnail
     */
    GetThumbnail(cx, phbmp, pdwAlpha) {
        pdwAlphaMarshal := pdwAlpha is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", cx, HBITMAP.Ptr, phbmp, pdwAlphaMarshal, pdwAlpha, "HRESULT")
        return result
    }

    Query(iid) {
        if (IThumbnailProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetThumbnail := CallbackCreate(GetMethod(implObj, "GetThumbnail"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetThumbnail)
    }
}
