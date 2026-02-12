#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandCellLte extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandCellLte
     * @type {Guid}
     */
    static IID => Guid("{9197c87b-2b78-456d-8b53-aaa25d0af741}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CellId", "get_ChannelNumber", "get_PhysicalCellId", "get_ProviderId", "get_ReferenceSignalReceivedPowerInDBm", "get_ReferenceSignalReceivedQualityInDBm", "get_TimingAdvanceInBitPeriods", "get_TrackingAreaCode"]

    /**
     * @type {IReference<Integer>} 
     */
    CellId {
        get => this.get_CellId()
    }

    /**
     * @type {IReference<Integer>} 
     */
    ChannelNumber {
        get => this.get_ChannelNumber()
    }

    /**
     * @type {IReference<Integer>} 
     */
    PhysicalCellId {
        get => this.get_PhysicalCellId()
    }

    /**
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * @type {IReference<Float>} 
     */
    ReferenceSignalReceivedPowerInDBm {
        get => this.get_ReferenceSignalReceivedPowerInDBm()
    }

    /**
     * @type {IReference<Float>} 
     */
    ReferenceSignalReceivedQualityInDBm {
        get => this.get_ReferenceSignalReceivedQualityInDBm()
    }

    /**
     * @type {IReference<Integer>} 
     */
    TimingAdvanceInBitPeriods {
        get => this.get_TimingAdvanceInBitPeriods()
    }

    /**
     * @type {IReference<Integer>} 
     */
    TrackingAreaCode {
        get => this.get_TrackingAreaCode()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CellId() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ChannelNumber() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PhysicalCellId() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ReferenceSignalReceivedPowerInDBm() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ReferenceSignalReceivedQualityInDBm() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TimingAdvanceInBitPeriods() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TrackingAreaCode() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
