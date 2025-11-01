#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

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
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     */
    get_Count(count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    Item(index, disp) {
        result := ComCall(8, this, "int", index, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} enumVar 
     * @returns {HRESULT} 
     */
    get__NewEnum(enumVar) {
        result := ComCall(9, this, "ptr*", enumVar, "HRESULT")
        return result
    }
}
