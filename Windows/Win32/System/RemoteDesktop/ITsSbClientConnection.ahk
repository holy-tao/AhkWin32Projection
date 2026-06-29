#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RD_FARM_TYPE.ahk" { RD_FARM_TYPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITsSbClientConnectionPropertySet.ahk" { ITsSbClientConnectionPropertySet }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ITsSbSession.ahk" { ITsSbSession }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ITsSbEnvironment.ahk" { ITsSbEnvironment }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITsSbLoadBalanceResult.ahk" { ITsSbLoadBalanceResult }

/**
 * Exposes methods and properties that store state information about an incoming connection request from a Remote Desktop Connection (RDC) client.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbclientconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbClientConnection extends IUnknown {
    /**
     * The interface identifier for ITsSbClientConnection
     * @type {Guid}
     */
    static IID := Guid("{18857499-ad61-4b1b-b7df-cbcd41fb8338}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbClientConnection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_UserName                    : IntPtr
        get_Domain                      : IntPtr
        get_InitialProgram              : IntPtr
        get_LoadBalanceResult           : IntPtr
        get_FarmName                    : IntPtr
        PutContext                      : IntPtr
        GetContext                      : IntPtr
        get_Environment                 : IntPtr
        get_ConnectionError             : IntPtr
        get_SamUserAccount              : IntPtr
        get_ClientConnectionPropertySet : IntPtr
        get_IsFirstAssignment           : IntPtr
        get_RdFarmType                  : IntPtr
        get_UserSidString               : IntPtr
        GetDisconnectedSession          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbClientConnection.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {RD_FARM_TYPE} 
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
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_username
     */
    get_UserName() {
        pVal := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves a value that indicates the domain name of the Remote Desktop Connection (RDC) client.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_domain
     */
    get_Domain() {
        pVal := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves a value that indicates the program that is launched when the user logs on to the target computer.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_initialprogram
     */
    get_InitialProgram() {
        pVal := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves a value that indicates the name of the target computer returned by load balancing.
     * @remarks
     * This method can be called by placement and orchestration plug-ins to retrieve the target name.
     * @returns {ITsSbLoadBalanceResult} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_loadbalanceresult
     */
    get_LoadBalanceResult() {
        result := ComCall(6, this, "ptr*", &ppVal := 0, "HRESULT")
        return ITsSbLoadBalanceResult(ppVal)
    }

    /**
     * Farm name.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_farmname
     */
    get_FarmName() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Can be used by plug-ins to store context information specific to the connection.
     * @remarks
     * Plug-ins can use the client connection object to store context information that is specific to a connection request. This allows plug-ins to remain stateless and rely exclusively on state information stored by connection requests. Plug-ins that use this method can also register for connection request notifications. Contexts can be deleted upon receipt of CONNECTION_REQUEST_FAILED, CONNECTION_REQUEST_TIMEDOUT, or CONNECTION_REQUEST_SUCCEEDED notifications. These notifications indicate that the connection request is about to be deleted.
     * @param {BSTR} contextId A <b>BSTR</b> variable that contains the context ID. We recommend using unique identifiers as context IDs to avoid collisions between plug-ins. A client connection object can be used by more than one plug-in.
     * @param {VARIANT} _context The context information to store.
     * @returns {VARIANT} Existing context information for the supplied context ID, if any, is returned in this parameter. The existing information is overwritten.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-putcontext
     */
    PutContext(contextId, _context) {
        contextId := contextId is String ? BSTR.Alloc(contextId).Value : contextId

        existingContext := VARIANT()
        result := ComCall(8, this, BSTR, contextId, VARIANT, _context, VARIANT.Ptr, existingContext, "HRESULT")
        return existingContext
    }

    /**
     * Retrieves context information that was stored by a plug-in by using the PutContext method.
     * @param {BSTR} contextId A <b>BSTR</b> variable that contains the context ID.
     * @returns {VARIANT} A pointer to the context information.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-getcontext
     */
    GetContext(contextId) {
        contextId := contextId is String ? BSTR.Alloc(contextId).Value : contextId

        _context := VARIANT()
        result := ComCall(9, this, BSTR, contextId, VARIANT.Ptr, _context, "HRESULT")
        return _context
    }

    /**
     * Retrieves an object that contains information about the environment that hosts the target computer.
     * @remarks
     * An orchestration plug-in can call this method to retrieve environment information about a target virtual machine.
     * @returns {ITsSbEnvironment} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_environment
     */
    get_Environment() {
        result := ComCall(10, this, "ptr*", &ppEnvironment := 0, "HRESULT")
        return ITsSbEnvironment(ppEnvironment)
    }

    /**
     * Retrieves a value that indicates the error that occurred while a client connection was being processed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_connectionerror
     */
    get_ConnectionError() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates the domain name and user name of the user who initiated the connection.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_samuseraccount
     */
    get_SamUserAccount() {
        pVal := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pVal, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_clientconnectionpropertyset
     */
    get_ClientConnectionPropertySet() {
        result := ComCall(13, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbClientConnectionPropertySet(ppPropertySet)
    }

    /**
     * Whether this is the first assignment.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_isfirstassignment
     */
    get_IsFirstAssignment() {
        result := ComCall(14, this, BOOL.Ptr, &ppVal := 0, "HRESULT")
        return ppVal
    }

    /**
     * Rd Farm Type.
     * @returns {RD_FARM_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_rdfarmtype
     */
    get_RdFarmType() {
        result := ComCall(15, this, "int*", &pRdFarmType := 0, "HRESULT")
        return pRdFarmType
    }

    /**
     * User SID as a string.
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_usersidstring
     */
    get_UserSidString() {
        result := ComCall(16, this, "ptr*", &pszUserSidString := 0, "HRESULT")
        return pszUserSidString
    }

    /**
     * Gets a disconnected session.
     * @returns {ITsSbSession} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-getdisconnectedsession
     */
    GetDisconnectedSession() {
        result := ComCall(17, this, "ptr*", &ppSession := 0, "HRESULT")
        return ITsSbSession(ppSession)
    }

    Query(iid) {
        if (ITsSbClientConnection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_UserName := CallbackCreate(GetMethod(implObj, "get_UserName"), flags, 2)
        this.vtbl.get_Domain := CallbackCreate(GetMethod(implObj, "get_Domain"), flags, 2)
        this.vtbl.get_InitialProgram := CallbackCreate(GetMethod(implObj, "get_InitialProgram"), flags, 2)
        this.vtbl.get_LoadBalanceResult := CallbackCreate(GetMethod(implObj, "get_LoadBalanceResult"), flags, 2)
        this.vtbl.get_FarmName := CallbackCreate(GetMethod(implObj, "get_FarmName"), flags, 2)
        this.vtbl.PutContext := CallbackCreate(GetMethod(implObj, "PutContext"), flags, 4)
        this.vtbl.GetContext := CallbackCreate(GetMethod(implObj, "GetContext"), flags, 3)
        this.vtbl.get_Environment := CallbackCreate(GetMethod(implObj, "get_Environment"), flags, 2)
        this.vtbl.get_ConnectionError := CallbackCreate(GetMethod(implObj, "get_ConnectionError"), flags, 1)
        this.vtbl.get_SamUserAccount := CallbackCreate(GetMethod(implObj, "get_SamUserAccount"), flags, 2)
        this.vtbl.get_ClientConnectionPropertySet := CallbackCreate(GetMethod(implObj, "get_ClientConnectionPropertySet"), flags, 2)
        this.vtbl.get_IsFirstAssignment := CallbackCreate(GetMethod(implObj, "get_IsFirstAssignment"), flags, 2)
        this.vtbl.get_RdFarmType := CallbackCreate(GetMethod(implObj, "get_RdFarmType"), flags, 2)
        this.vtbl.get_UserSidString := CallbackCreate(GetMethod(implObj, "get_UserSidString"), flags, 2)
        this.vtbl.GetDisconnectedSession := CallbackCreate(GetMethod(implObj, "GetDisconnectedSession"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_UserName)
        CallbackFree(this.vtbl.get_Domain)
        CallbackFree(this.vtbl.get_InitialProgram)
        CallbackFree(this.vtbl.get_LoadBalanceResult)
        CallbackFree(this.vtbl.get_FarmName)
        CallbackFree(this.vtbl.PutContext)
        CallbackFree(this.vtbl.GetContext)
        CallbackFree(this.vtbl.get_Environment)
        CallbackFree(this.vtbl.get_ConnectionError)
        CallbackFree(this.vtbl.get_SamUserAccount)
        CallbackFree(this.vtbl.get_ClientConnectionPropertySet)
        CallbackFree(this.vtbl.get_IsFirstAssignment)
        CallbackFree(this.vtbl.get_RdFarmType)
        CallbackFree(this.vtbl.get_UserSidString)
        CallbackFree(this.vtbl.GetDisconnectedSession)
    }
}
