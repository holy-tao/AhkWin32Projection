#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IWwanConnectionProfileDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWwanConnectionProfileDetails
     * @type {Guid}
     */
    static IID => Guid("{0e4da8fe-835f-4df3-82fd-df556ebc09ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HomeProviderId", "get_AccessPointName", "GetNetworkRegistrationState", "GetCurrentDataClass"]

    /**
     * @type {HSTRING} 
     */
    HomeProviderId {
        get => this.get_HomeProviderId()
    }

    /**
     * @type {HSTRING} 
     */
    AccessPointName {
        get => this.get_AccessPointName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HomeProviderId() {
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
    get_AccessPointName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNetworkRegistrationState() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentDataClass() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
