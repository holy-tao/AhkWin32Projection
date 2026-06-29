#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IZoneIdentifier.ahk" { IZoneIdentifier }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IZoneIdentifier2 extends IZoneIdentifier {
    /**
     * The interface identifier for IZoneIdentifier2
     * @type {Guid}
     */
    static IID := Guid("{eb5e760c-09ef-45c0-b510-70830ce31e6a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IZoneIdentifier2 interfaces
    */
    struct Vtbl extends IZoneIdentifier.Vtbl {
        GetLastWriterPackageFamilyName    : IntPtr
        SetLastWriterPackageFamilyName    : IntPtr
        RemoveLastWriterPackageFamilyName : IntPtr
        GetAppZoneId                      : IntPtr
        SetAppZoneId                      : IntPtr
        RemoveAppZoneId                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IZoneIdentifier2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetLastWriterPackageFamilyName() {
        result := ComCall(6, this, PWSTR.Ptr, &packageFamilyName := 0, "HRESULT")
        return packageFamilyName
    }

    /**
     * 
     * @param {PWSTR} packageFamilyName 
     * @returns {HRESULT} 
     */
    SetLastWriterPackageFamilyName(packageFamilyName) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

        result := ComCall(7, this, "ptr", packageFamilyName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveLastWriterPackageFamilyName() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAppZoneId() {
        result := ComCall(9, this, "uint*", &zone := 0, "HRESULT")
        return zone
    }

    /**
     * 
     * @param {Integer} zone 
     * @returns {HRESULT} 
     */
    SetAppZoneId(zone) {
        result := ComCall(10, this, "uint", zone, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAppZoneId() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IZoneIdentifier2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLastWriterPackageFamilyName := CallbackCreate(GetMethod(implObj, "GetLastWriterPackageFamilyName"), flags, 2)
        this.vtbl.SetLastWriterPackageFamilyName := CallbackCreate(GetMethod(implObj, "SetLastWriterPackageFamilyName"), flags, 2)
        this.vtbl.RemoveLastWriterPackageFamilyName := CallbackCreate(GetMethod(implObj, "RemoveLastWriterPackageFamilyName"), flags, 1)
        this.vtbl.GetAppZoneId := CallbackCreate(GetMethod(implObj, "GetAppZoneId"), flags, 2)
        this.vtbl.SetAppZoneId := CallbackCreate(GetMethod(implObj, "SetAppZoneId"), flags, 2)
        this.vtbl.RemoveAppZoneId := CallbackCreate(GetMethod(implObj, "RemoveAppZoneId"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLastWriterPackageFamilyName)
        CallbackFree(this.vtbl.SetLastWriterPackageFamilyName)
        CallbackFree(this.vtbl.RemoveLastWriterPackageFamilyName)
        CallbackFree(this.vtbl.GetAppZoneId)
        CallbackFree(this.vtbl.SetAppZoneId)
        CallbackFree(this.vtbl.RemoveAppZoneId)
    }
}
