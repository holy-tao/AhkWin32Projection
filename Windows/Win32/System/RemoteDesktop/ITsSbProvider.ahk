#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbTargetPropertySet.ahk" { ITsSbTargetPropertySet }
#Import ".\ITsSbPluginPropertySet.ahk" { ITsSbPluginPropertySet }
#Import ".\ITsSbTarget.ahk" { ITsSbTarget }
#Import ".\ITsSbEnvironmentPropertySet.ahk" { ITsSbEnvironmentPropertySet }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITsSbResourcePluginStore.ahk" { ITsSbResourcePluginStore }
#Import ".\ITsSbSession.ahk" { ITsSbSession }
#Import ".\ITsSbGlobalStore.ahk" { ITsSbGlobalStore }
#Import ".\ITsSbEnvironment.ahk" { ITsSbEnvironment }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITsSbLoadBalanceResult.ahk" { ITsSbLoadBalanceResult }
#Import ".\ITsSbFilterPluginStore.ahk" { ITsSbFilterPluginStore }
#Import ".\ITsSbResourceNotification.ahk" { ITsSbResourceNotification }

/**
 * Exposes methods that create default implementations of objects that are used in Remote Desktop Virtualization.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbprovider
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbProvider extends IUnknown {
    /**
     * The interface identifier for ITsSbProvider
     * @type {Guid}
     */
    static IID := Guid("{87a4098f-6d7b-44dd-bc17-8ce44e370d52}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateTargetObject                 : IntPtr
        CreateLoadBalanceResultObject      : IntPtr
        CreateSessionObject                : IntPtr
        CreatePluginPropertySet            : IntPtr
        CreateTargetPropertySetObject      : IntPtr
        CreateEnvironmentObject            : IntPtr
        GetResourcePluginStore             : IntPtr
        GetFilterPluginStore               : IntPtr
        RegisterForNotification            : IntPtr
        UnRegisterForNotification          : IntPtr
        GetInstanceOfGlobalStore           : IntPtr
        CreateEnvironmentPropertySetObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an ITsSbTarget target object.
     * @remarks
     * Plug-ins can use this method to create a target object.
     * @param {BSTR} TargetName A <b>BSTR</b> variable that contains the target name.
     * @param {BSTR} EnvironmentName A <b>BSTR</b> variable that contains the environment name.
     * @returns {ITsSbTarget} A pointer to a pointer to the specified target object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createtargetobject
     */
    CreateTargetObject(TargetName, EnvironmentName) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName

        result := ComCall(3, this, BSTR, TargetName, BSTR, EnvironmentName, "ptr*", &ppTarget := 0, "HRESULT")
        return ITsSbTarget(ppTarget)
    }

    /**
     * Creates an ITsSbLoadBalanceResult load-balancing result object.
     * @remarks
     * Plug-ins can use this method to create a load-balancing result 
     * object.
     * @param {BSTR} TargetName A <b>BSTR</b> variable that contains the target name.
     * @returns {ITsSbLoadBalanceResult} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbloadbalanceresult">ITsSbLoadBalanceResult</a> object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createloadbalanceresultobject
     */
    CreateLoadBalanceResultObject(TargetName) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(4, this, BSTR, TargetName, "ptr*", &ppLBResult := 0, "HRESULT")
        return ITsSbLoadBalanceResult(ppLBResult)
    }

    /**
     * Plug-ins can use the CreateSessionObject method to create an ITsSbSession session object.
     * @param {BSTR} TargetName A <b>BSTR</b> variable that contains the target name.
     * @param {BSTR} UserName A <b>BSTR</b> variable that contains the user name.
     * @param {BSTR} Domain A <b>BSTR</b> variable that contains the domain.
     * @param {Integer} SessionId A <b>DWORD</b> variable that contains the session ID.
     * @returns {ITsSbSession} A pointer to a pointer to the new session object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createsessionobject
     */
    CreateSessionObject(TargetName, UserName, Domain, SessionId) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        UserName := UserName is String ? BSTR.Alloc(UserName).Value : UserName
        Domain := Domain is String ? BSTR.Alloc(Domain).Value : Domain

        result := ComCall(5, this, BSTR, TargetName, BSTR, UserName, BSTR, Domain, "uint", SessionId, "ptr*", &ppSession := 0, "HRESULT")
        return ITsSbSession(ppSession)
    }

    /**
     * Creates an ITsSbPluginPropertySet plug-in property set object.
     * @remarks
     * Plug-ins can use this method to create a plug-in property set object.
     * @returns {ITsSbPluginPropertySet} A pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbpluginpropertyset">ITsSbPluginPropertySet</a> property set object. When you have finished 
     * using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method. 
     * Because RD Connection Broker is unaware of the contents of the property set object, you should clean the object before calling 
     * its <b>Release</b> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createpluginpropertyset
     */
    CreatePluginPropertySet() {
        result := ComCall(6, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbPluginPropertySet(ppPropertySet)
    }

    /**
     * Creates an ITsSbTargetPropertySet target property set object.
     * @remarks
     * Plug-ins can use this method to create a target property set object.
     * @returns {ITsSbTargetPropertySet} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtargetpropertyset">ITsSbTargetPropertySet</a> property set object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method. Because RD Connection Broker is unaware of the contents of the property set object, you should clean the object before calling its <b>Release</b> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createtargetpropertysetobject
     */
    CreateTargetPropertySetObject() {
        result := ComCall(7, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbTargetPropertySet(ppPropertySet)
    }

    /**
     * Creates an ITsSbEnvironment environment object.
     * @remarks
     * Plug-ins can use this method to create an environment object.
     * @param {BSTR} Name A <b>BSTR</b> variable that contains the name of the object to create.
     * @param {Integer} ServerWeight A <b>DWORD</b> variable that contains the server weight of the object to create.
     * @returns {ITsSbEnvironment} A pointer to a pointer to the newly created environment object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createenvironmentobject
     */
    CreateEnvironmentObject(Name, ServerWeight) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, BSTR, Name, "uint", ServerWeight, "ptr*", &ppEnvironment := 0, "HRESULT")
        return ITsSbEnvironment(ppEnvironment)
    }

    /**
     * Retrieves an ITsSbResourcePluginStore instance of the resource plug-in store.
     * @returns {ITsSbResourcePluginStore} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbresourcepluginstore">ITsSbResourcePluginStore</a> resource plug-in store object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-getresourcepluginstore
     */
    GetResourcePluginStore() {
        result := ComCall(9, this, "ptr*", &ppStore := 0, "HRESULT")
        return ITsSbResourcePluginStore(ppStore)
    }

    /**
     * Retrieves a FilterPluginStore instance of the filter plugin store.
     * @returns {ITsSbFilterPluginStore} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbfilterpluginstore">ITsSbFilterPluginStore</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-getfilterpluginstore
     */
    GetFilterPluginStore() {
        result := ComCall(10, this, "ptr*", &ppStore := 0, "HRESULT")
        return ITsSbFilterPluginStore(ppStore)
    }

    /**
     * Requests that Remote Desktop Connection Broker (RD Connection Broker) send notifications about specified events.
     * @param {Integer} notificationType The type of notification to receive. To receive notifications for more than one type, specify the enumerations by using a logical <b>OR</b>.
     * @param {BSTR} ResourceToMonitor This parameter is reserved.
     * @param {ITsSbResourceNotification} pPluginNotification A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbresourcenotification">ITsSbResourceNotification</a> plug-in notification object that  RD Connection Broker should use for notifications.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-registerfornotification
     */
    RegisterForNotification(notificationType, ResourceToMonitor, pPluginNotification) {
        ResourceToMonitor := ResourceToMonitor is String ? BSTR.Alloc(ResourceToMonitor).Value : ResourceToMonitor

        result := ComCall(11, this, "uint", notificationType, BSTR, ResourceToMonitor, "ptr", pPluginNotification, "HRESULT")
        return result
    }

    /**
     * Requests that Remote Desktop Connection Broker (RD Connection Broker) not send notifications about specified events.
     * @remarks
     * Plug-ins can use the <b>UnRegisterForNotification</b> method to cancel previous requests for notifications.
     * @param {Integer} notificationType Specifies the type of notification. To specify more than one type, use a logical <b>OR</b>.
     * @param {BSTR} ResourceToMonitor This parameter is reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-unregisterfornotification
     */
    UnRegisterForNotification(notificationType, ResourceToMonitor) {
        ResourceToMonitor := ResourceToMonitor is String ? BSTR.Alloc(ResourceToMonitor).Value : ResourceToMonitor

        result := ComCall(12, this, "uint", notificationType, BSTR, ResourceToMonitor, "HRESULT")
        return result
    }

    /**
     * Retrieves an ITsSbGlobalStore instance of the global store object.
     * @returns {ITsSbGlobalStore} A pointer to a pointer to a global store object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-getinstanceofglobalstore
     */
    GetInstanceOfGlobalStore() {
        result := ComCall(13, this, "ptr*", &ppGlobalStore := 0, "HRESULT")
        return ITsSbGlobalStore(ppGlobalStore)
    }

    /**
     * Creates an ITsSbEnvironmentPropertySet environment property set object.
     * @remarks
     * Plug-ins can use this method to create an environment property set object.
     * @returns {ITsSbEnvironmentPropertySet} A pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbenvironmentpropertyset">ITsSbEnvironmentPropertySet</a> environment property set object.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createenvironmentpropertysetobject
     */
    CreateEnvironmentPropertySetObject() {
        result := ComCall(14, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbEnvironmentPropertySet(ppPropertySet)
    }

    Query(iid) {
        if (ITsSbProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTargetObject := CallbackCreate(GetMethod(implObj, "CreateTargetObject"), flags, 4)
        this.vtbl.CreateLoadBalanceResultObject := CallbackCreate(GetMethod(implObj, "CreateLoadBalanceResultObject"), flags, 3)
        this.vtbl.CreateSessionObject := CallbackCreate(GetMethod(implObj, "CreateSessionObject"), flags, 6)
        this.vtbl.CreatePluginPropertySet := CallbackCreate(GetMethod(implObj, "CreatePluginPropertySet"), flags, 2)
        this.vtbl.CreateTargetPropertySetObject := CallbackCreate(GetMethod(implObj, "CreateTargetPropertySetObject"), flags, 2)
        this.vtbl.CreateEnvironmentObject := CallbackCreate(GetMethod(implObj, "CreateEnvironmentObject"), flags, 4)
        this.vtbl.GetResourcePluginStore := CallbackCreate(GetMethod(implObj, "GetResourcePluginStore"), flags, 2)
        this.vtbl.GetFilterPluginStore := CallbackCreate(GetMethod(implObj, "GetFilterPluginStore"), flags, 2)
        this.vtbl.RegisterForNotification := CallbackCreate(GetMethod(implObj, "RegisterForNotification"), flags, 4)
        this.vtbl.UnRegisterForNotification := CallbackCreate(GetMethod(implObj, "UnRegisterForNotification"), flags, 3)
        this.vtbl.GetInstanceOfGlobalStore := CallbackCreate(GetMethod(implObj, "GetInstanceOfGlobalStore"), flags, 2)
        this.vtbl.CreateEnvironmentPropertySetObject := CallbackCreate(GetMethod(implObj, "CreateEnvironmentPropertySetObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTargetObject)
        CallbackFree(this.vtbl.CreateLoadBalanceResultObject)
        CallbackFree(this.vtbl.CreateSessionObject)
        CallbackFree(this.vtbl.CreatePluginPropertySet)
        CallbackFree(this.vtbl.CreateTargetPropertySetObject)
        CallbackFree(this.vtbl.CreateEnvironmentObject)
        CallbackFree(this.vtbl.GetResourcePluginStore)
        CallbackFree(this.vtbl.GetFilterPluginStore)
        CallbackFree(this.vtbl.RegisterForNotification)
        CallbackFree(this.vtbl.UnRegisterForNotification)
        CallbackFree(this.vtbl.GetInstanceOfGlobalStore)
        CallbackFree(this.vtbl.CreateEnvironmentPropertySetObject)
    }
}
