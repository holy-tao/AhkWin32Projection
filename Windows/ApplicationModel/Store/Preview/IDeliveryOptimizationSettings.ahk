#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class IDeliveryOptimizationSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeliveryOptimizationSettings
     * @type {Guid}
     */
    static IID => Guid("{1810fda0-e853-565e-b874-7a8a7b9a0e0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DownloadMode", "get_DownloadModeSource"]

    /**
     * @type {Integer} 
     */
    DownloadMode {
        get => this.get_DownloadMode()
    }

    /**
     * @type {Integer} 
     */
    DownloadModeSource {
        get => this.get_DownloadModeSource()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadModeSource() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
