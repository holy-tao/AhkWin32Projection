#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a collection of IAzRoleAssignment objects.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazroleassignments
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzRoleAssignments extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzRoleAssignments
     * @type {Guid}
     */
    static IID => Guid("{9c80b900-fceb-4d73-a0f4-c83b0bbf2481}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Item", "get_Count", "get__NewEnum"]

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT>} pvarObtPtr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroleassignments-get_item
     */
    get_Item(Index, pvarObtPtr) {
        result := ComCall(7, this, "int", Index, "ptr", pvarObtPtr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroleassignments-get_count
     */
    get_Count(plCount) {
        result := ComCall(8, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnumPtr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroleassignments-get__newenum
     */
    get__NewEnum(ppEnumPtr) {
        result := ComCall(9, this, "ptr*", ppEnumPtr, "HRESULT")
        return result
    }
}
