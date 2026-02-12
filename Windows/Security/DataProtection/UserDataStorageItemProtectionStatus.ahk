#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Result of protecting a storage item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdatastorageitemprotectionstatus
 * @namespace Windows.Security.DataProtection
 * @version WindowsRuntime 1.4
 */
class UserDataStorageItemProtectionStatus extends Win32Enum{

    /**
     * Requested protection was successfully applied.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The system does not support protection of the specified storage item.
     * @type {Integer (Int32)}
     */
    static NotProtectable => 1

    /**
     * Requested protection cannot be applied as the data are currently unavailable. For example, changing availability from 'WhileUnlocked' to 'AfterFirstUnlock' is not possible while the device is locked.
     * @type {Integer (Int32)}
     */
    static DataUnavailable => 2
}
