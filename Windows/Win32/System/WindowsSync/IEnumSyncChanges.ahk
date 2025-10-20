#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates a list of item changes.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumsyncchanges
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumSyncChanges extends IUnknown{
    /**
     * The interface identifier for IEnumSyncChanges
     * @type {Guid}
     */
    static IID => Guid("{5f86be4a-5e78-4e32-ac1c-c24fd223ef85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cChanges 
     * @param {Pointer<ISyncChange>} ppChange 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cChanges, ppChange, pcFetched) {
        result := ComCall(3, this, "uint", cChanges, "ptr", ppChange, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cChanges 
     * @returns {HRESULT} 
     */
    Skip(cChanges) {
        result := ComCall(4, this, "uint", cChanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSyncChanges>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
