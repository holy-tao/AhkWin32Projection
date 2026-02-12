#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MiracastReceiverConnection.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class IMiracastReceiverConnectionCreatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMiracastReceiverConnectionCreatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{7d8dfa39-307a-5c0f-94bd-d0c69d169982}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Connection", "get_Pin", "GetDeferral"]

    /**
     * @type {MiracastReceiverConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * @type {HSTRING} 
     */
    Pin {
        get => this.get_Pin()
    }

    /**
     * 
     * @returns {MiracastReceiverConnection} 
     */
    get_Connection() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverConnection(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Pin() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
