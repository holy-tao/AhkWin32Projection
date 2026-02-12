#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * A delegate that is invoked when a sync operation is requested for a known folder.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfoldersyncrequestedhandler
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderKnownFolderSyncRequestedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for StorageProviderKnownFolderSyncRequestedHandler
     * @type {Guid}
     */
    static IID => Guid("{c4cbb4f5-13dd-5c8e-8b96-336fc30c629b}")

    /**
     * The class identifier for StorageProviderKnownFolderSyncRequestedHandler
     * @type {Guid}
     */
    static CLSID => Guid("{c4cbb4f5-13dd-5c8e-8b96-336fc30c629b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {StorageProviderKnownFolderSyncRequestArgs} args 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(args) {
        result := ComCall(3, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
