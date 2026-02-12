#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\HttpRequestMessage.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\HttpDiagnosticSourceLocation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IHttpDiagnosticProviderRequestSentEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpDiagnosticProviderRequestSentEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3f5196d0-4c1f-4ebe-a57a-06930771c50d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Timestamp", "get_ActivityId", "get_Message", "get_ProcessId", "get_ThreadId", "get_Initiator", "get_SourceLocations"]

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
     * @type {HttpRequestMessage} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * @type {Integer} 
     */
    ProcessId {
        get => this.get_ProcessId()
    }

    /**
     * @type {Integer} 
     */
    ThreadId {
        get => this.get_ThreadId()
    }

    /**
     * @type {Integer} 
     */
    Initiator {
        get => this.get_Initiator()
    }

    /**
     * @type {IVectorView<HttpDiagnosticSourceLocation>} 
     */
    SourceLocations {
        get => this.get_SourceLocations()
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
     * @returns {HttpRequestMessage} 
     */
    get_Message() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpRequestMessage(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessId() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ThreadId() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Initiator() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HttpDiagnosticSourceLocation>} 
     */
    get_SourceLocations() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HttpDiagnosticSourceLocation, value)
    }
}
