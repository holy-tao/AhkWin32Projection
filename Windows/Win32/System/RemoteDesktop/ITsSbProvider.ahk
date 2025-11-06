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
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbprovider
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
     * 
     * @param {BSTR} TargetName 
     * @param {BSTR} EnvironmentName 
     * @returns {ITsSbTarget} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createtargetobject
     */
    CreateTargetObject(TargetName, EnvironmentName) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName

        result := ComCall(3, this, "ptr", TargetName, "ptr", EnvironmentName, "ptr*", &ppTarget := 0, "HRESULT")
        return ITsSbTarget(ppTarget)
    }

    /**
     * 
     * @param {BSTR} TargetName 
     * @returns {ITsSbLoadBalanceResult} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createloadbalanceresultobject
     */
    CreateLoadBalanceResultObject(TargetName) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(4, this, "ptr", TargetName, "ptr*", &ppLBResult := 0, "HRESULT")
        return ITsSbLoadBalanceResult(ppLBResult)
    }

    /**
     * 
     * @param {BSTR} TargetName 
     * @param {BSTR} UserName 
     * @param {BSTR} Domain 
     * @param {Integer} SessionId 
     * @returns {ITsSbSession} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createsessionobject
     */
    CreateSessionObject(TargetName, UserName, Domain, SessionId) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        UserName := UserName is String ? BSTR.Alloc(UserName).Value : UserName
        Domain := Domain is String ? BSTR.Alloc(Domain).Value : Domain

        result := ComCall(5, this, "ptr", TargetName, "ptr", UserName, "ptr", Domain, "uint", SessionId, "ptr*", &ppSession := 0, "HRESULT")
        return ITsSbSession(ppSession)
    }

    /**
     * 
     * @returns {ITsSbPluginPropertySet} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createpluginpropertyset
     */
    CreatePluginPropertySet() {
        result := ComCall(6, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbPluginPropertySet(ppPropertySet)
    }

    /**
     * 
     * @returns {ITsSbTargetPropertySet} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createtargetpropertysetobject
     */
    CreateTargetPropertySetObject() {
        result := ComCall(7, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbTargetPropertySet(ppPropertySet)
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Integer} ServerWeight 
     * @returns {ITsSbEnvironment} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createenvironmentobject
     */
    CreateEnvironmentObject(Name, ServerWeight) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, "ptr", Name, "uint", ServerWeight, "ptr*", &ppEnvironment := 0, "HRESULT")
        return ITsSbEnvironment(ppEnvironment)
    }

    /**
     * 
     * @returns {ITsSbResourcePluginStore} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-getresourcepluginstore
     */
    GetResourcePluginStore() {
        result := ComCall(9, this, "ptr*", &ppStore := 0, "HRESULT")
        return ITsSbResourcePluginStore(ppStore)
    }

    /**
     * 
     * @returns {ITsSbFilterPluginStore} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-getfilterpluginstore
     */
    GetFilterPluginStore() {
        result := ComCall(10, this, "ptr*", &ppStore := 0, "HRESULT")
        return ITsSbFilterPluginStore(ppStore)
    }

    /**
     * 
     * @param {Integer} notificationType 
     * @param {BSTR} ResourceToMonitor 
     * @param {ITsSbResourceNotification} pPluginNotification 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-registerfornotification
     */
    RegisterForNotification(notificationType, ResourceToMonitor, pPluginNotification) {
        ResourceToMonitor := ResourceToMonitor is String ? BSTR.Alloc(ResourceToMonitor).Value : ResourceToMonitor

        result := ComCall(11, this, "uint", notificationType, "ptr", ResourceToMonitor, "ptr", pPluginNotification, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} notificationType 
     * @param {BSTR} ResourceToMonitor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-unregisterfornotification
     */
    UnRegisterForNotification(notificationType, ResourceToMonitor) {
        ResourceToMonitor := ResourceToMonitor is String ? BSTR.Alloc(ResourceToMonitor).Value : ResourceToMonitor

        result := ComCall(12, this, "uint", notificationType, "ptr", ResourceToMonitor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITsSbGlobalStore} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-getinstanceofglobalstore
     */
    GetInstanceOfGlobalStore() {
        result := ComCall(13, this, "ptr*", &ppGlobalStore := 0, "HRESULT")
        return ITsSbGlobalStore(ppGlobalStore)
    }

    /**
     * 
     * @returns {ITsSbEnvironmentPropertySet} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovider-createenvironmentpropertysetobject
     */
    CreateEnvironmentPropertySetObject() {
        result := ComCall(14, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbEnvironmentPropertySet(ppPropertySet)
    }
}
