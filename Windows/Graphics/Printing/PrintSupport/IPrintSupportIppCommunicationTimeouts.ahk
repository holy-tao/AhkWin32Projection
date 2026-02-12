#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportIppCommunicationTimeouts extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportIppCommunicationTimeouts
     * @type {Guid}
     */
    static IID => Guid("{a3b2de71-564c-5806-a1a9-c6043ca5d373}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConnectTimeout", "put_ConnectTimeout", "get_SendTimeout", "put_SendTimeout", "get_ReceiveTimeout", "put_ReceiveTimeout"]

    /**
     * @type {TimeSpan} 
     */
    ConnectTimeout {
        get => this.get_ConnectTimeout()
        set => this.put_ConnectTimeout(value)
    }

    /**
     * @type {TimeSpan} 
     */
    SendTimeout {
        get => this.get_SendTimeout()
        set => this.put_SendTimeout(value)
    }

    /**
     * @type {TimeSpan} 
     */
    ReceiveTimeout {
        get => this.get_ReceiveTimeout()
        set => this.put_ReceiveTimeout(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ConnectTimeout() {
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
    put_ConnectTimeout(value) {
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
    get_SendTimeout() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_SendTimeout(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ReceiveTimeout() {
        value := TimeSpan()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_ReceiveTimeout(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
