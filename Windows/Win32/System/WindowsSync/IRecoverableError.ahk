#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a recoverable error that occurred when an item was loaded or when an item was saved.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-irecoverableerror
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IRecoverableError extends IUnknown{
    /**
     * The interface identifier for IRecoverableError
     * @type {Guid}
     */
    static IID => Guid("{0f5625e8-0a7b-45ee-9637-1ce13645909e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pStage 
     * @returns {HRESULT} 
     */
    GetStage(pStage) {
        result := ComCall(3, this, "int*", pStage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pProviderRole 
     * @returns {HRESULT} 
     */
    GetProvider(pProviderRole) {
        result := ComCall(4, this, "int*", pProviderRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChange>} ppChangeWithRecoverableError 
     * @returns {HRESULT} 
     */
    GetChangeWithRecoverableError(ppChangeWithRecoverableError) {
        result := ComCall(5, this, "ptr", ppChangeWithRecoverableError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrError 
     * @param {Pointer<IRecoverableErrorData>} ppErrorData 
     * @returns {HRESULT} 
     */
    GetRecoverableErrorDataForChange(phrError, ppErrorData) {
        result := ComCall(6, this, "ptr", phrError, "ptr", ppErrorData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChangeUnit>} pChangeUnit 
     * @param {Pointer<HRESULT>} phrError 
     * @param {Pointer<IRecoverableErrorData>} ppErrorData 
     * @returns {HRESULT} 
     */
    GetRecoverableErrorDataForChangeUnit(pChangeUnit, phrError, ppErrorData) {
        result := ComCall(7, this, "ptr", pChangeUnit, "ptr", phrError, "ptr", ppErrorData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
