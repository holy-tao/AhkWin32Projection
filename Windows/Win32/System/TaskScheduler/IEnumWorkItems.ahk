#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods for enumerating the tasks in the Scheduled Tasks folder.
 * @see https://docs.microsoft.com/windows/win32/api//mstask/nn-mstask-ienumworkitems
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IEnumWorkItems extends IUnknown{
    /**
     * The interface identifier for IEnumWorkItems
     * @type {Guid}
     */
    static IID => Guid("{148bd528-a2ab-11ce-b11f-00aa00530503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<PWSTR>} rgpwszNames 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, rgpwszNames, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", rgpwszNames, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
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
     * @param {Pointer<IEnumWorkItems>} ppEnumWorkItems 
     * @returns {HRESULT} 
     */
    Clone(ppEnumWorkItems) {
        result := ComCall(6, this, "ptr", ppEnumWorkItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
