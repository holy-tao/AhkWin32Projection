#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves the IAzRoleAssignment object at the specified index in the IAzRoleAssignments collection.
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazroleassignments-get_item
     */
    get_Item(Index) {
        pvarObtPtr := VARIANT()
        result := ComCall(7, this, "int", Index, "ptr", pvarObtPtr, "HRESULT")
        return pvarObtPtr
    }

    /**
     * Retrieves the number of IAzRoleAssignments objects in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazroleassignments-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * Retrieves an IEnumVARIANT interface on an object that can be used to enumerate the IAzRoleAssignments collection. This property is hidden within Visual Basic and Visual Basic Scripting Edition (VBScript).
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazroleassignments-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnumPtr := 0, "HRESULT")
        return IUnknown(ppEnumPtr)
    }
}
