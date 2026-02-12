#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Rfcomm\RfcommServiceId.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class IRfcommOutboundConnectionInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommOutboundConnectionInformation
     * @type {Guid}
     */
    static IID => Guid("{b091227b-f434-4cb0-99b1-4ab8cedaedd7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RemoteServiceId", "put_RemoteServiceId"]

    /**
     * @type {RfcommServiceId} 
     */
    RemoteServiceId {
        get => this.get_RemoteServiceId()
        set => this.put_RemoteServiceId(value)
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_RemoteServiceId() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(value)
    }

    /**
     * 
     * @param {RfcommServiceId} value 
     * @returns {HRESULT} 
     */
    put_RemoteServiceId(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
