#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a collection of IAzTask objects.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iaztasks
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzTasks extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzTasks
     * @type {Guid}
     */
    static IID => Guid("{b338ccab-4c85-4388-8c0a-c58592bad398}")

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
     * 
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztasks-get_item
     */
    get_Item(Index) {
        pvarObtPtr := VARIANT()
        result := ComCall(7, this, "int", Index, "ptr", pvarObtPtr, "HRESULT")
        return pvarObtPtr
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztasks-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztasks-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnumPtr := 0, "HRESULT")
        return IUnknown(ppEnumPtr)
    }
}
