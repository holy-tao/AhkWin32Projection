#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISurfacePresenter.ahk
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
     * @param {Integer} mode_ 
     * @returns {ISurfacePresenter} 
     */
    CreateSurfacePresenter(pDevice, width, height, backBufferCount, format, mode_) {
        result := ComCall(3, this, "ptr", pDevice, "uint", width, "uint", height, "uint", backBufferCount, "int", format, "int", mode_, "ptr*", &ppQueue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISurfacePresenter(ppQueue)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsHardwareComposition() {
        result := ComCall(4, this, "int*", &pIsHardwareComposition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsHardwareComposition
    }

    /**
     * 
     * @param {Integer} mode_ 
     * @returns {HRESULT} 
     */
    SetCompositionMode(mode_) {
        result := ComCall(5, this, "int", mode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
