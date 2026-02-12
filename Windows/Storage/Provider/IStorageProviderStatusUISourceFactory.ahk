#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IStorageProviderStatusUISource.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Returns an instance of IStorageProviderStatusUISource.
 * @remarks
 * Cloud files providers must implement this interface and register the implementation class in the app manifest or registry. Refer to the [sample app](https://github.com/microsoft/Windows-classic-samples/blob/7cbd99ac1d2b4a0beffbaba29ea63d024ceff700/Samples/CloudMirror/CloudMirror/MyStatusUISourceFactory.h) for an example.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderstatusuisourcefactory
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderStatusUISourceFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderStatusUISourceFactory
     * @type {Guid}
     */
    static IID => Guid("{12e46b74-4e5a-58d1-a62f-0376e8ee7dd8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatusUISource"]

    /**
     * Returns the [IStorageProviderStatusUISource](istorageproviderstatusuisource.md) for a cloud files provider.
     * @param {HSTRING} syncRootId The sync root id is created by providers to register as a sync root. For more details, please refer to [Integrate Cloud Storage](/windows/win32/shell/integrate-cloud-storage).
     * @returns {IStorageProviderStatusUISource} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderstatusuisourcefactory.getstatusuisource
     */
    GetStatusUISource(syncRootId) {
        if(syncRootId is String) {
            pin := HSTRING.Create(syncRootId)
            syncRootId := pin.Value
        }
        syncRootId := syncRootId is Win32Handle ? NumGet(syncRootId, "ptr") : syncRootId

        result := ComCall(6, this, "ptr", syncRootId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageProviderStatusUISource(result_)
    }
}
