#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITsSbLoadBalanceResult.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\ITsSbEnvironment.ahk
#Include .\ITsSbClientConnectionPropertySet.ahk
#Include .\ITsSbSession.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods and properties that store state information about an incoming connection request from a Remote Desktop Connection (RDC) client.
 * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nn-sbtsv-itssbclientconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbClientConnection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbClientConnection
     * @type {Guid}
     */
    static IID => Guid("{18857499-ad61-4b1b-b7df-cbcd41fb8338}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserName", "get_Domain", "get_InitialProgram", "get_LoadBalanceResult", "get_FarmName", "PutContext", "GetContext", "get_Environment", "get_ConnectionError", "get_SamUserAccount", "get_ClientConnectionPropertySet", "get_IsFirstAssignment", "get_RdFarmType", "get_UserSidString", "GetDisconnectedSession"]

    /**
     * @type {BSTR} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * @type {BSTR} 
     */
    Domain {
        get => this.get_Domain()
    }

    /**
     * @type {BSTR} 
     */
    InitialProgram {
        get => this.get_InitialProgram()
    }

    /**
     * @type {ITsSbLoadBalanceResult} 
     */
    LoadBalanceResult {
        get => this.get_LoadBalanceResult()
    }

    /**
     * @type {BSTR} 
     */
    FarmName {
        get => this.get_FarmName()
    }

    /**
     * @type {ITsSbEnvironment} 
     */
    Environment {
        get => this.get_Environment()
    }

    /**
     * @type {BSTR} 
     */
    SamUserAccount {
        get => this.get_SamUserAccount()
    }

    /**
     * @type {ITsSbClientConnectionPropertySet} 
     */
    ClientConnectionPropertySet {
        get => this.get_ClientConnectionPropertySet()
    }

    /**
     * @type {BOOL} 
     */
    IsFirstAssignment {
        get => this.get_IsFirstAssignment()
    }

    /**
     * @type {Integer} 
     */
    RdFarmType {
        get => this.get_RdFarmType()
    }

    /**
     * @type {Pointer<Integer>} 
     */
    UserSidString {
        get => this.get_UserSidString()
    }

    /**
     * Retrieves a value that indicates the name of the user who initiated the connection.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_username
     */
    get_UserName() {
        pVal := BSTR()
        result := ComCall(3, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves a value that indicates the domain name of the Remote Desktop Connection (RDC) client.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_domain
     */
    get_Domain() {
        pVal := BSTR()
        result := ComCall(4, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves a value that indicates the program that is launched when the user logs on to the target computer.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_initialprogram
     */
    get_InitialProgram() {
        pVal := BSTR()
        result := ComCall(5, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves a value that indicates the name of the target computer returned by load balancing.
     * @remarks
     * This method can be called by placement and orchestration plug-ins to retrieve the target name.
     * @returns {ITsSbLoadBalanceResult} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_loadbalanceresult
     */
    get_LoadBalanceResult() {
        result := ComCall(6, this, "ptr*", &ppVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbLoadBalanceResult(ppVal)
    }

    /**
     * Farm name.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_farmname
     */
    get_FarmName() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Can be used by plug-ins to store context information specific to the connection.
     * @remarks
     * Plug-ins can use the client connection object to store context information that is specific to a connection request. This allows plug-ins to remain stateless and rely exclusively on state information stored by connection requests. Plug-ins that use this method can also register for connection request notifications. Contexts can be deleted upon receipt of CONNECTION_REQUEST_FAILED, CONNECTION_REQUEST_TIMEDOUT, or CONNECTION_REQUEST_SUCCEEDED notifications. These notifications indicate that the connection request is about to be deleted.
     * @param {BSTR} contextId A <b>BSTR</b> variable that contains the context ID. We recommend using unique identifiers as context IDs to avoid collisions between plug-ins. A client connection object can be used by more than one plug-in.
     * @param {VARIANT} context_ The context information to store.
     * @returns {VARIANT} Existing context information for the supplied context ID, if any, is returned in this parameter. The existing information is overwritten.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-putcontext
     */
    PutContext(contextId, context_) {
        if(contextId is String) {
            pin := BSTR.Alloc(contextId)
            contextId := pin.Value
        }

        existingContext := VARIANT()
        result := ComCall(8, this, "ptr", contextId, "ptr", context_, "ptr", existingContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return existingContext
    }

    /**
     * Retrieves context information that was stored by a plug-in by using the PutContext method.
     * @param {BSTR} contextId A <b>BSTR</b> variable that contains the context ID.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-getcontext
     */
    GetContext(contextId) {
        if(contextId is String) {
            pin := BSTR.Alloc(contextId)
            contextId := pin.Value
        }

        context_ := VARIANT()
        result := ComCall(9, this, "ptr", contextId, "ptr", context_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return context_
    }

    /**
     * Retrieves an object that contains information about the environment that hosts the target computer.
     * @remarks
     * An orchestration plug-in can call this method to retrieve environment information about a target virtual machine.
     * @returns {ITsSbEnvironment} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_environment
     */
    get_Environment() {
        result := ComCall(10, this, "ptr*", &ppEnvironment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbEnvironment(ppEnvironment)
    }

    /**
     * Retrieves a value that indicates the error that occurred while a client connection was being processed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_connectionerror
     */
    get_ConnectionError() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a value that indicates the domain name and user name of the user who initiated the connection.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_samuseraccount
     */
    get_SamUserAccount() {
        pVal := BSTR()
        result := ComCall(12, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves an object that contains properties associated with the client connection.
     * @remarks
     * Plug-ins can use this interface to store custom properties for the lifetime of a connection request.
     * 
     * 
     * By default, Remote Desktop Connection Broker (RD Connection Broker) sets the following properties for the property set object.
     * @returns {ITsSbClientConnectionPropertySet} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_clientconnectionpropertyset
     */
    get_ClientConnectionPropertySet() {
        result := ComCall(13, this, "ptr*", &ppPropertySet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbClientConnectionPropertySet(ppPropertySet)
    }

    /**
     * Whether this is the first assignment.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_isfirstassignment
     */
    get_IsFirstAssignment() {
        result := ComCall(14, this, "int*", &ppVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVal
    }

    /**
     * Rd Farm Type.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_rdfarmtype
     */
    get_RdFarmType() {
        result := ComCall(15, this, "int*", &pRdFarmType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRdFarmType
    }

    /**
     * User SID as a string.
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-get_usersidstring
     */
    get_UserSidString() {
        result := ComCall(16, this, "ptr*", &pszUserSidString := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pszUserSidString
    }

    /**
     * Gets a disconnected session.
     * @returns {ITsSbSession} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbclientconnection-getdisconnectedsession
     */
    GetDisconnectedSession() {
        result := ComCall(17, this, "ptr*", &ppSession := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbSession(ppSession)
    }
}
