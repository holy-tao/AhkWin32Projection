#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DialDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class IDialDisconnectButtonClickedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDialDisconnectButtonClickedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{52765152-9c81-4e55-adc2-0ebe99cde3b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Device"]

    /**
     * @type {DialDevice} 
     */
    Device {
        get => this.get_Device()
    }

    /**
     * 
     * @returns {DialDevice} 
     */
    get_Device() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DialDevice(value)
    }
}
