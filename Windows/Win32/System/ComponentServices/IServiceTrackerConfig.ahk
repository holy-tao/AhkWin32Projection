#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CSC_TrackerConfig.ahk" { CSC_TrackerConfig }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Configures the tracker property for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain.
 * @remarks
 * The tracker property is a reporting mechanism used by monitoring code to watch which code is running when. It is the reporting mechanism behind the spinning balls in the Component Services administrative tool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicetrackerconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServiceTrackerConfig extends IUnknown {
    /**
     * The interface identifier for IServiceTrackerConfig
     * @type {Guid}
     */
    static IID := Guid("{6c3a3e1d-0ba6-4036-b76f-d0404db816c9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServiceTrackerConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        TrackerConfig : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServiceTrackerConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Configures the tracker property for the enclosed work.
     * @remarks
     * Because no component is associated with this tracker property, tracker activity is reported as arising from a component with the name specified by <i>szTrackerAppName</i>.
     * @param {CSC_TrackerConfig} trackerConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_trackerconfig">CSC_TrackerConfig</a> enumeration.
     * @param {PWSTR} szTrackerAppName The application identifier under which tracker information is reported.
     * @param {PWSTR} szTrackerCtxName The context name under which tracker information is reported.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetrackerconfig-trackerconfig
     */
    TrackerConfig(trackerConfig, szTrackerAppName, szTrackerCtxName) {
        szTrackerAppName := szTrackerAppName is String ? StrPtr(szTrackerAppName) : szTrackerAppName
        szTrackerCtxName := szTrackerCtxName is String ? StrPtr(szTrackerCtxName) : szTrackerCtxName

        result := ComCall(3, this, CSC_TrackerConfig, trackerConfig, "ptr", szTrackerAppName, "ptr", szTrackerCtxName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServiceTrackerConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TrackerConfig := CallbackCreate(GetMethod(implObj, "TrackerConfig"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TrackerConfig)
    }
}
