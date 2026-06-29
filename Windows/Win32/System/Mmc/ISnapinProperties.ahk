#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\Properties.ahk" { Properties }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\MMC_SNAPIN_PROPERTY.ahk" { MMC_SNAPIN_PROPERTY }
#Import ".\ISnapinPropertiesCallback.ahk" { ISnapinPropertiesCallback }

/**
 * The ISnapinProperties interface enables a snap-in to initialize the snap-in's properties and receive notification when a property is added, changed, or deleted.
 * @see https://learn.microsoft.com/windows/win32/api/mmcobj/nn-mmcobj-isnapinproperties
 * @namespace Windows.Win32.System.Mmc
 */
export default struct ISnapinProperties extends IUnknown {
    /**
     * The interface identifier for ISnapinProperties
     * @type {Guid}
     */
    static IID := Guid("{f7889da9-4a02-4837-bf89-1a6f2a021010}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISnapinProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize         : IntPtr
        QueryPropertyNames : IntPtr
        PropertiesChanged  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISnapinProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Initialize method initializes a snap-in.
     * @param {Properties} pProperties <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/properties-collection">Properties</a> collection that can be used by the snap-in for initialization.
     * @returns {HRESULT} If successful, the return value is S_OK; otherwise, the return value is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/mmcobj/nf-mmcobj-isnapinproperties-initialize
     */
    Initialize(pProperties) {
        result := ComCall(3, this, "ptr", pProperties, "HRESULT")
        return result
    }

    /**
     * The QueryPropertyNames method returns the names of the properties used for the snap-in's configuration.
     * @param {ISnapinPropertiesCallback} pCallback A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmcobj/nn-mmcobj-isnapinpropertiescallback">ISnapinPropertiesCallback</a> interface; the snap-in can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmcobj/nf-mmcobj-isnapinpropertiescallback-addpropertyname">ISnapinPropertiesCallback::AddPropertyName</a> to add the properties.
     * @returns {HRESULT} If successful, the return value is S_OK; otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmcobj/nf-mmcobj-isnapinproperties-querypropertynames
     */
    QueryPropertyNames(pCallback) {
        result := ComCall(4, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Called when a property is added, changed, or deleted.
     * @param {Integer} cProperties The number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmcobj/ns-mmcobj-mmc_snapin_property">MMC_SNAPIN_PROPERTY</a> structures provided by <i>pProperties</i>.
     * @param {Pointer<MMC_SNAPIN_PROPERTY>} pProperties An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmcobj/ns-mmcobj-mmc_snapin_property">MMC_SNAPIN_PROPERTY</a> structures.
     * @returns {HRESULT} If successful, the return value is <b>S_OK</b>; a snap-in can prevent a change or deletion from occurring by returning <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mmcobj/nf-mmcobj-isnapinproperties-propertieschanged
     */
    PropertiesChanged(cProperties, pProperties) {
        result := ComCall(5, this, "int", cProperties, MMC_SNAPIN_PROPERTY.Ptr, pProperties, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISnapinProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.QueryPropertyNames := CallbackCreate(GetMethod(implObj, "QueryPropertyNames"), flags, 2)
        this.vtbl.PropertiesChanged := CallbackCreate(GetMethod(implObj, "PropertiesChanged"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.QueryPropertyNames)
        CallbackFree(this.vtbl.PropertiesChanged)
    }
}
