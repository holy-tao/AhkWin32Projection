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
class IMobileBroadbandCellNR extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandCellNR
     * @type {Guid}
     */
    static IID => Guid("{a13f0deb-66fc-4b4b-83a9-a487a3a5a0a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CellId", "get_ChannelNumber", "get_PhysicalCellId", "get_ProviderId", "get_ReferenceSignalReceivedPowerInDBm", "get_ReferenceSignalReceivedQualityInDBm", "get_TimingAdvanceInNanoseconds", "get_TrackingAreaCode", "get_SignalToNoiseRatioInDB"]

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
    TimingAdvanceInNanoseconds {
        get => this.get_TimingAdvanceInNanoseconds()
    }

    /**
     * @type {IReference<Integer>} 
     */
    TrackingAreaCode {
        get => this.get_TrackingAreaCode()
    }

    /**
     * @type {IReference<Float>} 
     */
    SignalToNoiseRatioInDB {
        get => this.get_SignalToNoiseRatioInDB()
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

        return IReference((ptr) => IPropertyValue(ptr).GetInt64(), value)
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
    get_TimingAdvanceInNanoseconds() {
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

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_SignalToNoiseRatioInDB() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }
}
