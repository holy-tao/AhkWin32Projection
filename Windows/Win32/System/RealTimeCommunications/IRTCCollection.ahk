#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCCollection extends IDispatch{
    /**
     * The interface identifier for IRTCCollection
     * @type {Guid}
     */
    static IID => Guid("{ec7c8096-b918-4044-94f1-e4fba0361d5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} lCount 
     * @returns {HRESULT} 
     */
    get_Count(lCount) {
        result := ComCall(7, this, "int*", lCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_Item(Index, pVariant) {
        result := ComCall(8, this, "int", Index, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppNewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppNewEnum) {
        result := ComCall(9, this, "ptr", ppNewEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
