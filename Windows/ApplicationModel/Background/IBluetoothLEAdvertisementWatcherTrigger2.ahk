#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementWatcherTrigger2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementWatcherTrigger2
     * @type {Guid}
     */
    static IID => Guid("{39b56799-eb39-5ab6-9932-aa9e4549604d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowExtendedAdvertisements", "put_AllowExtendedAdvertisements"]

    /**
     * @type {Boolean} 
     */
    AllowExtendedAdvertisements {
        get => this.get_AllowExtendedAdvertisements()
        set => this.put_AllowExtendedAdvertisements(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowExtendedAdvertisements() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowExtendedAdvertisements(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
