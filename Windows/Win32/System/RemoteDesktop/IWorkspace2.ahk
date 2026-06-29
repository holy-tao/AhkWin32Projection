#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWorkspace.ahk" { IWorkspace }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes additional methods that provide information about a connection in RemoteApp and Desktop Connection.
 * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nn-workspaceruntime-iworkspace2
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWorkspace2 extends IWorkspace {
    /**
     * The interface identifier for IWorkspace2
     * @type {Guid}
     */
    static IID := Guid("{96d8d7cf-783e-4286-834c-ebc0e95f783c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWorkspace2 interfaces
    */
    struct Vtbl extends IWorkspace.Vtbl {
        StartRemoteApplicationEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWorkspace2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Not supported. (IWorkspace2.StartRemoteApplicationEx)
     * @remarks
     * <b>StartRemoteApplicationEx</b> contains a number of new features: launching a 3rd party application when the remote desktop first starts, handling multiple remote desktops, and launching with the web-based client UI.
     * @param {BSTR} bstrWorkspaceId A string that contains the ID of the connection  in which to the start the application.
     * @param {BSTR} bstrRequestingAppId A string that contains the ID of an application to launch on the remote desktop.
     * @param {BSTR} bstrRequestingAppFamilyName A string that contains the family name of the application to launch.
     * @param {VARIANT_BOOL} bLaunchIntoImmersiveClient <b>VARIANT_TRUE</b> to make the remote application launch as though it were accessed via the web client, using the modern Remote Desktop protocol. <b>VARIANT_FALSE</b> to make the remote application launch using classic Terminal Server methodology.
     * @param {BSTR} bstrImmersiveClientActivationContext A string containing the context for the specific remote desktop client.
     * @param {Pointer<SAFEARRAY>} psaParams A pointer to an array of <b>BSTR</b> values that contains  parameters to pass to the workspace runtime.
     * 
     * For RDP connections, this parameter contains two strings:
     * 
     * <ul>
     * <li>Serialized RDP file</li>
     * <li>Command line parameters for Remote Desktop Connection client</li>
     * </ul>
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspace2-startremoteapplicationex
     */
    StartRemoteApplicationEx(bstrWorkspaceId, bstrRequestingAppId, bstrRequestingAppFamilyName, bLaunchIntoImmersiveClient, bstrImmersiveClientActivationContext, psaParams) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId
        bstrRequestingAppId := bstrRequestingAppId is String ? BSTR.Alloc(bstrRequestingAppId).Value : bstrRequestingAppId
        bstrRequestingAppFamilyName := bstrRequestingAppFamilyName is String ? BSTR.Alloc(bstrRequestingAppFamilyName).Value : bstrRequestingAppFamilyName
        bstrImmersiveClientActivationContext := bstrImmersiveClientActivationContext is String ? BSTR.Alloc(bstrImmersiveClientActivationContext).Value : bstrImmersiveClientActivationContext

        result := ComCall(6, this, BSTR, bstrWorkspaceId, BSTR, bstrRequestingAppId, BSTR, bstrRequestingAppFamilyName, VARIANT_BOOL, bLaunchIntoImmersiveClient, BSTR, bstrImmersiveClientActivationContext, SAFEARRAY.Ptr, psaParams, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWorkspace2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartRemoteApplicationEx := CallbackCreate(GetMethod(implObj, "StartRemoteApplicationEx"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartRemoteApplicationEx)
    }
}
