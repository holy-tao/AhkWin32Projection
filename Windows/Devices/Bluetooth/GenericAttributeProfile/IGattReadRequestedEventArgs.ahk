#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GattSession.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GattReadRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattReadRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattReadRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{93497243-f39c-484b-8ab6-996ba486cfa3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "GetDeferral", "GetRequestAsync"]

    /**
     * @type {GattSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * 
     * @returns {GattSession} 
     */
    get_Session() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattSession(value)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<GattReadRequest>} 
     */
    GetRequestAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattReadRequest, operation)
    }
}
