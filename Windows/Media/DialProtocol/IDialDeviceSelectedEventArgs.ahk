#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DialDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class IDialDeviceSelectedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDialDeviceSelectedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{480b92ad-ac76-47eb-9c06-a19304da0247}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedDialDevice"]

    /**
     * @type {DialDevice} 
     */
    SelectedDialDevice {
        get => this.get_SelectedDialDevice()
    }

    /**
     * 
     * @returns {DialDevice} 
     */
    get_SelectedDialDevice() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DialDevice(value)
    }
}
