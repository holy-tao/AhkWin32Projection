#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UsbSetupPacket.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbSetupPacketFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbSetupPacketFactory
     * @type {Guid}
     */
    static IID => Guid("{c9257d50-1b2e-4a41-a2a7-338f0cef3c14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithEightByteBuffer"]

    /**
     * 
     * @param {IBuffer} eightByteBuffer 
     * @returns {UsbSetupPacket} 
     */
    CreateWithEightByteBuffer(eightByteBuffer) {
        result := ComCall(6, this, "ptr", eightByteBuffer, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbSetupPacket(value)
    }
}
