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
     * The get_Name method gets the ACD group name. This string can be a displayable name for the group.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of group name.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itacdgroup-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(7, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * The EnumerateQueues method enumerates queues currently on the ACD group. This method is provided for C and C++ applications. Automation client applications, such as those written in Visual Basic, must use the get_Queues method.
     * @returns {IEnumQueue} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumqueue">IEnumQueue</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itacdgroup-enumeratequeues
     */
    EnumerateQueues() {
        result := ComCall(8, this, "ptr*", &ppEnumQueue := 0, "HRESULT")
        return IEnumQueue(ppEnumQueue)
    }

    /**
     * The get_Queues method creates a collection of queues associated with the current ACD group. This method is provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateQueues method.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3cc/nn-tapi3cc-itqueue">ITQueue</a> interface pointers (queue objects).
     * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nf-tapi3cc-itacdgroup-get_queues
     */
    get_Queues() {
        pVariant := VARIANT()
        result := ComCall(9, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
