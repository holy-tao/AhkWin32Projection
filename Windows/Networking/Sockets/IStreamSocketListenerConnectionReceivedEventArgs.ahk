#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StreamSocket.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamSocketListenerConnectionReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSocketListenerConnectionReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{0c472ea9-373f-447b-85b1-ddd4548803ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Socket"]

    /**
     * @type {StreamSocket} 
     */
    Socket {
        get => this.get_Socket()
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
}
