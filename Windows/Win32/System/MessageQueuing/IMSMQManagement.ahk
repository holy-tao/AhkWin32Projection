#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQManagement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQManagement
     * @type {Guid}
     */
    static IID => Guid("{be5f0241-e489-4957-8cc4-a452fcf3e23e}")

    /**
     * The class identifier for MSMQManagement
     * @type {Guid}
     */
    static CLSID => Guid("{39ce96fe-f4c5-4484-a143-4c2d5d324229}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "get_FormatName", "get_Machine", "get_MessageCount", "get_ForeignStatus", "get_QueueType", "get_IsLocal", "get_TransactionalStatus", "get_BytesInQueue"]

    /**
     * 
     * @param {Pointer<VARIANT>} Machine 
     * @param {Pointer<VARIANT>} Pathname 
     * @param {Pointer<VARIANT>} FormatName 
     * @returns {HRESULT} 
     */
    Init(Machine, Pathname, FormatName) {
        result := ComCall(7, this, "ptr", Machine, "ptr", Pathname, "ptr", FormatName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FormatName() {
        pbstrFormatName := BSTR()
        result := ComCall(8, this, "ptr", pbstrFormatName, "HRESULT")
        return pbstrFormatName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Machine() {
        pbstrMachine := BSTR()
        result := ComCall(9, this, "ptr", pbstrMachine, "HRESULT")
        return pbstrMachine
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageCount() {
        result := ComCall(10, this, "int*", &plMessageCount := 0, "HRESULT")
        return plMessageCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ForeignStatus() {
        result := ComCall(11, this, "int*", &plForeignStatus := 0, "HRESULT")
        return plForeignStatus
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QueueType() {
        result := ComCall(12, this, "int*", &plQueueType := 0, "HRESULT")
        return plQueueType
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsLocal() {
        result := ComCall(13, this, "short*", &pfIsLocal := 0, "HRESULT")
        return pfIsLocal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransactionalStatus() {
        result := ComCall(14, this, "int*", &plTransactionalStatus := 0, "HRESULT")
        return plTransactionalStatus
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_BytesInQueue() {
        pvBytesInQueue := VARIANT()
        result := ComCall(15, this, "ptr", pvBytesInQueue, "HRESULT")
        return pvBytesInQueue
    }
}
