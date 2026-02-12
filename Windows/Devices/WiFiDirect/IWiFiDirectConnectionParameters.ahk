#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectConnectionParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectConnectionParameters
     * @type {Guid}
     */
    static IID => Guid("{b2e55405-5702-4b16-a02c-bbcd21ef6098}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GroupOwnerIntent", "put_GroupOwnerIntent"]

    /**
     * @type {Integer} 
     */
    GroupOwnerIntent {
        get => this.get_GroupOwnerIntent()
        set => this.put_GroupOwnerIntent(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GroupOwnerIntent() {
        result := ComCall(6, this, "short*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GroupOwnerIntent(value) {
        result := ComCall(7, this, "short", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
