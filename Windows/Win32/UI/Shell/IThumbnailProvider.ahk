#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method for getting a thumbnail image and is intended to be implemented for thumbnail handlers. The object that implements this interface must also implement IInitializeWithStream.
 * @remarks
 * 
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
  * 
 * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nn-thumbcache-ithumbnailprovider
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IThumbnailProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThumbnailProvider
     * @type {Guid}
     */
    static IID => Guid("{e357fccd-a995-4576-b01f-234630154e96}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThumbnail"]

    /**
     * 
     * @param {Integer} cx 
     * @param {Pointer<HBITMAP>} phbmp 
     * @param {Pointer<Integer>} pdwAlpha 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-ithumbnailprovider-getthumbnail
     */
    GetThumbnail(cx, phbmp, pdwAlpha) {
        pdwAlphaMarshal := pdwAlpha is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", cx, "ptr", phbmp, pdwAlphaMarshal, pdwAlpha, "HRESULT")
        return result
    }
}
