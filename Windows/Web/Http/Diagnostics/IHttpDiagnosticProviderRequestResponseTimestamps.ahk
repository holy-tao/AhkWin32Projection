#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IHttpDiagnosticProviderRequestResponseTimestamps extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpDiagnosticProviderRequestResponseTimestamps
     * @type {Guid}
     */
    static IID => Guid("{e0afde10-55cf-4c01-91d4-a20557d849f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CacheCheckedTimestamp", "get_ConnectionInitiatedTimestamp", "get_NameResolvedTimestamp", "get_SslNegotiatedTimestamp", "get_ConnectionCompletedTimestamp", "get_RequestSentTimestamp", "get_RequestCompletedTimestamp", "get_ResponseReceivedTimestamp", "get_ResponseCompletedTimestamp"]

    /**
     * @type {IReference<DateTime>} 
     */
    CacheCheckedTimestamp {
        get => this.get_CacheCheckedTimestamp()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    ConnectionInitiatedTimestamp {
        get => this.get_ConnectionInitiatedTimestamp()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    NameResolvedTimestamp {
        get => this.get_NameResolvedTimestamp()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    SslNegotiatedTimestamp {
        get => this.get_SslNegotiatedTimestamp()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    ConnectionCompletedTimestamp {
        get => this.get_ConnectionCompletedTimestamp()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    RequestSentTimestamp {
        get => this.get_RequestSentTimestamp()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    RequestCompletedTimestamp {
        get => this.get_RequestCompletedTimestamp()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    ResponseReceivedTimestamp {
        get => this.get_ResponseReceivedTimestamp()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    ResponseCompletedTimestamp {
        get => this.get_ResponseCompletedTimestamp()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_CacheCheckedTimestamp() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ConnectionInitiatedTimestamp() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_NameResolvedTimestamp() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_SslNegotiatedTimestamp() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ConnectionCompletedTimestamp() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_RequestSentTimestamp() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_RequestCompletedTimestamp() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ResponseReceivedTimestamp() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ResponseCompletedTimestamp() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }
}
