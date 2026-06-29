#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WTS_PROPERTY_VALUE.ahk" { WTS_PROPERTY_VALUE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsProtocolConnectionSettings extends IUnknown {
    /**
     * The interface identifier for IWRdsProtocolConnectionSettings
     * @type {Guid}
     */
    static IID := Guid("{83fcf5d3-f6f4-ea94-9cd2-32f280e1e510}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsProtocolConnectionSettings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetConnectionSetting : IntPtr
        GetConnectionSetting : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsProtocolConnectionSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Guid} PropertyID 
     * @param {Pointer<WTS_PROPERTY_VALUE>} pPropertyEntriesIn 
     * @returns {HRESULT} 
     */
    SetConnectionSetting(PropertyID, pPropertyEntriesIn) {
        result := ComCall(3, this, Guid, PropertyID, WTS_PROPERTY_VALUE.Ptr, pPropertyEntriesIn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} PropertyID 
     * @returns {WTS_PROPERTY_VALUE} 
     */
    GetConnectionSetting(PropertyID) {
        pPropertyEntriesOut := WTS_PROPERTY_VALUE()
        result := ComCall(4, this, Guid, PropertyID, WTS_PROPERTY_VALUE.Ptr, pPropertyEntriesOut, "HRESULT")
        return pPropertyEntriesOut
    }

    Query(iid) {
        if (IWRdsProtocolConnectionSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetConnectionSetting := CallbackCreate(GetMethod(implObj, "SetConnectionSetting"), flags, 3)
        this.vtbl.GetConnectionSetting := CallbackCreate(GetMethod(implObj, "GetConnectionSetting"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetConnectionSetting)
        CallbackFree(this.vtbl.GetConnectionSetting)
    }
}
