#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeolocatorStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeolocatorStatics2
     * @type {Guid}
     */
    static IID => Guid("{993011a2-fa1c-4631-a71d-0dbeb1250d9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsDefaultGeopositionRecommended", "put_DefaultGeoposition", "get_DefaultGeoposition"]

    /**
     * @type {Boolean} 
     */
    IsDefaultGeopositionRecommended {
        get => this.get_IsDefaultGeopositionRecommended()
    }

    /**
     * @type {IReference<BasicGeoposition>} 
     */
    DefaultGeoposition {
        get => this.get_DefaultGeoposition()
        set => this.put_DefaultGeoposition(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDefaultGeopositionRecommended() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IReference<BasicGeoposition>} value 
     * @returns {HRESULT} 
     */
    put_DefaultGeoposition(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<BasicGeoposition>} 
     */
    get_DefaultGeoposition() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetBasicGeoposition(), value)
    }
}
