#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITsSbTarget.ahk
#Include .\ITsSbLoadBalanceResult.ahk
#Include .\ITsSbSession.ahk
#Include .\ITsSbPluginPropertySet.ahk
#Include .\ITsSbTargetPropertySet.ahk
#Include .\ITsSbEnvironment.ahk
#Include .\ITsSbResourcePluginStore.ahk
#Include .\ITsSbFilterPluginStore.ahk
#Include .\ITsSbGlobalStore.ahk
#Include .\ITsSbEnvironmentPropertySet.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that create default implementations of objects that are used in Remote Desktop Virtualization.
 * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nn-sbtsv-itssbprovider
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbProvider
     * @type {Guid}
     */
    static IID => Guid("{87a4098f-6d7b-44dd-bc17-8ce44e370d52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTargetObject", "CreateLoadBalanceResultObject", "CreateSessionObject", "CreatePluginPropertySet", "CreateTargetPropertySetObject", "CreateEnvironmentObject", "GetResourcePluginStore", "GetFilterPluginStore", "RegisterForNotification", "UnRegisterForNotification", "GetInstanceOfGlobalStore", "CreateEnvironmentPropertySetObject"]

    /**
     * Creates an ITsSbTarget target object.
     * @remarks
     * Plug-ins can use this method to create a target object.
     * @param {BSTR} TargetName A <b>BSTR</b> variable that contains the target name.
     * @param {BSTR} EnvironmentName A <b>BSTR</b> variable that contains the environment name.
     * @returns {ITsSbTarget} A pointer to a pointer to the specified target object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-createtargetobject
     */
    CreateTargetObject(TargetName, EnvironmentName) {
        if(TargetName is String) {
            pin := BSTR.Alloc(TargetName)
            TargetName := pin.Value
        }
        if(EnvironmentName is String) {
            pin := BSTR.Alloc(EnvironmentName)
            EnvironmentName := pin.Value
        }

        result := ComCall(3, this, "ptr", TargetName, "ptr", EnvironmentName, "ptr*", &ppTarget := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbTarget(ppTarget)
    }

    /**
     * Creates an ITsSbLoadBalanceResult load-balancing result object.
     * @remarks
     * Plug-ins can use this method to create a load-balancing result 
     * object.
     * @param {BSTR} TargetName A <b>BSTR</b> variable that contains the target name.
     * @returns {ITsSbLoadBalanceResult} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbloadbalanceresult">ITsSbLoadBalanceResult</a> object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-createloadbalanceresultobject
     */
    CreateLoadBalanceResultObject(TargetName) {
        if(TargetName is String) {
            pin := BSTR.Alloc(TargetName)
            TargetName := pin.Value
        }

        result := ComCall(4, this, "ptr", TargetName, "ptr*", &ppLBResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbLoadBalanceResult(ppLBResult)
    }

    /**
     * Plug-ins can use the CreateSessionObject method to create an ITsSbSession session object.
     * @param {BSTR} TargetName A <b>BSTR</b> variable that contains the target name.
     * @param {BSTR} UserName A <b>BSTR</b> variable that contains the user name.
     * @param {BSTR} Domain A <b>BSTR</b> variable that contains the domain.
     * @param {Integer} SessionId A <b>DWORD</b> variable that contains the session ID.
     * @returns {ITsSbSession} A pointer to a pointer to the new session object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-createsessionobject
     */
    CreateSessionObject(TargetName, UserName, Domain, SessionId) {
        if(TargetName is String) {
            pin := BSTR.Alloc(TargetName)
            TargetName := pin.Value
        }
        if(UserName is String) {
            pin := BSTR.Alloc(UserName)
            UserName := pin.Value
        }
        if(Domain is String) {
            pin := BSTR.Alloc(Domain)
            Domain := pin.Value
        }

        result := ComCall(5, this, "ptr", TargetName, "ptr", UserName, "ptr", Domain, "uint", SessionId, "ptr*", &ppSession := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-createpluginpropertyset
     */
    CreatePluginPropertySet() {
        result := ComCall(6, this, "ptr*", &ppPropertySet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbPluginPropertySet(ppPropertySet)
    }

    /**
     * Creates an ITsSbTargetPropertySet target property set object.
     * @remarks
     * Plug-ins can use this method to create a target property set object.
     * @returns {ITsSbTargetPropertySet} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtargetpropertyset">ITsSbTargetPropertySet</a> property set object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method. Because RD Connection Broker is unaware of the contents of the property set object, you should clean the object before calling its <b>Release</b> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-createtargetpropertysetobject
     */
    CreateTargetPropertySetObject() {
        result := ComCall(7, this, "ptr*", &ppPropertySet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbTargetPropertySet(ppPropertySet)
    }

    /**
     * Creates an ITsSbEnvironment environment object.
     * @remarks
     * Plug-ins can use this method to create an environment object.
     * @param {BSTR} Name A <b>BSTR</b> variable that contains the name of the object to create.
     * @param {Integer} ServerWeight A <b>DWORD</b> variable that contains the server weight of the object to create.
     * @returns {ITsSbEnvironment} A pointer to a pointer to the newly created environment object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-createenvironmentobject
     */
    CreateEnvironmentObject(Name, ServerWeight) {
        if(Name is String) {
            pin := BSTR.Alloc(Name)
            Name := pin.Value
        }

        result := ComCall(8, this, "ptr", Name, "uint", ServerWeight, "ptr*", &ppEnvironment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbEnvironment(ppEnvironment)
    }

    /**
     * Retrieves an ITsSbResourcePluginStore instance of the resource plug-in store.
     * @returns {ITsSbResourcePluginStore} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbresourcepluginstore">ITsSbResourcePluginStore</a> resource plug-in store object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-getresourcepluginstore
     */
    GetResourcePluginStore() {
        result := ComCall(9, this, "ptr*", &ppStore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbResourcePluginStore(ppStore)
    }

    /**
     * Retrieves a FilterPluginStore instance of the filter plugin store.
     * @returns {ITsSbFilterPluginStore} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbfilterpluginstore">ITsSbFilterPluginStore</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-getfilterpluginstore
     */
    GetFilterPluginStore() {
        result := ComCall(10, this, "ptr*", &ppStore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbFilterPluginStore(ppStore)
    }

    /**
     * Requests that Remote Desktop Connection Broker (RD Connection Broker) send notifications about specified events.
     * @param {Integer} notificationType The type of notification to receive. To receive notifications for more than one type, specify the enumerations by using a logical <b>OR</b>.
     * @param {BSTR} ResourceToMonitor This parameter is reserved.
     * @param {ITsSbResourceNotification} pPluginNotification A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbresourcenotification">ITsSbResourceNotification</a> plug-in notification object that  RD Connection Broker should use for notifications.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-registerfornotification
     */
    RegisterForNotification(notificationType, ResourceToMonitor, pPluginNotification) {
        if(ResourceToMonitor is String) {
            pin := BSTR.Alloc(ResourceToMonitor)
            ResourceToMonitor := pin.Value
        }

        result := ComCall(11, this, "uint", notificationType, "ptr", ResourceToMonitor, "ptr", pPluginNotification, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests that Remote Desktop Connection Broker (RD Connection Broker) not send notifications about specified events.
     * @remarks
     * Plug-ins can use the <b>UnRegisterForNotification</b> method to cancel previous requests for notifications.
     * @param {Integer} notificationType Specifies the type of notification. To specify more than one type, use a logical <b>OR</b>.
     * @param {BSTR} ResourceToMonitor This parameter is reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-unregisterfornotification
     */
    UnRegisterForNotification(notificationType, ResourceToMonitor) {
        if(ResourceToMonitor is String) {
            pin := BSTR.Alloc(ResourceToMonitor)
            ResourceToMonitor := pin.Value
        }

        result := ComCall(12, this, "uint", notificationType, "ptr", ResourceToMonitor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves an ITsSbGlobalStore instance of the global store object.
     * @returns {ITsSbGlobalStore} A pointer to a pointer to a global store object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-getinstanceofglobalstore
     */
    GetInstanceOfGlobalStore() {
        result := ComCall(13, this, "ptr*", &ppGlobalStore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbGlobalStore(ppGlobalStore)
    }

    /**
     * Creates an ITsSbEnvironmentPropertySet environment property set object.
     * @remarks
     * Plug-ins can use this method to create an environment property set object.
     * @returns {ITsSbEnvironmentPropertySet} A pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbenvironmentpropertyset">ITsSbEnvironmentPropertySet</a> environment property set object.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovider-createenvironmentpropertysetobject
     */
    CreateEnvironmentPropertySetObject() {
        result := ComCall(14, this, "ptr*", &ppPropertySet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbEnvironmentPropertySet(ppPropertySet)
    }
}
