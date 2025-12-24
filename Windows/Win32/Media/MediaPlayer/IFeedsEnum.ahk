#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Ole\IEnumVARIANT.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedsEnum extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedsEnum
     * @type {Guid}
     */
    static IID => Guid("{e3cd0028-2eed-4c60-8fae-a3225309a836}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Item", "get__NewEnum"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IDispatch} 
     */
    Item(index) {
        result := ComCall(8, this, "int", index, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &enumVar := 0, "HRESULT")
        return IEnumVARIANT(enumVar)
    }
}
