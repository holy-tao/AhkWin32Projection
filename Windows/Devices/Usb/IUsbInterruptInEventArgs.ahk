#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbInterruptInEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbInterruptInEventArgs
     * @type {Guid}
     */
    static IID => Guid("{b7b04092-1418-4936-8209-299cf5605583}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InterruptData"]

    /**
     * @type {IBuffer} 
     */
    InterruptData {
        get => this.get_InterruptData()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_InterruptData() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
