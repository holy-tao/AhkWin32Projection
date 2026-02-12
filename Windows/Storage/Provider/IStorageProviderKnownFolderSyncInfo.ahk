#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\StorageProviderKnownFolderEntry.ahk
#Include .\StorageProviderKnownFolderSyncRequestedHandler.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface that a cloud files provider implements to provide information about the sync status of known folders.
 * @remarks
 * File Explorer obtains an instance of **IStorageProviderKnownFolderSyncInfoSource** for a given provider by calling [GetKnownFolderSyncInfoSource](istorageproviderknownfoldersyncinfosourcefactory_getknownfoldersyncinfosource_1598084472.md).
 * 
 * This interface provides a [KnownFolderSyncInfoChanged](istorageproviderknownfoldersyncinfosource_knownfoldersyncinfochanged.md) event, which the app raises when any property or folder status changes, including the display name. The cloud files provider should not expect **GetKnownFolderSyncInfoSource** to be called immediately after raising the event. File Explorer will only request a new object as it's needed.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderknownfoldersyncinfosource
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderKnownFolderSyncInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderKnownFolderSyncInfo
     * @type {Guid}
     */
    static IID => Guid("{98b017ce-ffc1-5b11-ae77-cc17afec1049}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProviderDisplayName", "put_ProviderDisplayName", "get_KnownFolderEntries", "get_SyncRequested", "put_SyncRequested"]

    /**
     * @type {HSTRING} 
     */
    ProviderDisplayName {
        get => this.get_ProviderDisplayName()
        set => this.put_ProviderDisplayName(value)
    }

    /**
     * @type {IVector<StorageProviderKnownFolderEntry>} 
     */
    KnownFolderEntries {
        get => this.get_KnownFolderEntries()
    }

    /**
     * @type {StorageProviderKnownFolderSyncRequestedHandler} 
     */
    SyncRequested {
        get => this.get_SyncRequested()
        set => this.put_SyncRequested(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderDisplayName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ProviderDisplayName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<StorageProviderKnownFolderEntry>} 
     */
    get_KnownFolderEntries() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(StorageProviderKnownFolderEntry, value)
    }

    /**
     * 
     * @returns {StorageProviderKnownFolderSyncRequestedHandler} 
     */
    get_SyncRequested() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderKnownFolderSyncRequestedHandler(value)
    }

    /**
     * 
     * @param {StorageProviderKnownFolderSyncRequestedHandler} value 
     * @returns {HRESULT} 
     */
    put_SyncRequested(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
