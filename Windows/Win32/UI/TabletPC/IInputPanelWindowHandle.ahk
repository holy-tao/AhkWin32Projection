#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInputPanelWindowHandle extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputPanelWindowHandle
     * @type {Guid}
     */
    static IID => Guid("{4af81847-fdc4-4fc3-ad0b-422479c1b935}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AttachedEditWindow32", "put_AttachedEditWindow32", "get_AttachedEditWindow64", "put_AttachedEditWindow64"]

    /**
     * 
     * @returns {Integer} 
     */
    get_AttachedEditWindow32() {
        result := ComCall(3, this, "int*", &AttachedEditWindow := 0, "HRESULT")
        return AttachedEditWindow
    }

    /**
     * 
     * @param {Integer} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    put_AttachedEditWindow32(AttachedEditWindow) {
        result := ComCall(4, this, "int", AttachedEditWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttachedEditWindow64() {
        result := ComCall(5, this, "int64*", &AttachedEditWindow := 0, "HRESULT")
        return AttachedEditWindow
    }

    /**
     * 
     * @param {Integer} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    put_AttachedEditWindow64(AttachedEditWindow) {
        result := ComCall(6, this, "int64", AttachedEditWindow, "HRESULT")
        return result
    }
}
