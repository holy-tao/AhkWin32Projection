#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDevicePickerFilter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePickerFilter
     * @type {Guid}
     */
    static IID => Guid("{91db92a2-57cb-48f1-9b59-a59b7a1f02a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedDeviceClasses", "get_SupportedDeviceSelectors"]

    /**
     * @type {IVector<Integer>} 
     */
    SupportedDeviceClasses {
        get => this.get_SupportedDeviceClasses()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    SupportedDeviceSelectors {
        get => this.get_SupportedDeviceSelectors()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_SupportedDeviceClasses() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SupportedDeviceSelectors() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
