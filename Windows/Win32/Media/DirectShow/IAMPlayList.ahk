#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMPlayList extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetFlags(pdwFlags) {
        result := ComCall(3, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwItems 
     * @returns {HRESULT} 
     */
    GetItemCount(pdwItems) {
        result := ComCall(4, this, "uint*", pdwItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwItemIndex 
     * @param {Pointer<IAMPlayListItem>} ppItem 
     * @returns {HRESULT} 
     */
    GetItem(dwItemIndex, ppItem) {
        result := ComCall(5, this, "uint", dwItemIndex, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszEventName 
     * @param {Integer} dwItemIndex 
     * @param {Pointer<IAMPlayListItem>} ppItem 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetNamedEvent(pwszEventName, dwItemIndex, ppItem, pdwFlags) {
        pwszEventName := pwszEventName is String ? StrPtr(pwszEventName) : pwszEventName

        result := ComCall(6, this, "ptr", pwszEventName, "uint", dwItemIndex, "ptr", ppItem, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwRepeatCount 
     * @param {Pointer<UInt32>} pdwRepeatStart 
     * @param {Pointer<UInt32>} pdwRepeatEnd 
     * @returns {HRESULT} 
     */
    GetRepeatInfo(pdwRepeatCount, pdwRepeatStart, pdwRepeatEnd) {
        result := ComCall(7, this, "uint*", pdwRepeatCount, "uint*", pdwRepeatStart, "uint*", pdwRepeatEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
