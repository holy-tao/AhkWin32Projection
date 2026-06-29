#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITsSbTaskInfo.ahk" { ITsSbTaskInfo }
#Import ".\ITsSbTaskPluginNotifySink.ahk" { ITsSbTaskPluginNotifySink }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbPlugin.ahk" { ITsSbPlugin }

/**
 * Exposes methods that update the queue of tasks for Remote Desktop Connection Broker plugins.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbtaskplugin
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbTaskPlugin extends ITsSbPlugin {
    /**
     * The interface identifier for ITsSbTaskPlugin
     * @type {Guid}
     */
    static IID := Guid("{fa22ef0f-8705-41be-93bc-44bdbcf1c9c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbTaskPlugin interfaces
    */
    struct Vtbl extends ITsSbPlugin.Vtbl {
        InitializeTaskPlugin : IntPtr
        SetTaskQueue         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbTaskPlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a task that is in the queue of a Remote Desktop Connection Broker plugin.
     * @param {ITsSbTaskPluginNotifySink} pITsSbTaskPluginNotifySink A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtaskpluginnotifysink">ITsSbTaskPluginNotifySink</a> object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskplugin-initializetaskplugin
     */
    InitializeTaskPlugin(pITsSbTaskPluginNotifySink) {
        result := ComCall(5, this, "ptr", pITsSbTaskPluginNotifySink, "HRESULT")
        return result
    }

    /**
     * Updates a task in the queue of a Remote Desktop Connection Broker plugin.
     * @param {BSTR} pszHostName 
     * @param {Integer} SbTaskInfoSize 
     * @param {Pointer<ITsSbTaskInfo>} pITsSbTaskInfo An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtaskinfo">ITsSbTaskInfo</a> objects.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskplugin-settaskqueue
     */
    SetTaskQueue(pszHostName, SbTaskInfoSize, pITsSbTaskInfo) {
        pszHostName := pszHostName is String ? BSTR.Alloc(pszHostName).Value : pszHostName

        result := ComCall(6, this, BSTR, pszHostName, "uint", SbTaskInfoSize, ITsSbTaskInfo.Ptr, pITsSbTaskInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbTaskPlugin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeTaskPlugin := CallbackCreate(GetMethod(implObj, "InitializeTaskPlugin"), flags, 2)
        this.vtbl.SetTaskQueue := CallbackCreate(GetMethod(implObj, "SetTaskQueue"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeTaskPlugin)
        CallbackFree(this.vtbl.SetTaskQueue)
    }
}
