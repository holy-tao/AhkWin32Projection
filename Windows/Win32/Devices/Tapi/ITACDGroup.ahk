#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumQueue.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Automatic Call Distribution (ACD) is a mechanism that queues and distributes calls within a switching system.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itacdgroup
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITACDGroup extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "EnumerateQueues", "get_Queues"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {VARIANT} 
     */
    Queues {
        get => this.get_Queues()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itacdgroup-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(7, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * 
     * @returns {IEnumQueue} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itacdgroup-enumeratequeues
     */
    EnumerateQueues() {
        result := ComCall(8, this, "ptr*", &ppEnumQueue := 0, "HRESULT")
        return IEnumQueue(ppEnumQueue)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itacdgroup-get_queues
     */
    get_Queues() {
        pVariant := VARIANT()
        result := ComCall(9, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
