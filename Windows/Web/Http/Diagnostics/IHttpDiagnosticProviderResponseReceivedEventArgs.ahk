#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\HttpResponseMessage.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IHttpDiagnosticProviderResponseReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpDiagnosticProviderResponseReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a0a2566c-ab5f-4d66-bb2d-084cf41635d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Timestamp", "get_ActivityId", "get_Message"]

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * @type {HttpResponseMessage} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ActivityId() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_Message() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpResponseMessage(value)
    }
}
