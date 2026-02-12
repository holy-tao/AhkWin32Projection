#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RfcommServiceId.ahk
#Include ..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class IRfcommServiceProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommServiceProvider
     * @type {Guid}
     */
    static IID => Guid("{eadbfdc4-b1f6-44ff-9f7c-e7a82ab86821}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServiceId", "get_SdpRawAttributes", "StartAdvertising", "StopAdvertising"]

    /**
     * @type {RfcommServiceId} 
     */
    ServiceId {
        get => this.get_ServiceId()
    }

    /**
     * @type {IMap<Integer, IBuffer>} 
     */
    SdpRawAttributes {
        get => this.get_SdpRawAttributes()
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_ServiceId() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(value)
    }

    /**
     * 
     * @returns {IMap<Integer, IBuffer>} 
     */
    get_SdpRawAttributes() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => IPropertyValue(ptr).GetUInt32(), IBuffer, value)
    }

    /**
     * 
     * @param {StreamSocketListener} listener 
     * @returns {HRESULT} 
     */
    StartAdvertising(listener) {
        result := ComCall(8, this, "ptr", listener, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopAdvertising() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
