#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Automatic Call Distribution (ACD) is a mechanism that queues and distributes calls within a switching system.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itacdgroup
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITACDGroup extends IDispatch{
    /**
     * The interface identifier for ITACDGroup
     * @type {Guid}
     */
    static IID => Guid("{5afc3148-4bcc-11d1-bf80-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     */
    get_Name(ppName) {
        result := ComCall(7, this, "ptr", ppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumQueue>} ppEnumQueue 
     * @returns {HRESULT} 
     */
    EnumerateQueues(ppEnumQueue) {
        result := ComCall(8, this, "ptr", ppEnumQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_Queues(pVariant) {
        result := ComCall(9, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
