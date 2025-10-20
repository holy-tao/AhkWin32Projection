#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that create default implementations of objects that are used in Remote Desktop Virtualization.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbprovider
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbProvider extends IUnknown{
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
     * 
     * @param {BSTR} TargetName 
     * @param {BSTR} EnvironmentName 
     * @param {Pointer<ITsSbTarget>} ppTarget 
     * @returns {HRESULT} 
     */
    CreateTargetObject(TargetName, EnvironmentName, ppTarget) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName

        result := ComCall(3, this, "ptr", TargetName, "ptr", EnvironmentName, "ptr", ppTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} TargetName 
     * @param {Pointer<ITsSbLoadBalanceResult>} ppLBResult 
     * @returns {HRESULT} 
     */
    CreateLoadBalanceResultObject(TargetName, ppLBResult) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(4, this, "ptr", TargetName, "ptr", ppLBResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} TargetName 
     * @param {BSTR} UserName 
     * @param {BSTR} Domain 
     * @param {Integer} SessionId 
     * @param {Pointer<ITsSbSession>} ppSession 
     * @returns {HRESULT} 
     */
    CreateSessionObject(TargetName, UserName, Domain, SessionId, ppSession) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        UserName := UserName is String ? BSTR.Alloc(UserName).Value : UserName
        Domain := Domain is String ? BSTR.Alloc(Domain).Value : Domain

        result := ComCall(5, this, "ptr", TargetName, "ptr", UserName, "ptr", Domain, "uint", SessionId, "ptr", ppSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbPluginPropertySet>} ppPropertySet 
     * @returns {HRESULT} 
     */
    CreatePluginPropertySet(ppPropertySet) {
        result := ComCall(6, this, "ptr", ppPropertySet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbTargetPropertySet>} ppPropertySet 
     * @returns {HRESULT} 
     */
    CreateTargetPropertySetObject(ppPropertySet) {
        result := ComCall(7, this, "ptr", ppPropertySet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Integer} ServerWeight 
     * @param {Pointer<ITsSbEnvironment>} ppEnvironment 
     * @returns {HRESULT} 
     */
    CreateEnvironmentObject(Name, ServerWeight, ppEnvironment) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, "ptr", Name, "uint", ServerWeight, "ptr", ppEnvironment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbResourcePluginStore>} ppStore 
     * @returns {HRESULT} 
     */
    GetResourcePluginStore(ppStore) {
        result := ComCall(9, this, "ptr", ppStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbFilterPluginStore>} ppStore 
     * @returns {HRESULT} 
     */
    GetFilterPluginStore(ppStore) {
        result := ComCall(10, this, "ptr", ppStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} notificationType 
     * @param {BSTR} ResourceToMonitor 
     * @param {Pointer<ITsSbResourceNotification>} pPluginNotification 
     * @returns {HRESULT} 
     */
    RegisterForNotification(notificationType, ResourceToMonitor, pPluginNotification) {
        ResourceToMonitor := ResourceToMonitor is String ? BSTR.Alloc(ResourceToMonitor).Value : ResourceToMonitor

        result := ComCall(11, this, "uint", notificationType, "ptr", ResourceToMonitor, "ptr", pPluginNotification, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} notificationType 
     * @param {BSTR} ResourceToMonitor 
     * @returns {HRESULT} 
     */
    UnRegisterForNotification(notificationType, ResourceToMonitor) {
        ResourceToMonitor := ResourceToMonitor is String ? BSTR.Alloc(ResourceToMonitor).Value : ResourceToMonitor

        result := ComCall(12, this, "uint", notificationType, "ptr", ResourceToMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbGlobalStore>} ppGlobalStore 
     * @returns {HRESULT} 
     */
    GetInstanceOfGlobalStore(ppGlobalStore) {
        result := ComCall(13, this, "ptr", ppGlobalStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbEnvironmentPropertySet>} ppPropertySet 
     * @returns {HRESULT} 
     */
    CreateEnvironmentPropertySetObject(ppPropertySet) {
        result := ComCall(14, this, "ptr", ppPropertySet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
