#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents information about a change to be loaded from the item store.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-iloadchangecontext
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ILoadChangeContext extends IUnknown{
    /**
     * The interface identifier for ILoadChangeContext
     * @type {Guid}
     */
    static IID => Guid("{44a4aaca-ec39-46d5-b5c9-d633c0ee67e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISyncChange>} ppSyncChange 
     * @returns {HRESULT} 
     */
    GetSyncChange(ppSyncChange) {
        result := ComCall(3, this, "ptr", ppSyncChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {Pointer<IRecoverableErrorData>} pErrorData 
     * @returns {HRESULT} 
     */
    SetRecoverableErrorOnChange(hrError, pErrorData) {
        result := ComCall(4, this, "int", hrError, "ptr", pErrorData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {Pointer<ISyncChangeUnit>} pChangeUnit 
     * @param {Pointer<IRecoverableErrorData>} pErrorData 
     * @returns {HRESULT} 
     */
    SetRecoverableErrorOnChangeUnit(hrError, pChangeUnit, pErrorData) {
        result := ComCall(5, this, "int", hrError, "ptr", pChangeUnit, "ptr", pErrorData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
