#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\MobileBroadbandPin.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandPinManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandPinManager
     * @type {Guid}
     */
    static IID => Guid("{83567edd-6e1f-4b9b-a413-2b1f50cc36df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedPins", "GetPin"]

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedPins {
        get => this.get_SupportedPins()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedPins() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {Integer} pinType 
     * @returns {MobileBroadbandPin} 
     */
    GetPin(pinType) {
        result := ComCall(7, this, "int", pinType, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandPin(value)
    }
}
