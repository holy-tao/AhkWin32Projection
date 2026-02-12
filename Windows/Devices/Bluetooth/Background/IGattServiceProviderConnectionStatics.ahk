#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\GattServiceProviderConnection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class IGattServiceProviderConnectionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattServiceProviderConnectionStatics
     * @type {Guid}
     */
    static IID => Guid("{3d509f4b-0b0e-4466-b8cd-6ebdda1fa17d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllServices"]

    /**
     * @type {IMapView<HSTRING, GattServiceProviderConnection>} 
     */
    AllServices {
        get => this.get_AllServices()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, GattServiceProviderConnection>} 
     */
    get_AllServices() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), GattServiceProviderConnection, value)
    }
}
