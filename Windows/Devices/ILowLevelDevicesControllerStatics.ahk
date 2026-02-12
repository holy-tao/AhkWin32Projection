#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\ILowLevelDevicesAggregateProvider.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices
 * @version WindowsRuntime 1.4
 */
class ILowLevelDevicesControllerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILowLevelDevicesControllerStatics
     * @type {Guid}
     */
    static IID => Guid("{093e926a-fccb-4394-a697-19de637c2db3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultProvider", "put_DefaultProvider"]

    /**
     * @type {ILowLevelDevicesAggregateProvider} 
     */
    DefaultProvider {
        get => this.get_DefaultProvider()
        set => this.put_DefaultProvider(value)
    }

    /**
     * 
     * @returns {ILowLevelDevicesAggregateProvider} 
     */
    get_DefaultProvider() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ILowLevelDevicesAggregateProvider(value)
    }

    /**
     * 
     * @param {ILowLevelDevicesAggregateProvider} value 
     * @returns {HRESULT} 
     */
    put_DefaultProvider(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
