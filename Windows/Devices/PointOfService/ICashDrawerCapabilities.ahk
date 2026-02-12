#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ICashDrawerCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICashDrawerCapabilities
     * @type {Guid}
     */
    static IID => Guid("{0bc6de0b-e8e7-4b1f-b1d1-3e501ad08247}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PowerReportingType", "get_IsStatisticsReportingSupported", "get_IsStatisticsUpdatingSupported", "get_IsStatusReportingSupported", "get_IsStatusMultiDrawerDetectSupported", "get_IsDrawerOpenSensorAvailable"]

    /**
     * @type {Integer} 
     */
    PowerReportingType {
        get => this.get_PowerReportingType()
    }

    /**
     * @type {Boolean} 
     */
    IsStatisticsReportingSupported {
        get => this.get_IsStatisticsReportingSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsStatisticsUpdatingSupported {
        get => this.get_IsStatisticsUpdatingSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsStatusReportingSupported {
        get => this.get_IsStatusReportingSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsStatusMultiDrawerDetectSupported {
        get => this.get_IsStatusMultiDrawerDetectSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsDrawerOpenSensorAvailable {
        get => this.get_IsDrawerOpenSensorAvailable()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PowerReportingType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsReportingSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsUpdatingSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatusReportingSupported() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatusMultiDrawerDetectSupported() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDrawerOpenSensorAvailable() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
