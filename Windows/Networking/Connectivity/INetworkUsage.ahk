#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class INetworkUsage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkUsage
     * @type {Guid}
     */
    static IID => Guid("{49da8fce-9985-4927-bf5b-072b5c65f8d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BytesSent", "get_BytesReceived", "get_ConnectionDuration"]

    /**
     * @type {Integer} 
     */
    BytesSent {
        get => this.get_BytesSent()
    }

    /**
     * @type {Integer} 
     */
    BytesReceived {
        get => this.get_BytesReceived()
    }

    /**
     * @type {TimeSpan} 
     */
    ConnectionDuration {
        get => this.get_ConnectionDuration()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesSent() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesReceived() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ConnectionDuration() {
        duration_ := TimeSpan()
        result := ComCall(8, this, "ptr", duration_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return duration_
    }
}
