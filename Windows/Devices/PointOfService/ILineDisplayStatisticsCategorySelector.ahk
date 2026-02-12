#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ILineDisplayStatisticsCategorySelector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineDisplayStatisticsCategorySelector
     * @type {Guid}
     */
    static IID => Guid("{b521c46b-9274-4d24-94f3-b6017b832444}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllStatistics", "get_UnifiedPosStatistics", "get_ManufacturerStatistics"]

    /**
     * @type {HSTRING} 
     */
    AllStatistics {
        get => this.get_AllStatistics()
    }

    /**
     * @type {HSTRING} 
     */
    UnifiedPosStatistics {
        get => this.get_UnifiedPosStatistics()
    }

    /**
     * @type {HSTRING} 
     */
    ManufacturerStatistics {
        get => this.get_ManufacturerStatistics()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AllStatistics() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnifiedPosStatistics() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ManufacturerStatistics() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
