#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IViewObjectPresentSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewObjectPresentSite
     * @type {Guid}
     */
    static IID => Guid("{305106e1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSurfacePresenter", "IsHardwareComposition", "SetCompositionMode"]

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} backBufferCount 
     * @param {Integer} format 
     * @param {Integer} mode 
     * @param {Pointer<ISurfacePresenter>} ppQueue 
     * @returns {HRESULT} 
     */
    CreateSurfacePresenter(pDevice, width, height, backBufferCount, format, mode, ppQueue) {
        result := ComCall(3, this, "ptr", pDevice, "uint", width, "uint", height, "uint", backBufferCount, "int", format, "int", mode, "ptr*", ppQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsHardwareComposition 
     * @returns {HRESULT} 
     */
    IsHardwareComposition(pIsHardwareComposition) {
        result := ComCall(4, this, "ptr", pIsHardwareComposition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    SetCompositionMode(mode) {
        result := ComCall(5, this, "int", mode, "HRESULT")
        return result
    }
}
