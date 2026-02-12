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
class IMobileBroadbandCellUmts extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandCellUmts
     * @type {Guid}
     */
    static IID => Guid("{77b4b5ae-49c8-4f15-b285-4c26a7f67215}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CellId", "get_ChannelNumber", "get_LocationAreaCode", "get_PathLossInDB", "get_PrimaryScramblingCode", "get_ProviderId", "get_ReceivedSignalCodePowerInDBm", "get_SignalToNoiseRatioInDB"]

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
     * @type {IReference<Integer>} 
     */
    PrimaryScramblingCode {
        get => this.get_PrimaryScramblingCode()
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
    get_LocationAreaCode() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PrimaryScramblingCode() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
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
     * @returns {IReference<Float>} 
     */
    get_SignalToNoiseRatioInDB() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }
}
