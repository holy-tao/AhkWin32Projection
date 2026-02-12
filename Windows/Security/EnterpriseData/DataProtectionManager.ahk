#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataProtectionManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Provides access to operations that manage buffers and streams that are protected to an enterprise identity.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.dataprotectionmanager
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class DataProtectionManager extends IInspectable {
;@region Static Methods
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Protect the data in a buffer to an enterprise identity.
     * @param {IBuffer} data The buffer to be protected.
     * @param {HSTRING} identity The enterprise identity. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @returns {IAsyncOperation<BufferProtectUnprotectResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.dataprotectionmanager.protectasync
     */
    static ProtectAsync(data, identity) {
        if (!DataProtectionManager.HasProp("__IDataProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.DataProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataProtectionManagerStatics.IID)
            DataProtectionManager.__IDataProtectionManagerStatics := IDataProtectionManagerStatics(factoryPtr)
        }

        return DataProtectionManager.__IDataProtectionManagerStatics.ProtectAsync(data, identity)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Removes the protection to an enterprise identity from a buffer.
     * @remarks
     * UnprotectAsync never returns a status of **Unprotected** since it requires that the input resource be protected. (It is not possible to reliably verify that a resource is unprotected.) If your app compares the result to **Unprotected**, it contains a design flaw because it implies that it lost track of whether the buffer is protected.
     * @param {IBuffer} data The buffer to be unprotected.
     * @returns {IAsyncOperation<BufferProtectUnprotectResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.dataprotectionmanager.unprotectasync
     */
    static UnprotectAsync(data) {
        if (!DataProtectionManager.HasProp("__IDataProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.DataProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataProtectionManagerStatics.IID)
            DataProtectionManager.__IDataProtectionManagerStatics := IDataProtectionManagerStatics(factoryPtr)
        }

        return DataProtectionManager.__IDataProtectionManagerStatics.UnprotectAsync(data)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Protect a stream of data to an enterprise identity.
     * @param {IInputStream} unprotectedStream The input, unprotected stream.
     * @param {HSTRING} identity The enterprise identity. This is an email address or domain that is managed. Your app should use [IsIdentityManaged](protectionpolicymanager_isidentitymanaged_906801364.md) to confirm that an email address or domain is managed.
     * @param {IOutputStream} protectedStream The output, protected stream.
     * @returns {IAsyncOperation<DataProtectionInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.dataprotectionmanager.protectstreamasync
     */
    static ProtectStreamAsync(unprotectedStream, identity, protectedStream) {
        if (!DataProtectionManager.HasProp("__IDataProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.DataProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataProtectionManagerStatics.IID)
            DataProtectionManager.__IDataProtectionManagerStatics := IDataProtectionManagerStatics(factoryPtr)
        }

        return DataProtectionManager.__IDataProtectionManagerStatics.ProtectStreamAsync(unprotectedStream, identity, protectedStream)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Removes the protection to an enterprise identity from a stream of data.
     * @remarks
     * See the remarks in the [UnprotectStreamAsync](dataprotectionmanager_unprotectasync_996207260.md) method.
     * @param {IInputStream} protectedStream The input, protected stream.
     * @param {IOutputStream} unprotectedStream The output, unprotected stream.
     * @returns {IAsyncOperation<DataProtectionInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.dataprotectionmanager.unprotectstreamasync
     */
    static UnprotectStreamAsync(protectedStream, unprotectedStream) {
        if (!DataProtectionManager.HasProp("__IDataProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.DataProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataProtectionManagerStatics.IID)
            DataProtectionManager.__IDataProtectionManagerStatics := IDataProtectionManagerStatics(factoryPtr)
        }

        return DataProtectionManager.__IDataProtectionManagerStatics.UnprotectStreamAsync(protectedStream, unprotectedStream)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Get the status of an enterprise protected buffer.
     * @param {IBuffer} protectedData The buffer for which protection status is being queried.
     * @returns {IAsyncOperation<DataProtectionInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.dataprotectionmanager.getprotectioninfoasync
     */
    static GetProtectionInfoAsync(protectedData) {
        if (!DataProtectionManager.HasProp("__IDataProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.DataProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataProtectionManagerStatics.IID)
            DataProtectionManager.__IDataProtectionManagerStatics := IDataProtectionManagerStatics(factoryPtr)
        }

        return DataProtectionManager.__IDataProtectionManagerStatics.GetProtectionInfoAsync(protectedData)
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Get the status of an enterprise protected stream.
     * @param {IInputStream} protectedStream The stream for which protection status is being queried.
     * @returns {IAsyncOperation<DataProtectionInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.dataprotectionmanager.getstreamprotectioninfoasync
     */
    static GetStreamProtectionInfoAsync(protectedStream) {
        if (!DataProtectionManager.HasProp("__IDataProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.DataProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataProtectionManagerStatics.IID)
            DataProtectionManager.__IDataProtectionManagerStatics := IDataProtectionManagerStatics(factoryPtr)
        }

        return DataProtectionManager.__IDataProtectionManagerStatics.GetStreamProtectionInfoAsync(protectedStream)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
