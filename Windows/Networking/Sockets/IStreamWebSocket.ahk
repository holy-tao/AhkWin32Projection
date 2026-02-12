#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StreamWebSocketControl.ahk
#Include .\StreamWebSocketInformation.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamWebSocket extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamWebSocket
     * @type {Guid}
     */
    static IID => Guid("{bd4a49d8-b289-45bb-97eb-c7525205a843}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Control", "get_Information", "get_InputStream"]

    /**
     * @type {StreamWebSocketControl} 
     */
    Control {
        get => this.get_Control()
    }

    /**
     * @type {StreamWebSocketInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
    }

    /**
     * 
     * @returns {StreamWebSocketControl} 
     */
    get_Control() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamWebSocketControl(value)
    }

    /**
     * 
     * @returns {StreamWebSocketInformation} 
     */
    get_Information() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamWebSocketInformation(value)
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(value)
    }
}
