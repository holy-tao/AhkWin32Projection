#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a collection of IAzScope objects.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazscopes
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzScopes extends IDispatch{
    /**
     * The interface identifier for IAzScopes
     * @type {Guid}
     */
    static IID => Guid("{78e14853-9f5e-406d-9b91-6bdba6973510}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT>} pvarObtPtr 
     * @returns {HRESULT} 
     */
    get_Item(Index, pvarObtPtr) {
        result := ComCall(7, this, "int", Index, "ptr", pvarObtPtr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(8, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnumPtr 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppEnumPtr) {
        result := ComCall(9, this, "ptr", ppEnumPtr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
