#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<BSTR>} pbstrFormatName 
     * @returns {HRESULT} 
     */
    get_FormatName(pbstrFormatName) {
        result := ComCall(8, this, "ptr", pbstrFormatName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMachine 
     * @returns {HRESULT} 
     */
    get_Machine(pbstrMachine) {
        result := ComCall(9, this, "ptr", pbstrMachine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMessageCount 
     * @returns {HRESULT} 
     */
    get_MessageCount(plMessageCount) {
        result := ComCall(10, this, "int*", plMessageCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plForeignStatus 
     * @returns {HRESULT} 
     */
    get_ForeignStatus(plForeignStatus) {
        result := ComCall(11, this, "int*", plForeignStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plQueueType 
     * @returns {HRESULT} 
     */
    get_QueueType(plQueueType) {
        result := ComCall(12, this, "int*", plQueueType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfIsLocal 
     * @returns {HRESULT} 
     */
    get_IsLocal(pfIsLocal) {
        result := ComCall(13, this, "ptr", pfIsLocal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plTransactionalStatus 
     * @returns {HRESULT} 
     */
    get_TransactionalStatus(plTransactionalStatus) {
        result := ComCall(14, this, "int*", plTransactionalStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvBytesInQueue 
     * @returns {HRESULT} 
     */
    get_BytesInQueue(pvBytesInQueue) {
        result := ComCall(15, this, "ptr", pvBytesInQueue, "HRESULT")
        return result
    }
}
