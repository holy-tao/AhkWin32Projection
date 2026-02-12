#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProtectionPolicyManager.ahk
#Include .\IProtectionPolicyManager2.ahk
#Include .\IProtectionPolicyManagerStatics.ahk
#Include .\IProtectionPolicyManagerStatics3.ahk
#Include .\IProtectionPolicyManagerStatics2.ahk
#Include .\IProtectionPolicyManagerStatics4.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Manages enterprise-protection policy on protected content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class ProtectionPolicyManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProtectionPolicyManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProtectionPolicyManager.IID

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Use this property to determine whether Windows Information Protection (WIP) is enabled on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.isprotectionenabled
     * @type {Boolean} 
     */
    static IsProtectionEnabled {
        get => ProtectionPolicyManager.get_IsProtectionEnabled()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Gets the primary enterprise identity.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.primarymanagedidentity
     * @type {HSTRING} 
     */
    static PrimaryManagedIdentity {
        get => ProtectionPolicyManager.get_PrimaryManagedIdentity()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Determines if an enterprise entity is managed by an enterprise policy.
     * @param {HSTRING} identity The enterprise identity. This is an email address or domain.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.isidentitymanaged
     */
    static IsIdentityManaged(identity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.IsIdentityManaged(identity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Enables UI policy enforcement for an enterprise identity. When an app is about to display a protected file (such as a PDF) or resource (buffer or stream) on its UI, it must enable UI policy enforcement based on the identity the file is protected to. A call to TryApplyProcessUIPolicy ensures that the OS knows about the current context of the app.
     * @param {HSTRING} identity The enterprise identity. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.tryapplyprocessuipolicy
     */
    static TryApplyProcessUIPolicy(identity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.TryApplyProcessUIPolicy(identity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Clear UI policy enforcement for an enterprise identity. The app calls this method before it displays non-enterprise-protected content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.clearprocessuipolicy
     */
    static ClearProcessUIPolicy() {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.ClearProcessUIPolicy()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Creates a [ThreadNetworkContext](threadnetworkcontext.md) protected to an enterprise identity. The creation of the context tags all network connections made thereafter on the current thread with the identity, and allows access to enterprise resources that are access controlled by the enterprise's policy.
     * @param {HSTRING} identity The enterprise identity. This is an email address or domain that is managed. This may be returned from [GetPrimaryManagedIdentityForNetworkEndpoint](protectionpolicymanager_getprimarymanagedidentityfornetworkendpointasync_9146700.md); otherwise your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @returns {ThreadNetworkContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.createcurrentthreadnetworkcontext
     */
    static CreateCurrentThreadNetworkContext(identity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.CreateCurrentThreadNetworkContext(identity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Returns the enterprise identity of a network resource if the resource is on an enterprise-policy-managed endpoint.
     * @param {HostName} endpointHost The host name or IP address of the network resource.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.getprimarymanagedidentityfornetworkendpointasync
     */
    static GetPrimaryManagedIdentityForNetworkEndpointAsync(endpointHost) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.GetPrimaryManagedIdentityForNetworkEndpointAsync(endpointHost)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Revoke the keys required to access all content protected to the specified enterprise identity.
     * 
     * A remote management client on a device receives an unenrollment request from the enterprise’s remote management server, and calls  to revoke the keys that are required to access content protected on that device to that enterprise identity. This causes the [ProtectedContentRevoked](protectionpolicymanager_protectedcontentrevoked.md) event to be raised. Your app can also call  in response to that event, in which case the effect is to revoke your app's access to content protected by itself.
     * @remarks
     * This API is intended for remote device management client apps to call.  requires that all of the following conditions are true for your app.
     * 
     * + Your app is allowed or running unmanaged through MDM.
     * + Your app is either a medium integrity level app (most Win32 apps are medium integrity level), or on a list of UWP apps that can only be configured through Group Policy.
     * When the enterprise identity that you want to revoke is not managed through MDM, it can still be revoked. The scope of the revoke is different depending on whether the app calling  is a medium (or greater) integrity level app, or a low integrity level app. Examples of low integrity level are Low Rights Internet Explorer (LoRIE), and UWP apps. If the app is medium (or greater) integrity level then it can revoke the keys for all apps. If the app is low integrity level then it can only revoke the key for data that it created itself.
     * 
     * Selective Wipe keys are generated for each UWP app when MDM is not in the picture. This behavior is for compatibility with Windows 8.1, which introduced Selective Wipe.
     * @param {HSTRING} identity The enterprise identity. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.revokecontent
     */
    static RevokeContent(identity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.RevokeContent(identity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Returns the [ProtectionPolicyManager](protectionpolicymanager.md) object associated with the current app window.
     * @returns {ProtectionPolicyManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.getforcurrentview
     */
    static GetForCurrentView() {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.GetForCurrentView()
    }

    /**
     * 
     * @param {EventHandler<ProtectedAccessSuspendingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ProtectedAccessSuspending(handler) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.add_ProtectedAccessSuspending(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_ProtectedAccessSuspending(token) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.remove_ProtectedAccessSuspending(token)
    }

    /**
     * 
     * @param {EventHandler<ProtectedAccessResumedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ProtectedAccessResumed(handler) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.add_ProtectedAccessResumed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_ProtectedAccessResumed(token) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.remove_ProtectedAccessResumed(token)
    }

    /**
     * 
     * @param {EventHandler<ProtectedContentRevokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ProtectedContentRevoked(handler) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.add_ProtectedContentRevoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_ProtectedContentRevoked(token) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.remove_ProtectedContentRevoked(token)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Request if access to enterprise-protected content is available to an identity.
     * @param {HSTRING} sourceIdentity The source enterprise identity of the app. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to check if an email address or domain is managed.
     * @param {HSTRING} targetIdentity The enterprise identity you want to check has access to the protected content.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.checkaccess
     */
    static CheckAccess(sourceIdentity, targetIdentity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.CheckAccess(sourceIdentity, targetIdentity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Request access to enterprise protected content for an identity.
     * @remarks
     * Call this method from the main UI thread of your foreground app.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @param {HSTRING} targetIdentity The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccessasync
     */
    static RequestAccessAsync(sourceIdentity, targetIdentity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics := IProtectionPolicyManagerStatics(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics.RequestAccessAsync(sourceIdentity, targetIdentity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Request access to enterprise protected content for an identity.
     * @remarks
     * Call this method from the main UI thread of your foreground app.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @param {HSTRING} targetIdentity The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {ProtectionPolicyAuditInfo} auditInfo An audit info object; an instance of [ProtectionPolicyAuditInfo](protectionpolicyauditinfo.md).
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccessasync
     */
    static RequestAccessWithAuditingInfoAsync(sourceIdentity, targetIdentity, auditInfo) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics3.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics3 := IProtectionPolicyManagerStatics3(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics3.RequestAccessWithAuditingInfoAsync(sourceIdentity, targetIdentity, auditInfo)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Request access to enterprise protected content for an identity
     * @remarks
     * Call this method from the main UI thread of your foreground app.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected.
     * @param {HSTRING} targetIdentity The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {ProtectionPolicyAuditInfo} auditInfo An audit info object; an instance of [ProtectionPolicyAuditInfo](protectionpolicyauditinfo.md).
     * @param {HSTRING} messageFromApp A message that will be displayed in the consent dialog so that the user can make a consent decision.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccessasync
     */
    static RequestAccessWithMessageAsync(sourceIdentity, targetIdentity, auditInfo, messageFromApp) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics3.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics3 := IProtectionPolicyManagerStatics3(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics3.RequestAccessWithMessageAsync(sourceIdentity, targetIdentity, auditInfo, messageFromApp)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Request access to enterprise-protected content for a specific target app.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @param {HSTRING} appPackageFamilyName The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {ProtectionPolicyAuditInfo} auditInfo An audit info object; an instance of [ProtectionPolicyAuditInfo](protectionpolicyauditinfo.md).
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccessforappasync
     */
    static RequestAccessForAppWithAuditingInfoAsync(sourceIdentity, appPackageFamilyName, auditInfo) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics3.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics3 := IProtectionPolicyManagerStatics3(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics3.RequestAccessForAppWithAuditingInfoAsync(sourceIdentity, appPackageFamilyName, auditInfo)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Request access to enterprise-protected content for a specific target app.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed.
     * @param {HSTRING} appPackageFamilyName The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {ProtectionPolicyAuditInfo} auditInfo An audit info object; an instance of [ProtectionPolicyAuditInfo](protectionpolicyauditinfo.md).
     * @param {HSTRING} messageFromApp A message that will be displayed in the consent dialog so that the user can make a consent decision.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccessforappasync
     */
    static RequestAccessForAppWithMessageAsync(sourceIdentity, appPackageFamilyName, auditInfo, messageFromApp) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics3.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics3 := IProtectionPolicyManagerStatics3(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics3.RequestAccessForAppWithMessageAsync(sourceIdentity, appPackageFamilyName, auditInfo, messageFromApp)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Causes an audit event to be logged.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @param {HSTRING} targetIdentity The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {ProtectionPolicyAuditInfo} auditInfo An audit info object; an instance of [ProtectionPolicyAuditInfo](protectionpolicyauditinfo.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.logauditevent
     */
    static LogAuditEvent(sourceIdentity, targetIdentity, auditInfo) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics3.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics3 := IProtectionPolicyManagerStatics3(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics3.LogAuditEvent(sourceIdentity, targetIdentity, auditInfo)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Use this method to check (for a known identity that is managed or ever was managed) whether access to protected data has been revoked since a specified date and time, or is still accessible. Note that the API returns true for an unknown identity (that is, an identity that has never been managed and is not currently managed). This is so that your app can clean up data associated with an identity for which there is no information. For more info, see Remarks.
     * @remarks
     * Call this API only for an identity that has protected content on the device (in other words, for an identity that has been managed by Windows Information Protection (WIP)). Asking whether content has been revoked for an identity is only meaningful for an identity that has ever been managed by Windows Information Protection (WIP). Consequently, the answer returned from  is meaningful only on the condition that the identity passed to the API has ever been managed by Windows Information Protection (WIP).
     * 
     * We recommend that your app maintains a log of the times it first protected data (files, buffers, or streams) associated with an identity. After this, you should call  only if the identity has protected content associated with it on that device and your app wishes to know whether the protected content was revoked since the time it was protected.
     * 
     *  is not intended to be used as a way to determine whether Windows Information Protection (WIP) was ever enabled and then revoked for an arbitrary identity, in other words as a retrospective-looking form of [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md).
     * @param {HSTRING} identity The enterprise identity protecting the data. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @param {DateTime} since The date and time from which point forward you want to include in the check.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.hascontentbeenrevokedsince
     */
    static HasContentBeenRevokedSince(identity, since) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics2.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics2 := IProtectionPolicyManagerStatics2(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics2.HasContentBeenRevokedSince(identity, since)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Perform enterprise-protection policy evaluation for a data transfer between your app and a specific target app.
     * @param {HSTRING} sourceIdentity The source enterprise identity of the app. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to check if an email address or domain is managed.
     * @param {HSTRING} appPackageFamilyName The package family name of the app you want to check has access to the protected content.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.checkaccessforapp
     */
    static CheckAccessForApp(sourceIdentity, appPackageFamilyName) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics2.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics2 := IProtectionPolicyManagerStatics2(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics2.CheckAccessForApp(sourceIdentity, appPackageFamilyName)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Request access to enterprise-protected content for a specific target app.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed. Your app can use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @param {HSTRING} appPackageFamilyName The description of the App package family name.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccessforappasync
     */
    static RequestAccessForAppAsync(sourceIdentity, appPackageFamilyName) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics2.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics2 := IProtectionPolicyManagerStatics2(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics2.RequestAccessForAppAsync(sourceIdentity, appPackageFamilyName)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * You can use this method to determine the current Windows Information Protection (WIP) enforcement level. WIP enforcement level is one aspect of mobile device management (MDM) policy configuration.
     * @param {HSTRING} identity The enterprise identity. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.getenforcementlevel
     */
    static GetEnforcementLevel(identity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics2.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics2 := IProtectionPolicyManagerStatics2(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics2.GetEnforcementLevel(identity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Use this property to determine whether decryption of files protected by Windows Information Protection (WIP) is allowed.
     * @param {HSTRING} identity The enterprise identity you want to check has access to the protected content.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.isuserdecryptionallowed
     */
    static IsUserDecryptionAllowed(identity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics2.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics2 := IProtectionPolicyManagerStatics2(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics2.IsUserDecryptionAllowed(identity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Use this property to determine the value of the ProtectionUnderLockConfigRequired enterprise data protection (WIP) policy.
     * @param {HSTRING} identity The enterprise identity you want to check has ProtectionUnderLockConfigRequired policy set.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.isprotectionunderlockrequired
     */
    static IsProtectionUnderLockRequired(identity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics2.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics2 := IProtectionPolicyManagerStatics2(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics2.IsProtectionUnderLockRequired(identity)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_PolicyChanged(handler) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics2.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics2 := IProtectionPolicyManagerStatics2(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics2.add_PolicyChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_PolicyChanged(token) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics2.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics2 := IProtectionPolicyManagerStatics2(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics2.remove_PolicyChanged(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsProtectionEnabled() {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics2.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics2 := IProtectionPolicyManagerStatics2(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics2.get_IsProtectionEnabled()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Determines whether the policy is configured to protect files that are copied to removable drives by using [Microsoft Purview Information Protection](https://www.microsoft.com/security/business/information-protection/microsoft-purview-information-protection).
     * @remarks
     * If this method returns **false**, files that users copy to removable drives will be protected by using local keys and those files won't be accessible on those drives to other users on the current device or, if the drive is connected to another device, to anyone on that newly connected device.  If this method returns **false**, you could (optionally) let users know about this limitation by presenting this information in a dialog box.
     * @param {HSTRING} identity The enterprise identity.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.isroamableprotectionenabled
     */
    static IsRoamableProtectionEnabled(identity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics4.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics4 := IProtectionPolicyManagerStatics4(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics4.IsRoamableProtectionEnabled(identity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Request access to enterprise protected content for an identity.
     * @remarks
     * Call this method from the main UI thread of your foreground app.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @param {HSTRING} targetIdentity The enterprise identity to which the content is being disclosed. This is an email address or domain.
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccessasync
     */
    static RequestAccessWithBehaviorAsync(sourceIdentity, targetIdentity, auditInfo, messageFromApp, behavior) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics4.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics4 := IProtectionPolicyManagerStatics4(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics4.RequestAccessWithBehaviorAsync(sourceIdentity, targetIdentity, auditInfo, messageFromApp, behavior)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Request access to enterprise-protected content for a specific target app.
     * @param {HSTRING} sourceIdentity The enterprise identity to which the content is protected. This is an email address or domain that is managed. Your app can use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @param {HSTRING} appPackageFamilyName The description of the App package family name.
     * @param {ProtectionPolicyAuditInfo} auditInfo 
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccessforappasync
     */
    static RequestAccessForAppWithBehaviorAsync(sourceIdentity, appPackageFamilyName, auditInfo, messageFromApp, behavior) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics4.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics4 := IProtectionPolicyManagerStatics4(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics4.RequestAccessForAppWithBehaviorAsync(sourceIdentity, appPackageFamilyName, auditInfo, messageFromApp, behavior)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Requests access to enterprise-protected content for a specific app.
     * @param {IIterable<IStorageItem>} sourceItemList An array of files to that you want to grant access to.
     * @param {HSTRING} appPackageFamilyName The package name of the app that you want to grant permission to.
     * @param {ProtectionPolicyAuditInfo} auditInfo An audit info object; an instance of [ProtectionPolicyAuditInfo](protectionpolicyauditinfo.md).
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccesstofilesforappasync
     */
    static RequestAccessToFilesForAppAsync(sourceItemList, appPackageFamilyName, auditInfo) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics4.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics4 := IProtectionPolicyManagerStatics4(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics4.RequestAccessToFilesForAppAsync(sourceItemList, appPackageFamilyName, auditInfo)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Requests access to enterprise-protected content for a specific app.
     * @param {IIterable<IStorageItem>} sourceItemList An array of files to that you want to grant access to.
     * @param {HSTRING} appPackageFamilyName The package name of the app that you want to grant permission to.
     * @param {ProtectionPolicyAuditInfo} auditInfo An audit info object; an instance of [ProtectionPolicyAuditInfo](protectionpolicyauditinfo.md).
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccesstofilesforappasync
     */
    static RequestAccessToFilesForAppWithMessageAndBehaviorAsync(sourceItemList, appPackageFamilyName, auditInfo, messageFromApp, behavior) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics4.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics4 := IProtectionPolicyManagerStatics4(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics4.RequestAccessToFilesForAppWithMessageAndBehaviorAsync(sourceItemList, appPackageFamilyName, auditInfo, messageFromApp, behavior)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Requests access to enterprise-protected content for a process of an app.
     * @param {IIterable<IStorageItem>} sourceItemList An array of files to that you want to grant access to.
     * @param {Integer} processId The process id of the process that you want to grant the permission to.
     * @param {ProtectionPolicyAuditInfo} auditInfo An audit info object; an instance of [ProtectionPolicyAuditInfo](protectionpolicyauditinfo.md).
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccesstofilesforprocessasync
     */
    static RequestAccessToFilesForProcessAsync(sourceItemList, processId, auditInfo) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics4.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics4 := IProtectionPolicyManagerStatics4(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics4.RequestAccessToFilesForProcessAsync(sourceItemList, processId, auditInfo)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Requests access to enterprise-protected content for a process of an app.
     * @param {IIterable<IStorageItem>} sourceItemList An array of files to that you want to grant access to.
     * @param {Integer} processId The process id of the process that you want to grant the permission to.
     * @param {ProtectionPolicyAuditInfo} auditInfo An audit info object; an instance of [ProtectionPolicyAuditInfo](protectionpolicyauditinfo.md).
     * @param {HSTRING} messageFromApp 
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.requestaccesstofilesforprocessasync
     */
    static RequestAccessToFilesForProcessWithMessageAndBehaviorAsync(sourceItemList, processId, auditInfo, messageFromApp, behavior) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics4.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics4 := IProtectionPolicyManagerStatics4(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics4.RequestAccessToFilesForProcessWithMessageAndBehaviorAsync(sourceItemList, processId, auditInfo, messageFromApp, behavior)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Indicates whether a file needs to be protected by the enterprise identity.
     * @remarks
     * Your code can call this method to avoid encrypting files that don’t need to be encrypted such as exe, dll, and other build artifacts. This lowers the risk of those files being inaccessible to other users of a computer and lowers performance cost for unnecessarily encrypting files.
     * @param {IStorageItem} target The file that you want to know whether to protect.
     * @param {HSTRING} identity The enterprise identity.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.isfileprotectionrequiredasync
     */
    static IsFileProtectionRequiredAsync(target, identity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics4.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics4 := IProtectionPolicyManagerStatics4(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics4.IsFileProtectionRequiredAsync(target, identity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Indicates whether a file needs to be protected by the enterprise identity.
     * @remarks
     * See the remarks section of this method: [IsFileProtectionRequiredAsync](protectionpolicymanager_isfileprotectionrequiredasync_2068771327.md).
     * @param {IStorageFolder} parentFolder The folder that contains files that you want to know whether to protect.
     * @param {HSTRING} identity The enterprise identity.
     * 
     * >[!IMPORTANT]
     * >Due to a bug in the current implementation of this property, please pass the enterprise identity to the *desiredName* parameter.
     * @param {HSTRING} desiredName The name that you would like to give the file.
     * 
     * >[!IMPORTANT]
     * >Due to a bug in the current implementation of this property, please pass this name to the *identity* parameter.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.isfileprotectionrequiredfornewfileasync
     */
    static IsFileProtectionRequiredForNewFileAsync(parentFolder, identity, desiredName) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics4.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics4 := IProtectionPolicyManagerStatics4(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics4.IsFileProtectionRequiredForNewFileAsync(parentFolder, identity, desiredName)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PrimaryManagedIdentity() {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics4.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics4 := IProtectionPolicyManagerStatics4(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics4.get_PrimaryManagedIdentity()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Gets the parent or primary identity of a given child or secondary identity.
     * @remarks
     * Most policies have a list of identities. The primary identity usually appears first in that list. The secondary identities usually appear after the primary identity. Those secondary identities are, in a sense "owned" by the primary identity.
     * @param {HSTRING} identity The child or secondary identity that you want to use to get the parent or primary identity.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.getprimarymanagedidentityforidentity
     */
    static GetPrimaryManagedIdentityForIdentity(identity) {
        if (!ProtectionPolicyManager.HasProp("__IProtectionPolicyManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.ProtectionPolicyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProtectionPolicyManagerStatics4.IID)
            ProtectionPolicyManager.__IProtectionPolicyManagerStatics4 := IProtectionPolicyManagerStatics4(factoryPtr)
        }

        return ProtectionPolicyManager.__IProtectionPolicyManagerStatics4.GetPrimaryManagedIdentityForIdentity(identity)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Gets or sets the enterprise identity.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.identity
     * @type {HSTRING} 
     */
    Identity {
        get => this.get_Identity()
        set => this.put_Identity(value)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * A value indicating whether or not the shell should decorate a window to show that it is an enterprise window.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicymanager.showenterpriseindicator
     * @type {Boolean} 
     */
    ShowEnterpriseIndicator {
        get => this.get_ShowEnterpriseIndicator()
        set => this.put_ShowEnterpriseIndicator(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Identity(value) {
        if (!this.HasProp("__IProtectionPolicyManager")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyManager := IProtectionPolicyManager(outPtr)
        }

        return this.__IProtectionPolicyManager.put_Identity(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Identity() {
        if (!this.HasProp("__IProtectionPolicyManager")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyManager := IProtectionPolicyManager(outPtr)
        }

        return this.__IProtectionPolicyManager.get_Identity()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowEnterpriseIndicator(value) {
        if (!this.HasProp("__IProtectionPolicyManager2")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyManager2 := IProtectionPolicyManager2(outPtr)
        }

        return this.__IProtectionPolicyManager2.put_ShowEnterpriseIndicator(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowEnterpriseIndicator() {
        if (!this.HasProp("__IProtectionPolicyManager2")) {
            if ((queryResult := this.QueryInterface(IProtectionPolicyManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectionPolicyManager2 := IProtectionPolicyManager2(outPtr)
        }

        return this.__IProtectionPolicyManager2.get_ShowEnterpriseIndicator()
    }

;@endregion Instance Methods
}
