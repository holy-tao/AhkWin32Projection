#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DataPlanUsage.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IDataPlanStatus extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPlanStatus
     * @type {Guid}
     */
    static IID => Guid("{977a8b8c-3885-40f3-8851-42cd2bd568bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataPlanUsage", "get_DataLimitInMegabytes", "get_InboundBitsPerSecond", "get_OutboundBitsPerSecond", "get_NextBillingCycle", "get_MaxTransferSizeInMegabytes"]

    /**
     * @type {DataPlanUsage} 
     */
    DataPlanUsage {
        get => this.get_DataPlanUsage()
    }

    /**
     * @type {IReference<Integer>} 
     */
    DataLimitInMegabytes {
        get => this.get_DataLimitInMegabytes()
    }

    /**
     * @type {IReference<Integer>} 
     */
    InboundBitsPerSecond {
        get => this.get_InboundBitsPerSecond()
    }

    /**
     * @type {IReference<Integer>} 
     */
    OutboundBitsPerSecond {
        get => this.get_OutboundBitsPerSecond()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    NextBillingCycle {
        get => this.get_NextBillingCycle()
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxTransferSizeInMegabytes {
        get => this.get_MaxTransferSizeInMegabytes()
    }

    /**
     * 
     * @returns {DataPlanUsage} 
     */
    get_DataPlanUsage() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPlanUsage(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DataLimitInMegabytes() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_InboundBitsPerSecond() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt64(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_OutboundBitsPerSecond() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt64(), value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_NextBillingCycle() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxTransferSizeInMegabytes() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }
}
