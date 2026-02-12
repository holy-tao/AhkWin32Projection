#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IBarcodeScanner2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScanner2
     * @type {Guid}
     */
    static IID => Guid("{89215167-8cee-436d-89ab-8dfb43bb4286}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoDeviceId"]

    /**
     * @type {HSTRING} 
     */
    VideoDeviceId {
        get => this.get_VideoDeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VideoDeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
