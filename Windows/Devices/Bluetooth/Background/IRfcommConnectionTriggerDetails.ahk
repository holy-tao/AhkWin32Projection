#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Networking\Sockets\StreamSocket.ahk
#Include ..\BluetoothDevice.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class IRfcommConnectionTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommConnectionTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{f922734d-2e3c-4efc-ab59-fc5cf96f97e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Socket", "get_Incoming", "get_RemoteDevice"]

    /**
     * @type {StreamSocket} 
     */
    Socket {
        get => this.get_Socket()
    }

    /**
     * @type {Boolean} 
     */
    Incoming {
        get => this.get_Incoming()
    }

    /**
     * @type {BluetoothDevice} 
     */
    RemoteDevice {
        get => this.get_RemoteDevice()
    }

    /**
     * 
     * @returns {StreamSocket} 
     */
    get_Socket() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamSocket(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Incoming() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {BluetoothDevice} 
     */
    get_RemoteDevice() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothDevice(value)
    }
}
