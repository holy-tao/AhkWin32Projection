#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides socket control data on an [IWebSocket](iwebsocket.md) object. This interface extends the [IWebSocketControl](iwebsocketcontrol.md) interface with an additional property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketcontrol2
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IWebSocketControl2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebSocketControl2
     * @type {Guid}
     */
    static IID => Guid("{79c3be03-f2ca-461e-af4e-9665bc2d0620}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IgnorableServerCertificateErrors"]

    /**
     * Gets a list of ignorable server certificate errors. Get this list and add [ChainValidationResult](../windows.security.cryptography.certificates/chainvalidationresult.md) values for server certificate errors that you wish to ignore during the secure WebSocket (**wss:///* protocol) server certificate validation process.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketcontrol2.ignorableservercertificateerrors
     * @type {IVector<Integer>} 
     */
    IgnorableServerCertificateErrors {
        get => this.get_IgnorableServerCertificateErrors()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_IgnorableServerCertificateErrors() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
