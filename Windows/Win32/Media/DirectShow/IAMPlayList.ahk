#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMPlayList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMPlayList
     * @type {Guid}
     */
    static IID => Guid("{56a868fe-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFlags", "GetItemCount", "GetItem", "GetNamedEvent", "GetRepeatInfo"]

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetFlags(pdwFlags) {
        result := ComCall(3, this, "uint*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwItems 
     * @returns {HRESULT} 
     */
    GetItemCount(pdwItems) {
        result := ComCall(4, this, "uint*", pdwItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwItemIndex 
     * @param {Pointer<IAMPlayListItem>} ppItem 
     * @returns {HRESULT} 
     */
    GetItem(dwItemIndex, ppItem) {
        result := ComCall(5, this, "uint", dwItemIndex, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszEventName 
     * @param {Integer} dwItemIndex 
     * @param {Pointer<IAMPlayListItem>} ppItem 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetNamedEvent(pwszEventName, dwItemIndex, ppItem, pdwFlags) {
        pwszEventName := pwszEventName is String ? StrPtr(pwszEventName) : pwszEventName

        result := ComCall(6, this, "ptr", pwszEventName, "uint", dwItemIndex, "ptr*", ppItem, "uint*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRepeatCount 
     * @param {Pointer<Integer>} pdwRepeatStart 
     * @param {Pointer<Integer>} pdwRepeatEnd 
     * @returns {HRESULT} 
     */
    GetRepeatInfo(pdwRepeatCount, pdwRepeatStart, pdwRepeatEnd) {
        result := ComCall(7, this, "uint*", pdwRepeatCount, "uint*", pdwRepeatStart, "uint*", pdwRepeatEnd, "HRESULT")
        return result
    }
}
