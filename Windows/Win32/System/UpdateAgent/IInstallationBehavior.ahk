#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\InstallationRebootBehavior.ahk" { InstallationRebootBehavior }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\InstallationImpact.ahk" { InstallationImpact }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Represents the installation and uninstallation options of an update.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iinstallationbehavior
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IInstallationBehavior extends IDispatch {
    /**
     * The interface identifier for IInstallationBehavior
     * @type {Guid}
     */
    static IID := Guid("{d9a59339-e245-4dbd-9686-4d5763e39624}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInstallationBehavior interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CanRequestUserInput         : IntPtr
        get_Impact                      : IntPtr
        get_RebootBehavior              : IntPtr
        get_RequiresNetworkConnectivity : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInstallationBehavior.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    CanRequestUserInput {
        get => this.get_CanRequestUserInput()
    }

    /**
     * @type {InstallationImpact} 
     */
    Impact {
        get => this.get_Impact()
    }

    /**
     * @type {InstallationRebootBehavior} 
     */
    RebootBehavior {
        get => this.get_RebootBehavior()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RequiresNetworkConnectivity {
        get => this.get_RequiresNetworkConnectivity()
    }

    /**
     * Gets a Boolean value thast indicates whether the installation or uninstallation of an update can prompt for user input.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_canrequestuserinput
     */
    get_CanRequestUserInput() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an InstallationImpact enumeration that indicates how the installation or uninstallation of the update affects the computer.
     * @returns {InstallationImpact} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_impact
     */
    get_Impact() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an InstallationRebootBehavior enumeration that specifies the restart behavior that occurs when you install or uninstall the update.
     * @returns {InstallationRebootBehavior} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_rebootbehavior
     */
    get_RebootBehavior() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the installation or uninstallation of an update requires network connectivity.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_requiresnetworkconnectivity
     */
    get_RequiresNetworkConnectivity() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IInstallationBehavior.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CanRequestUserInput := CallbackCreate(GetMethod(implObj, "get_CanRequestUserInput"), flags, 2)
        this.vtbl.get_Impact := CallbackCreate(GetMethod(implObj, "get_Impact"), flags, 2)
        this.vtbl.get_RebootBehavior := CallbackCreate(GetMethod(implObj, "get_RebootBehavior"), flags, 2)
        this.vtbl.get_RequiresNetworkConnectivity := CallbackCreate(GetMethod(implObj, "get_RequiresNetworkConnectivity"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CanRequestUserInput)
        CallbackFree(this.vtbl.get_Impact)
        CallbackFree(this.vtbl.get_RebootBehavior)
        CallbackFree(this.vtbl.get_RequiresNetworkConnectivity)
    }
}
