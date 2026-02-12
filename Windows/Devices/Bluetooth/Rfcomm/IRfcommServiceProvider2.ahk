#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class IRfcommServiceProvider2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommServiceProvider2
     * @type {Guid}
     */
    static IID => Guid("{736bdfc6-3c81-4d1e-baf2-ddbb81284512}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartAdvertisingWithRadioDiscoverability"]

    /**
     * 
     * @param {StreamSocketListener} listener 
     * @param {Boolean} radioDiscoverable 
     * @returns {HRESULT} 
     */
    StartAdvertisingWithRadioDiscoverability(listener, radioDiscoverable) {
        result := ComCall(6, this, "ptr", listener, "int", radioDiscoverable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
