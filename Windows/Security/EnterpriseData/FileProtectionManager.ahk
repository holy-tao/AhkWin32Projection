#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileProtectionManagerStatics3.ahk
#Include .\IFileProtectionManagerStatics.ahk
#Include .\IFileProtectionManagerStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Provides access to operations that manage files that are protected to an enterprise identity.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class FileProtectionManager extends IInspectable {
;@region Static Methods
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Removes protection from an enterprise-protected file.
     * @param {IStorageItem} target The file to unprotect.
     * @returns {IAsyncOperation<FileProtectionInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.unprotectasync
     */
    static UnprotectAsync(target) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics3.IID)
            FileProtectionManager.__IFileProtectionManagerStatics3 := IFileProtectionManagerStatics3(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics3.UnprotectAsync(target)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Removes protection from an enterprise-protected file.
     * @param {IStorageItem} target The file to unprotect.
     * @param {FileUnprotectOptions} options 
     * @returns {IAsyncOperation<FileProtectionInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.unprotectasync
     */
    static UnprotectWithOptionsAsync(target, options) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics3.IID)
            FileProtectionManager.__IFileProtectionManagerStatics3 := IFileProtectionManagerStatics3(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics3.UnprotectWithOptionsAsync(target, options)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Protect the data in a file to an enterprise identity. The app can then use standard API to read or write from the file.
     * @param {IStorageItem} target The file to be protected.
     * @param {HSTRING} identity The enterprise identity. This is an email address or domain that is managed. Use [ProtectionPolicyManager.IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed before using the identity to protect a file.
     * @returns {IAsyncOperation<FileProtectionInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.protectasync
     */
    static ProtectAsync(target, identity) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics.IID)
            FileProtectionManager.__IFileProtectionManagerStatics := IFileProtectionManagerStatics(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics.ProtectAsync(target, identity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Replicate the file protection of one file onto another file.
     * @param {IStorageItem} source The source file, from which file protection is being copied.
     * @param {IStorageItem} target The target file, to which file protection is being copied.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.copyprotectionasync
     */
    static CopyProtectionAsync(source, target) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics.IID)
            FileProtectionManager.__IFileProtectionManagerStatics := IFileProtectionManagerStatics(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics.CopyProtectionAsync(source, target)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Get the status of an enterprise-protected file.
     * @param {IStorageItem} source The file or folder for which protection status is being queried.
     * @returns {IAsyncOperation<FileProtectionInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.getprotectioninfoasync
     */
    static GetProtectionInfoAsync(source) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics.IID)
            FileProtectionManager.__IFileProtectionManagerStatics := IFileProtectionManagerStatics(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics.GetProtectionInfoAsync(source)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Save an enterprise-protected file as a containerized version, and share it with a specified list of user identities.
     * @param {IStorageFile} protectedFile The protected source file being copied.
     * @returns {IAsyncOperation<ProtectedContainerExportResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.savefileascontainerasync
     */
    static SaveFileAsContainerAsync(protectedFile) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics.IID)
            FileProtectionManager.__IFileProtectionManagerStatics := IFileProtectionManagerStatics(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics.SaveFileAsContainerAsync(protectedFile)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Create an enterprise-protected file in a specified storage item (such as a folder), and load it from a container file.
     * @param {IStorageFile} containerFile The enterprise protected file to be created and loaded.
     * @returns {IAsyncOperation<ProtectedContainerImportResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.loadfilefromcontainerasync
     */
    static LoadFileFromContainerAsync(containerFile) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics.IID)
            FileProtectionManager.__IFileProtectionManagerStatics := IFileProtectionManagerStatics(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics.LoadFileFromContainerAsync(containerFile)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Create an enterprise-protected file in a specified storage item (such as a folder), and load it from a container file.
     * @param {IStorageFile} containerFile The enterprise protected file to be created and loaded.
     * @param {IStorageItem} target The storage item into which to create the enterprise protected file.
     * @returns {IAsyncOperation<ProtectedContainerImportResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.loadfilefromcontainerasync
     */
    static LoadFileFromContainerWithTargetAsync(containerFile, target) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics.IID)
            FileProtectionManager.__IFileProtectionManagerStatics := IFileProtectionManagerStatics(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics.LoadFileFromContainerWithTargetAsync(containerFile, target)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Create an enterprise-protected file.
     * @param {IStorageFolder} parentFolder The folder into which to create the enterprise protected file.
     * @param {HSTRING} desiredName The desired name of the new enterprise protected file.
     * @param {HSTRING} identity The enterprise identity. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @param {Integer} collisionOption A [CreationCollisionOption](../windows.storage/creationcollisionoption.md) value that specifies what to do if *desiredName* already exists.
     * @returns {IAsyncOperation<ProtectedFileCreateResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.createprotectedandopenasync
     */
    static CreateProtectedAndOpenAsync(parentFolder, desiredName, identity, collisionOption) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics.IID)
            FileProtectionManager.__IFileProtectionManagerStatics := IFileProtectionManagerStatics(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics.CreateProtectedAndOpenAsync(parentFolder, desiredName, identity, collisionOption)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Use this property to determine whether the storage file is actually a container with a file contained within it.
     * @param {IStorageFile} file_ The file that you want to determine is a container or not.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.iscontainerasync
     */
    static IsContainerAsync(file_) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics2.IID)
            FileProtectionManager.__IFileProtectionManagerStatics2 := IFileProtectionManagerStatics2(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics2.IsContainerAsync(file_)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Create an enterprise-protected file, and load it from a container file.
     * @param {IStorageFile} containerFile The enterprise protected file to be created and loaded.
     * @param {IStorageItem} target 
     * @param {Integer} collisionOption 
     * @returns {IAsyncOperation<ProtectedContainerImportResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.loadfilefromcontainerasync
     */
    static LoadFileFromContainerWithTargetAndNameCollisionOptionAsync(containerFile, target, collisionOption) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics2.IID)
            FileProtectionManager.__IFileProtectionManagerStatics2 := IFileProtectionManagerStatics2(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics2.LoadFileFromContainerWithTargetAndNameCollisionOptionAsync(containerFile, target, collisionOption)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Save an enterprise-protected file as a containerized version.
     * @param {IStorageFile} protectedFile The protected source file being copied.
     * @param {IIterable<HSTRING>} sharedWithIdentities 
     * @returns {IAsyncOperation<ProtectedContainerExportResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionmanager.savefileascontainerasync
     */
    static SaveFileAsContainerWithSharingAsync(protectedFile, sharedWithIdentities) {
        if (!FileProtectionManager.HasProp("__IFileProtectionManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileProtectionManagerStatics2.IID)
            FileProtectionManager.__IFileProtectionManagerStatics2 := IFileProtectionManagerStatics2(factoryPtr)
        }

        return FileProtectionManager.__IFileProtectionManagerStatics2.SaveFileAsContainerWithSharingAsync(protectedFile, sharedWithIdentities)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
