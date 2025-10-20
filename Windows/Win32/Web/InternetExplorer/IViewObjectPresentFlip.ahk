#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IViewObjectPresentFlip extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewObjectPresentFlip
     * @type {Guid}
     */
    static IID => Guid("{30510847-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyRender", "RenderObjectToBitmap", "RenderObjectToSharedBuffer"]

    /**
     * 
     * @param {BOOL} fRecreatePresenter 
     * @returns {HRESULT} 
     */
    NotifyRender(fRecreatePresenter) {
        result := ComCall(3, this, "int", fRecreatePresenter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pBitmap 
     * @returns {HRESULT} 
     */
    RenderObjectToBitmap(pBitmap) {
        result := ComCall(4, this, "ptr", pBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISurfacePresenterFlipBuffer} pBuffer 
     * @returns {HRESULT} 
     */
    RenderObjectToSharedBuffer(pBuffer) {
        result := ComCall(5, this, "ptr", pBuffer, "HRESULT")
        return result
    }
}
