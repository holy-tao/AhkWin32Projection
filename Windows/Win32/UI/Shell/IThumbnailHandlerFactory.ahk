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
     * 
     * @param {Pointer<ITEMIDLIST>} pidlChild 
     * @param {Pointer<IBindCtx>} pbc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetThumbnailHandler(pidlChild, pbc, riid, ppv) {
        result := ComCall(3, this, "ptr", pidlChild, "ptr", pbc, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
