#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandCellCdma extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandCellCdma
     * @type {Guid}
     */
    static IID => Guid("{0601b3b4-411a-4f2e-8287-76f5650c60cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BaseStationId", "get_BaseStationPNCode", "get_BaseStationLatitude", "get_BaseStationLongitude", "get_BaseStationLastBroadcastGpsTime", "get_NetworkId", "get_PilotSignalStrengthInDB", "get_SystemId"]

    /**
     * @type {IReference<Integer>} 
     */
    BaseStationId {
        get => this.get_BaseStationId()
    }

    /**
     * @type {IReference<Integer>} 
     */
    BaseStationPNCode {
        get => this.get_BaseStationPNCode()
    }

    /**
     * @type {IReference<Float>} 
     */
    BaseStationLatitude {
        get => this.get_BaseStationLatitude()
    }

    /**
     * @type {IReference<Float>} 
     */
    BaseStationLongitude {
        get => this.get_BaseStationLongitude()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    BaseStationLastBroadcastGpsTime {
        get => this.get_BaseStationLastBroadcastGpsTime()
    }

    /**
     * @type {IReference<Integer>} 
     */
    NetworkId {
        get => this.get_NetworkId()
    }

    /**
     * @type {IReference<Float>} 
     */
    PilotSignalStrengthInDB {
        get => this.get_PilotSignalStrengthInDB()
    }

    /**
     * @type {IReference<Integer>} 
     */
    SystemId {
        get => this.get_SystemId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_BaseStationId() {
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
    get_BaseStationPNCode() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_BaseStationLatitude() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_BaseStationLongitude() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_BaseStationLastBroadcastGpsTime() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_NetworkId() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_PilotSignalStrengthInDB() {
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
    get_SystemId() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
