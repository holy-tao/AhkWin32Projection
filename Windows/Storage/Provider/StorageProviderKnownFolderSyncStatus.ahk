#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * An enumeration that describes the sync enrollment status of a known folder.
 * @remarks
 * The **StorageProviderKnownFolderSyncStatus** enumeration is used by the [Status](storageproviderknownfolderentry_status.md) property of the [StorageProviderKnownFolderEntry](storageproviderknownfolderentry.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfoldersyncstatus
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderKnownFolderSyncStatus extends Win32Enum{

    /**
     * A specific known folder is eligible to be backed up by the cloud files provider and is not already enrolled or enrolling.
     * @type {Integer (Int32)}
     */
    static Available => 0

    /**
     * A cloud files provider started the process of enrolling a known folder. Typically, this represents the time during which files are moved from the known folder to the storage provider’s root and the known folder redirection is applied.
     * @type {Integer (Int32)}
     */
    static Enrolling => 1

    /**
     * A specific folder is already backed up by the cloud files provider.
     * @type {Integer (Int32)}
     */
    static Enrolled => 2
}
