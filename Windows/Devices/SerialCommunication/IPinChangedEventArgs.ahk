#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class IPinChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPinChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a2bf1db0-fc9c-4607-93d0-fa5e8343ee22}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PinChange"]

    /**
     * @type {Integer} 
     */
    PinChange {
        get => this.get_PinChange()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PinChange() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
