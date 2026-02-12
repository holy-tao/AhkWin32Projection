#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISysStorageProviderHttpRequestProvider.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ISysStorageProviderEventSource.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * For internal use only.
  * 
  * > [IMPORTANT]
  * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.implementation.fileexplorer.isysstorageproviderhandlerfactory
 * @namespace Windows.System.Implementation.FileExplorer
 * @version WindowsRuntime 1.4
 */
class ISysStorageProviderHandlerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISysStorageProviderHandlerFactory
     * @type {Guid}
     */
    static IID => Guid("{ee798431-8213-5e89-a623-14d8c72b8a61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHttpRequestProvider", "GetEventSource"]

    /**
     * For internal use only.
     * 
     * > [IMPORTANT]
     * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
     * @param {HSTRING} syncRootId For internal use only.
     * 
     * > [IMPORTANT]
     * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
     * @returns {ISysStorageProviderHttpRequestProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.implementation.fileexplorer.isysstorageproviderhandlerfactory.gethttprequestprovider
     */
    GetHttpRequestProvider(syncRootId) {
        if(syncRootId is String) {
            pin := HSTRING.Create(syncRootId)
            syncRootId := pin.Value
        }
        syncRootId := syncRootId is Win32Handle ? NumGet(syncRootId, "ptr") : syncRootId

        result := ComCall(6, this, "ptr", syncRootId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISysStorageProviderHttpRequestProvider(result_)
    }

    /**
     * For internal use only.
     * 
     * > [IMPORTANT]
     * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
     * @param {HSTRING} syncRootId For internal use only.
     * 
     * > [IMPORTANT]
     * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
     * @param {HSTRING} eventName For internal use only.
     * 
     * > [IMPORTANT]
     * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
     * @returns {ISysStorageProviderEventSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.implementation.fileexplorer.isysstorageproviderhandlerfactory.geteventsource
     */
    GetEventSource(syncRootId, eventName) {
        if(syncRootId is String) {
            pin := HSTRING.Create(syncRootId)
            syncRootId := pin.Value
        }
        syncRootId := syncRootId is Win32Handle ? NumGet(syncRootId, "ptr") : syncRootId
        if(eventName is String) {
            pin := HSTRING.Create(eventName)
            eventName := pin.Value
        }
        eventName := eventName is Win32Handle ? NumGet(eventName, "ptr") : eventName

        result := ComCall(7, this, "ptr", syncRootId, "ptr", eventName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISysStorageProviderEventSource(result_)
    }
}
