#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MobileBroadbandUicc.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandModemConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandModemConfiguration
     * @type {Guid}
     */
    static IID => Guid("{fce035a3-d6cd-4320-b982-be9d3ec7890f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uicc", "get_HomeProviderId", "get_HomeProviderName"]

    /**
     * @type {MobileBroadbandUicc} 
     */
    Uicc {
        get => this.get_Uicc()
    }

    /**
     * @type {HSTRING} 
     */
    HomeProviderId {
        get => this.get_HomeProviderId()
    }

    /**
     * @type {HSTRING} 
     */
    HomeProviderName {
        get => this.get_HomeProviderName()
    }

    /**
     * 
     * @returns {MobileBroadbandUicc} 
     */
    get_Uicc() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandUicc(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HomeProviderId() {
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
    get_HomeProviderName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
