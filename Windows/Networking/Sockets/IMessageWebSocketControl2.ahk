#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Security\Cryptography\Certificates\Certificate.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IMessageWebSocketControl2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMessageWebSocketControl2
     * @type {Guid}
     */
    static IID => Guid("{e30fd791-080c-400a-a712-27dfa9e744d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesiredUnsolicitedPongInterval", "put_DesiredUnsolicitedPongInterval", "get_ActualUnsolicitedPongInterval", "get_ReceiveMode", "put_ReceiveMode", "get_ClientCertificate", "put_ClientCertificate"]

    /**
     * @type {TimeSpan} 
     */
    DesiredUnsolicitedPongInterval {
        get => this.get_DesiredUnsolicitedPongInterval()
        set => this.put_DesiredUnsolicitedPongInterval(value)
    }

    /**
     * @type {TimeSpan} 
     */
    ActualUnsolicitedPongInterval {
        get => this.get_ActualUnsolicitedPongInterval()
    }

    /**
     * @type {Integer} 
     */
    ReceiveMode {
        get => this.get_ReceiveMode()
        set => this.put_ReceiveMode(value)
    }

    /**
     * @type {Certificate} 
     */
    ClientCertificate {
        get => this.get_ClientCertificate()
        set => this.put_ClientCertificate(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DesiredUnsolicitedPongInterval() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DesiredUnsolicitedPongInterval(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ActualUnsolicitedPongInterval() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReceiveMode() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReceiveMode(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ClientCertificate() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Certificate(value)
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_ClientCertificate(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
