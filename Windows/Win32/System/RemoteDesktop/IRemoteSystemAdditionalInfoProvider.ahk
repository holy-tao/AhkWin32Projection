#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\WinRT\HSTRING.ahk" { HSTRING }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IRemoteSystemAdditionalInfoProvider extends IUnknown {
    /**
     * The interface identifier for IRemoteSystemAdditionalInfoProvider
     * @type {Guid}
     */
    static IID := Guid("{eeaa3d5f-ec63-4d27-af38-e86b1d7292cb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteSystemAdditionalInfoProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAdditionalInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteSystemAdditionalInfoProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<HSTRING>} deduplicationId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} mapView 
     * @returns {HRESULT} 
     */
    GetAdditionalInfo(deduplicationId, riid, mapView) {
        mapViewMarshal := mapView is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, HSTRING.Ptr, deduplicationId, Guid.Ptr, riid, mapViewMarshal, mapView, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRemoteSystemAdditionalInfoProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAdditionalInfo := CallbackCreate(GetMethod(implObj, "GetAdditionalInfo"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAdditionalInfo)
    }
}
