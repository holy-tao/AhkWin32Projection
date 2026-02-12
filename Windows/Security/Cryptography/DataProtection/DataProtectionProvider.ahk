#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataProtectionProvider.ahk
#Include .\IDataProtectionProviderFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a cryptographic provider that can be used to asynchronously encrypt and decrypt static data or a data stream.
 * @remarks
 * You can use the class to protect data to any of the following:
 * 
 * 
 * + You can use a security descriptor (SID) or a security descriptor definition language (SDDL) string to protect data to an Active Directory (AD) security principal such as an AD group. Any member of the group can decrypt the data.
 * + You can protect data to the local user or computer account.
 * + You can protect data to the credentials (password) used during logon to a website.
 * 
 * 
 * For security descriptors and SDDL strings, you must set the enterprise authentication capability in the manifest. The enterprise authentication capability is restricted to UWP app built with company accounts, and is subject to additional onboarding validation. You should avoid the enterprise authentication capability unless it is absolutely necessary. For more information, see [Registering for a  developer account](/windows/uwp/publish/opening-a-developer-account).
 * For example, the following SID and SDDL providers require the enterprise authentication capability:
 * 
 * + "SID=S-1-5-21-4392301 AND SID=S-1-5-21-3101812"
 * + "SDDL=O:S-1-5-5-0-290724G:SYD:(A;;CCDC;;;S-1-5-5-0-290724)(A;;DC;;;WD)"
 * 
 * These providers do not require the enterprise authentication capability:
 * 
 * + "LOCAL=user"
 * + "LOCAL=machine"
 * + "WEBCREDENTIALS=MyPasswordName"
 * + "WEBCREDENTIALS=MyPasswordName,myweb.com"
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.dataprotection.dataprotectionprovider
 * @namespace Windows.Security.Cryptography.DataProtection
 * @version WindowsRuntime 1.4
 */
class DataProtectionProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataProtectionProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataProtectionProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructor used for encryption operations. Use this constructor before calling the [ProtectAsync](dataprotectionprovider_protectasync_124965623.md) or [ProtectStreamAsync](dataprotectionprovider_protectstreamasync_2066668264.md) methods.
     * @remarks
     * Do not use this constructor before starting a decryption operation. You must use the [DataProtectionProvider()](dataprotectionprovider_dataprotectionprovider_1221375020.md) constructor instead.
     * 
     * For security descriptors and SDDL strings, you must set the enterprise authentication capability in the manifest. The enterprise authentication capability is restricted to apps built with company accounts, and is subject to additional onboarding validation. You should avoid the enterprise authentication capability unless it is absolutely necessary.
     * For example, the following SID and SDDL providers require the enterprise authentication capability:
     * 
     * + "SID=S-1-5-21-4392301 AND SID=S-1-5-21-3101812"
     * + "SDDL=O:S-1-5-5-0-290724G:SYD:(A;;CCDC;;;S-1-5-5-0-290724)(A;;DC;;;WD)"
     * 
     * These providers do not require the enterprise authentication capability on either platform:
     * 
     * + "LOCAL=user"
     * + "LOCAL=machine"
     * 
     * These providers do not require the enterprise authentication capability on Windows:
     * 
     * + "WEBCREDENTIALS=MyPasswordName"
     * + "WEBCREDENTIALS=MyPasswordName,myweb.com"
     * @param {HSTRING} protectionDescriptor Contains the protection descriptor that determines the entity to which the data will be encrypted. For more information, see Remarks.
     * @returns {DataProtectionProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.dataprotection.dataprotectionprovider.#ctor
     */
    static CreateOverloadExplicit(protectionDescriptor) {
        if (!DataProtectionProvider.HasProp("__IDataProtectionProviderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.DataProtection.DataProtectionProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataProtectionProviderFactory.IID)
            DataProtectionProvider.__IDataProtectionProviderFactory := IDataProtectionProviderFactory(factoryPtr)
        }

        return DataProtectionProvider.__IDataProtectionProviderFactory.CreateOverloadExplicit(protectionDescriptor)
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * Constructor used for decryption operations. Use this constructor before calling the [UnprotectAsync](dataprotectionprovider_unprotectasync_996207260.md) or [UnprotectStreamAsync](dataprotectionprovider_unprotectstreamasync_908153904.md) methods.
     * @remarks
     * Use this constructor before starting a decryption operation. Do not use this constructor before starting an encryption operation. Use the [DataProtectionProvider(String)](dataprotectionprovider_dataprotectionprovider_290278668.md) method instead.
     * 
     * For security descriptors and SDDL strings, you must set the enterprise authentication capability in the manifest. The enterprise authentication capability is restricted to UWP app built with company accounts, and is subject to additional onboarding validation. You should avoid the enterprise authentication capability unless it is absolutely necessary. For more information, see [Registering for a  developer account](/windows/uwp/publish/opening-a-developer-account).
     * For example, the following SID and SDDL providers require the enterprise authentication capability:
     * 
     * + "SID=S-1-5-21-4392301 AND SID=S-1-5-21-3101812"
     * + "SDDL=O:S-1-5-5-0-290724G:SYD:(A;;CCDC;;;S-1-5-5-0-290724)(A;;DC;;;WD)"
     * 
     * These providers do not require the enterprise authentication capability:
     * 
     * + "LOCAL=user"
     * + "LOCAL=machine"
     * + "WEBCREDENTIALS=MyPasswordName"
     * + "WEBCREDENTIALS=MyPasswordName,myweb.com"
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.DataProtection.DataProtectionProvider")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Asynchronously protects static data.
     * @remarks
     * You must call the [DataProtectionProvider(String)](dataprotectionprovider_dataprotectionprovider_290278668.md) constructor before calling this method.
     * 
     * For security descriptors and SDDL strings, you must set the enterprise authentication capability in the manifest. The enterprise authentication capability is restricted to UWP app built with company accounts, and is subject to additional onboarding validation. You should avoid the enterprise authentication capability unless it is absolutely necessary. For more information, see [Registering for a  developer account](/windows/uwp/publish/opening-a-developer-account).
     * For example, the following SID and SDDL providers require the enterprise authentication capability:
     * 
     * + "SID=S-1-5-21-4392301 AND SID=S-1-5-21-3101812"
     * + "SDDL=O:S-1-5-5-0-290724G:SYD:(A;;CCDC;;;S-1-5-5-0-290724)(A;;DC;;;WD)"
     * 
     * These providers do not require the enterprise authentication capability:
     * 
     * + "LOCAL=user"
     * + "LOCAL=machine"
     * + "WEBCREDENTIALS=MyPasswordName"
     * + "WEBCREDENTIALS=MyPasswordName,myweb.com"
     * @param {IBuffer} data Data to protect.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.dataprotection.dataprotectionprovider.protectasync
     */
    ProtectAsync(data) {
        if (!this.HasProp("__IDataProtectionProvider")) {
            if ((queryResult := this.QueryInterface(IDataProtectionProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataProtectionProvider := IDataProtectionProvider(outPtr)
        }

        return this.__IDataProtectionProvider.ProtectAsync(data)
    }

    /**
     * Asynchronously decrypts static data.
     * @remarks
     * You must call the [DataProtectionProvider()](dataprotectionprovider_dataprotectionprovider_1221375020.md) constructor before calling this method.
     * 
     * For security descriptors and SDDL strings, you must set the enterprise authentication capability in the manifest. The enterprise authentication capability is restricted to UWP app built with company accounts, and is subject to additional onboarding validation. You should avoid the enterprise authentication capability unless it is absolutely necessary. For more information, see [Registering for a  developer account](/windows/uwp/publish/opening-a-developer-account).
     * For example, the following SID and SDDL providers require the enterprise authentication capability:
     * 
     * + "SID=S-1-5-21-4392301 AND SID=S-1-5-21-3101812"
     * + "SDDL=O:S-1-5-5-0-290724G:SYD:(A;;CCDC;;;S-1-5-5-0-290724)(A;;DC;;;WD)"
     * 
     * These providers do not require the enterprise authentication capability:
     * 
     * + "LOCAL=user"
     * + "LOCAL=machine"
     * + "WEBCREDENTIALS=MyPasswordName"
     * + "WEBCREDENTIALS=MyPasswordName,myweb.com"
     * @param {IBuffer} data Data to decrypt.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.dataprotection.dataprotectionprovider.unprotectasync
     */
    UnprotectAsync(data) {
        if (!this.HasProp("__IDataProtectionProvider")) {
            if ((queryResult := this.QueryInterface(IDataProtectionProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataProtectionProvider := IDataProtectionProvider(outPtr)
        }

        return this.__IDataProtectionProvider.UnprotectAsync(data)
    }

    /**
     * Asynchronously protects a data stream.
     * @remarks
     * You must call the [DataProtectionProvider(String)](dataprotectionprovider_dataprotectionprovider_290278668.md) constructor before calling this method.
     * 
     * For security descriptors and SDDL strings, you must set the enterprise authentication capability in the manifest. The enterprise authentication capability is restricted to UWP app built with company accounts, and is subject to additional onboarding validation. You should avoid the enterprise authentication capability unless it is absolutely necessary. For more information, see [Registering for a  developer account](/windows/uwp/publish/opening-a-developer-account).
     * For example, the following SID and SDDL providers require the enterprise authentication capability:
     * 
     * + "SID=S-1-5-21-4392301 AND SID=S-1-5-21-3101812"
     * + "SDDL=O:S-1-5-5-0-290724G:SYD:(A;;CCDC;;;S-1-5-5-0-290724)(A;;DC;;;WD)"
     * 
     * These providers do not require the enterprise authentication capability:
     * 
     * + "LOCAL=user"
     * + "LOCAL=machine"
     * + "WEBCREDENTIALS=MyPasswordName"
     * + "WEBCREDENTIALS=MyPasswordName,myweb.com"
     * @param {IInputStream} src Stream to be protected.
     * @param {IOutputStream} dest Protected stream.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.dataprotection.dataprotectionprovider.protectstreamasync
     */
    ProtectStreamAsync(src, dest) {
        if (!this.HasProp("__IDataProtectionProvider")) {
            if ((queryResult := this.QueryInterface(IDataProtectionProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataProtectionProvider := IDataProtectionProvider(outPtr)
        }

        return this.__IDataProtectionProvider.ProtectStreamAsync(src, dest)
    }

    /**
     * Asynchronously decrypts a data stream.
     * @remarks
     * You must call the [DataProtectionProvider()](dataprotectionprovider_dataprotectionprovider_1221375020.md) constructor before calling this method.
     * 
     * For security descriptors and SDDL strings, you must set the enterprise authentication capability in the manifest. The enterprise authentication capability is restricted to UWP app built with company accounts, and is subject to additional onboarding validation. You should avoid the enterprise authentication capability unless it is absolutely necessary. For more information, see [Registering for a  developer account](/windows/uwp/publish/opening-a-developer-account).
     * For example, the following SID and SDDL providers require the enterprise authentication capability:
     * 
     * + "SID=S-1-5-21-4392301 AND SID=S-1-5-21-3101812"
     * + "SDDL=O:S-1-5-5-0-290724G:SYD:(A;;CCDC;;;S-1-5-5-0-290724)(A;;DC;;;WD)"
     * 
     * These providers do not require the enterprise authentication capability:
     * 
     * + "LOCAL=user"
     * + "LOCAL=machine"
     * + "WEBCREDENTIALS=MyPasswordName"
     * + "WEBCREDENTIALS=MyPasswordName,myweb.com"
     * @param {IInputStream} src Stream to decrypt.
     * @param {IOutputStream} dest Decrypted stream.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.dataprotection.dataprotectionprovider.unprotectstreamasync
     */
    UnprotectStreamAsync(src, dest) {
        if (!this.HasProp("__IDataProtectionProvider")) {
            if ((queryResult := this.QueryInterface(IDataProtectionProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataProtectionProvider := IDataProtectionProvider(outPtr)
        }

        return this.__IDataProtectionProvider.UnprotectStreamAsync(src, dest)
    }

;@endregion Instance Methods
}
