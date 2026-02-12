#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneLineConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneLineConfiguration
     * @type {Guid}
     */
    static IID => Guid("{fe265862-f64f-4312-b2a8-4e257721aa95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsVideoCallingEnabled", "get_ExtendedProperties"]

    /**
     * @type {Boolean} 
     */
    IsVideoCallingEnabled {
        get => this.get_IsVideoCallingEnabled()
    }

    /**
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVideoCallingEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_ExtendedProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, value)
    }
}
