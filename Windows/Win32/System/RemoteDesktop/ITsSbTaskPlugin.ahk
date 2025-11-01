#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITsSbPlugin.ahk

/**
 * Exposes methods that update the queue of tasks for Remote Desktop Connection Broker plugins.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbtaskplugin
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbTaskPlugin extends ITsSbPlugin{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbTaskPlugin
     * @type {Guid}
     */
    static IID => Guid("{fa22ef0f-8705-41be-93bc-44bdbcf1c9c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeTaskPlugin", "SetTaskQueue"]

    /**
     * 
     * @param {ITsSbTaskPluginNotifySink} pITsSbTaskPluginNotifySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskplugin-initializetaskplugin
     */
    InitializeTaskPlugin(pITsSbTaskPluginNotifySink) {
        result := ComCall(5, this, "ptr", pITsSbTaskPluginNotifySink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pszHostName 
     * @param {Integer} SbTaskInfoSize 
     * @param {Pointer<ITsSbTaskInfo>} pITsSbTaskInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskplugin-settaskqueue
     */
    SetTaskQueue(pszHostName, SbTaskInfoSize, pITsSbTaskInfo) {
        pszHostName := pszHostName is String ? BSTR.Alloc(pszHostName).Value : pszHostName

        result := ComCall(6, this, "ptr", pszHostName, "uint", SbTaskInfoSize, "ptr*", pITsSbTaskInfo, "HRESULT")
        return result
    }
}
