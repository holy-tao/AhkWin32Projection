#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInputPanelWindowHandle extends IUnknown{
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
     * 
     * @param {Pointer<Int32>} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    get_AttachedEditWindow32(AttachedEditWindow) {
        result := ComCall(3, this, "int*", AttachedEditWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    put_AttachedEditWindow32(AttachedEditWindow) {
        result := ComCall(4, this, "int", AttachedEditWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    get_AttachedEditWindow64(AttachedEditWindow) {
        result := ComCall(5, this, "int64*", AttachedEditWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    put_AttachedEditWindow64(AttachedEditWindow) {
        result := ComCall(6, this, "int64", AttachedEditWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
