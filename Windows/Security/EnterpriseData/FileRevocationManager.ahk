#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileRevocationManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * > [!NOTE]
  * > FileRevocationManager may be unavailable for releases after Windows 10. Instead, use [FileProtectionManager](fileprotectionmanager.md).
  * 
  * Provides access to Selective Wipe operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.filerevocationmanager
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class FileRevocationManager extends IInspectable {
;@region Static Methods
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * > [!NOTE]
     * > [FileRevocationManager](filerevocationmanager.md) may be unavailable for releases after Windows 10. Instead, use [FileProtectionManager](fileprotectionmanager.md).
     * 
     * Protects a file or folder for selective wipe.
     * @remarks
     * You can use the ProtectAsync method to protect a file or folder using Selective Wipe. This identifies the file as protected for your enterprise identifier, such as "example.com", as shown in the previous code example. If you protect a folder using the ProtectAsync method, then all files in that folder inherit the same protection.
     * 
     * [!code-csharp[_Global](../windows.security.enterprisedata/code/SelectiveWipeSnippets/cs/MainPage.xaml.cs#Snippet_Global)]
     * 
     * [!code-csharp[_Protect](../windows.security.enterprisedata/code/SelectiveWipeSnippets/cs/MainPage.xaml.cs#Snippet_Protect)]
     * 
     * The ProtectAsync method requires exclusive access to the file or folder being encrypted, and will fail if another process is using has a handle open to the file or folder.
     * @param {IStorageItem} storageItem The file or folder to protect for selective wipe.
     * @param {HSTRING} enterpriseIdentity The enterprise id that the file or folder is protected for. The *enterpriseIdentity* value must be formatted as an Internationalized Domain Name (IDN) and cannot contain spaces. For example, `contoso.com`.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.filerevocationmanager.protectasync
     */
    static ProtectAsync(storageItem, enterpriseIdentity) {
        if (!FileRevocationManager.HasProp("__IFileRevocationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileRevocationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRevocationManagerStatics.IID)
            FileRevocationManager.__IFileRevocationManagerStatics := IFileRevocationManagerStatics(factoryPtr)
        }

        return FileRevocationManager.__IFileRevocationManagerStatics.ProtectAsync(storageItem, enterpriseIdentity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * > [!NOTE]
     * > [FileRevocationManager](filerevocationmanager.md) may be unavailable for releases after Windows 10. Instead, use [FileProtectionManager](fileprotectionmanager.md).
     * 
     * Copy the selective wipe protection state of a file or folder to a new file or folder.
     * @remarks
     * If you save a new copy of a file as the result of a "save as" operation, the selective wipe protection status is not copied with the file. To protect the file, you must call the CopyProtectionAsync method to copy the existing protection status to the new file. If you copy a protected file using the [CopyAsync](../windows.storage/istoragefile_copyasync_1709017142.md) or [CopyAndReplaceAsync](../windows.storage/istoragefile_copyandreplaceasync_177558079.md) methods, the selective wipe protection status is copied with the file and you do not need to call the CopyProtectionAsync method.
     * 
     * [!code-csharp[_CopyProtection](../windows.security.enterprisedata/code/SelectiveWipeSnippets/cs/MainPage.xaml.cs#Snippet_CopyProtection)]
     * 
     * The CopyProtectionAsync method requires exclusive access to the file or folder being encrypted, and will fail if another process is using has a handle open to the file or folder.
     * @param {IStorageItem} sourceStorageItem The source item to copy the selective wipe protection status from.
     * @param {IStorageItem} targetStorageItem The target item to copy the selective wipe protection status to.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.filerevocationmanager.copyprotectionasync
     */
    static CopyProtectionAsync(sourceStorageItem, targetStorageItem) {
        if (!FileRevocationManager.HasProp("__IFileRevocationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileRevocationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRevocationManagerStatics.IID)
            FileRevocationManager.__IFileRevocationManagerStatics := IFileRevocationManagerStatics(factoryPtr)
        }

        return FileRevocationManager.__IFileRevocationManagerStatics.CopyProtectionAsync(sourceStorageItem, targetStorageItem)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * > [!NOTE]
     * > [FileRevocationManager](filerevocationmanager.md) may be unavailable for releases after Windows 10. Instead, use [FileProtectionManager](fileprotectionmanager.md).
     * 
     * Revokes all files and folders protected for selective wipe for a specified enterprise id.
     * @remarks
     * When your app determines that a user is no longer valid, you can quickly revoke access to all of the files and folders protected for an enterprise identity using the Revoke method, as shown in the following example. The file is not deleted by the Revoke method. The Revoke method puts the file into state where it cannot be accessed. You can add code to your app to delete a file that is inaccessible and has been revoked.
     * @param {HSTRING} enterpriseIdentity Revoke all files and folders protected by selective wipe for this enterprise id. The *enterpriseIdentity* value must be formatted as an Internationalized Domain Name (IDN) and cannot contain spaces. For example, `contoso.com`.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.filerevocationmanager.revoke
     */
    static Revoke(enterpriseIdentity) {
        if (!FileRevocationManager.HasProp("__IFileRevocationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileRevocationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRevocationManagerStatics.IID)
            FileRevocationManager.__IFileRevocationManagerStatics := IFileRevocationManagerStatics(factoryPtr)
        }

        return FileRevocationManager.__IFileRevocationManagerStatics.Revoke(enterpriseIdentity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * > [!NOTE]
     * > [FileRevocationManager](filerevocationmanager.md) may be unavailable for releases after Windows 10. Instead, use [FileProtectionManager](fileprotectionmanager.md).
     * 
     * Gets the selective wipe protection status for a file or folder.
     * @remarks
     * You can use the GetStatusAsync method to determine the Selective Wipe protection status of a file or folder. This will tell you if a file is protected or not, if a file is protected by another user on the computer, and so on. A common use of the GetStatusAsync method is to determine when a protected file should be deleted. For example, when a protected file is revoked, an attempt to access the file contents will result in an "Access is denied" exception. When you encounter that exception, you can use the GetStatusAsync method to determine if the file has been revoked by Selective Wipe and then delete the file if it has, as shown in the following example.
     * 
     * [!code-csharp[_Global](../windows.security.enterprisedata/code/SelectiveWipeSnippets/cs/MainPage.xaml.cs#Snippet_Global)]
     * 
     * [!code-csharp[_GetStatus](../windows.security.enterprisedata/code/SelectiveWipeSnippets/cs/MainPage.xaml.cs#Snippet_GetStatus)]
     * @param {IStorageItem} storageItem The file or folder to get the selective wipe protection status for.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.filerevocationmanager.getstatusasync
     */
    static GetStatusAsync(storageItem) {
        if (!FileRevocationManager.HasProp("__IFileRevocationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileRevocationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRevocationManagerStatics.IID)
            FileRevocationManager.__IFileRevocationManagerStatics := IFileRevocationManagerStatics(factoryPtr)
        }

        return FileRevocationManager.__IFileRevocationManagerStatics.GetStatusAsync(storageItem)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
