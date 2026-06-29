#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetCfgComponent.ahk" { INetCfgComponent }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgBindingInterface extends IUnknown {
    /**
     * The interface identifier for INetCfgBindingInterface
     * @type {Guid}
     */
    static IID := Guid("{c0e8ae94-306e-11d1-aacf-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgBindingInterface interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName           : IntPtr
        GetUpperComponent : IntPtr
        GetLowerComponent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgBindingInterface.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszwInterfaceName := 0, "HRESULT")
        return ppszwInterfaceName
    }

    /**
     * 
     * @returns {INetCfgComponent} 
     */
    GetUpperComponent() {
        result := ComCall(4, this, "ptr*", &ppnccItem := 0, "HRESULT")
        return INetCfgComponent(ppnccItem)
    }

    /**
     * 
     * @returns {INetCfgComponent} 
     */
    GetLowerComponent() {
        result := ComCall(5, this, "ptr*", &ppnccItem := 0, "HRESULT")
        return INetCfgComponent(ppnccItem)
    }

    Query(iid) {
        if (INetCfgBindingInterface.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetUpperComponent := CallbackCreate(GetMethod(implObj, "GetUpperComponent"), flags, 2)
        this.vtbl.GetLowerComponent := CallbackCreate(GetMethod(implObj, "GetLowerComponent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetUpperComponent)
        CallbackFree(this.vtbl.GetLowerComponent)
    }
}
