#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!NOTE]
  * > EasEncryptionProviderType may be unavailable for releases after Windows 10.
  * 
  * Describes the type of Exchange ActiveSync encryption provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easencryptionprovidertype
 * @namespace Windows.Security.ExchangeActiveSyncProvisioning
 * @version WindowsRuntime 1.4
 */
class EasEncryptionProviderType extends Win32Enum{

    /**
     * The encryption provider type has not yet been determined.
     * @type {Integer (Int32)}
     */
    static NotEvaluated => 0

    /**
     * The encryption provider is a Windows provider.
     * @type {Integer (Int32)}
     */
    static WindowsEncryption => 1

    /**
     * The encryption provider is a non-Windows provider.
     * @type {Integer (Int32)}
     */
    static OtherEncryption => 2
}
