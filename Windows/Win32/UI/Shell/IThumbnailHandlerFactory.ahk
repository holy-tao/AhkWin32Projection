#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method for retrieving the thumbnail handler of an item. Implement this interface if you want to specify what extractor is used for a child IDList.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ithumbnailhandlerfactory
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IThumbnailHandlerFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThumbnailHandlerFactory
     * @type {Guid}
     */
    static IID => Guid("{e35b4b2e-00da-4bc1-9f13-38bc11f5d417}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThumbnailHandler"]

    /**
     * Gets the requested thumbnail handler for the thumbnail of a given item.
     * @param {Pointer<ITEMIDLIST>} pidlChild Type: <b>PCUITEMID_CHILD</b>
     * 
     * The item within the namespace for which the thumbnail handler is being retrieved.
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> to be used during the moniker binding operation of this process.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface requested. This is usually <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-ithumbnailprovider">IThumbnailProvider</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iextractimage">IExtractImage</a>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to the requested thumbnail handler. If this method fails, this value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ithumbnailhandlerfactory-getthumbnailhandler
     */
    GetThumbnailHandler(pidlChild, pbc, riid) {
        result := ComCall(3, this, "ptr", pidlChild, "ptr", pbc, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
