#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\RfcommDeviceService.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class IRfcommDeviceServicesResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommDeviceServicesResult
     * @type {Guid}
     */
    static IID => Guid("{3b48388c-7ccf-488e-9625-d259a5732d55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Error", "get_Services"]

    /**
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * @type {IVectorView<RfcommDeviceService>} 
     */
    Services {
        get => this.get_Services()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<RfcommDeviceService>} 
     */
    get_Services() {
        result := ComCall(7, this, "ptr*", &services := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(RfcommDeviceService, services)
    }
}
