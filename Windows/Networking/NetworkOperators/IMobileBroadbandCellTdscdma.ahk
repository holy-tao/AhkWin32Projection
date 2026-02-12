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
class IMobileBroadbandCellTdscdma extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandCellTdscdma
     * @type {Guid}
     */
    static IID => Guid("{0eda1655-db0e-4182-8cda-cc419a7bde08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CellId", "get_CellParameterId", "get_ChannelNumber", "get_LocationAreaCode", "get_PathLossInDB", "get_ProviderId", "get_ReceivedSignalCodePowerInDBm", "get_TimingAdvanceInBitPeriods"]

    /**
     * @type {IReference<Integer>} 
     */
    CellId {
        get => this.get_CellId()
    }

    /**
     * @type {IReference<Integer>} 
     */
    CellParameterId {
        get => this.get_CellParameterId()
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
    LocationAreaCode {
        get => this.get_LocationAreaCode()
    }

    /**
     * @type {IReference<Float>} 
     */
    PathLossInDB {
        get => this.get_PathLossInDB()
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
    ReceivedSignalCodePowerInDBm {
        get => this.get_ReceivedSignalCodePowerInDBm()
    }

    /**
     * @type {IReference<Integer>} 
     */
    TimingAdvanceInBitPeriods {
        get => this.get_TimingAdvanceInBitPeriods()
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
    get_CellParameterId() {
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
    get_ChannelNumber() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_LocationAreaCode() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_PathLossInDB() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ReceivedSignalCodePowerInDBm() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
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
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
