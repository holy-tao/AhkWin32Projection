#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectAdvertisement2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectAdvertisement2
     * @type {Guid}
     */
    static IID => Guid("{b759aa46-d816-491b-917a-b40d7dc403a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedConfigurationMethods"]

    /**
     * @type {IVector<Integer>} 
     */
    SupportedConfigurationMethods {
        get => this.get_SupportedConfigurationMethods()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_SupportedConfigurationMethods() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
