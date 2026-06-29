#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAzNameResolver.ahk" { IAzNameResolver }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAzObjectPicker.ahk" { IAzObjectPicker }

/**
 * Locates and chooses ADAM principals in Authorization Manager.
 * @remarks
 * An <b>IAzPrincipalLocator</b> object can contain a name resolver and an object picker. A name resolver translates <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifiers</a> (SIDs) into display names. An object picker displays a dialog box that enables a user to select from a list of ADAM principals. The dialog box can appear when a user modifies application groups or roles through the Authorization Manager user interface.
 * 
 * The <b>IAzPrincipalLocator</b> interface must be registered under the following key. <b>HKEY_LOCAL_MACHINE</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>AzMan</b>&#92;<b>ObjectPicker</b></p>Under this registry key, create a subkey with a value of the COM class ID of the <b>IAzPrincipalLocator</b> interface. Authorization Manager supports only one registered principal locator.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazprincipallocator
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzPrincipalLocator extends IDispatch {
    /**
     * The interface identifier for IAzPrincipalLocator
     * @type {Guid}
     */
    static IID := Guid("{e5c3507d-ad6a-4992-9c7f-74ab480b44cc}")

    /**
     * The class identifier for AzPrincipalLocator
     * @type {Guid}
     */
    static CLSID := Guid("{483afb5d-70df-4e16-abdc-a1de4d015a3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzPrincipalLocator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_NameResolver : IntPtr
        get_ObjectPicker : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzPrincipalLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IAzNameResolver} 
     */
    NameResolver {
        get => this.get_NameResolver()
    }

    /**
     * @type {IAzObjectPicker} 
     */
    ObjectPicker {
        get => this.get_ObjectPicker()
    }

    /**
     * Gets a pointer to the IAzNameResolver interface associated with this IAzPrincipalLocator object.
     * @returns {IAzNameResolver} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazprincipallocator-get_nameresolver
     */
    get_NameResolver() {
        result := ComCall(7, this, "ptr*", &ppNameResolver := 0, "HRESULT")
        return IAzNameResolver(ppNameResolver)
    }

    /**
     * Gets a pointer to the IAzObjectPicker interface associated with this IAzPrincipalLocator object.
     * @returns {IAzObjectPicker} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazprincipallocator-get_objectpicker
     */
    get_ObjectPicker() {
        result := ComCall(8, this, "ptr*", &ppObjectPicker := 0, "HRESULT")
        return IAzObjectPicker(ppObjectPicker)
    }

    Query(iid) {
        if (IAzPrincipalLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_NameResolver := CallbackCreate(GetMethod(implObj, "get_NameResolver"), flags, 2)
        this.vtbl.get_ObjectPicker := CallbackCreate(GetMethod(implObj, "get_ObjectPicker"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_NameResolver)
        CallbackFree(this.vtbl.get_ObjectPicker)
    }
}
