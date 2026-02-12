#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the shutdown callback for the plug-in.
 * @remarks
 * Each successful call to <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_startup">WSManPluginStartup</a> will result in a call to this function before the WinRM plug-in DLL is unloaded. It is important to ensure that the WinRM plug-in tracks the number of times that this startup entry point is called so that the plug-in is not shut down prematurely.
 * 
 * This function must ensure that all plug-in threads are shut down before it returns. If the plug-in handles only synchronous operations and all threads report a cancellation result before they return, this function performs only plug-in cleanup. However, for an asynchronous plug-in, any threads that are used to process the plug-in threads, including the ones that just reported the cancellation for all operations, need to be completely shut down. If all of the threads are not shut down, crashes in the DLL might occur because code might be executed after the DLL is unloaded.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsman/nc-wsman-wsman_plugin_shutdown
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_PLUGIN_SHUTDOWN extends IUnknown {

    static sizeof => A_PtrSize

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
     * @param {Pointer<Void>} pluginContext 
     * @param {Integer} flags 
     * @param {Integer} reason 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pluginContext, flags, reason) {
        pluginContextMarshal := pluginContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pluginContextMarshal, pluginContext, "uint", flags, "uint", reason, "uint")
        return result
    }
}
