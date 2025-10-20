#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a collection of IAzApplicationGroup objects.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazapplicationgroups
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzApplicationGroups extends IDispatch{
    /**
     * The interface identifier for IAzApplicationGroups
     * @type {Guid}
     */
    static IID => Guid("{4ce66ad5-9f3c-469d-a911-b99887a7e685}")

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
