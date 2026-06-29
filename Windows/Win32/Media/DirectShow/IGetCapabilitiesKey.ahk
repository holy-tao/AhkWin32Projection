#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IGetCapabilitiesKey interface enables an application to retrieve the capabilities of a software or hardware codec from the registry, without creating an instance of the encoder filter.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-igetcapabilitieskey
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IGetCapabilitiesKey extends IUnknown {
    /**
     * The interface identifier for IGetCapabilitiesKey
     * @type {Guid}
     */
    static IID := Guid("{a8809222-07bb-48ea-951c-33158100625b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGetCapabilitiesKey interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCapabilitiesKey : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGetCapabilitiesKey.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetCapabilitiesKey method gets a registry key that contains capability information for the codec.
     * @remarks
     * To enumerate the values for the returned key, call <b>RegEnumValue</b>.
     * @returns {HKEY} Receives a handle to the registry key. The caller must close the handle by calling <b>RegCloseKey</b>.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igetcapabilitieskey-getcapabilitieskey
     */
    GetCapabilitiesKey() {
        pHKey := HKEY.Owned()
        result := ComCall(3, this, HKEY.Ptr, pHKey, "HRESULT")
        return pHKey
    }

    Query(iid) {
        if (IGetCapabilitiesKey.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCapabilitiesKey := CallbackCreate(GetMethod(implObj, "GetCapabilitiesKey"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCapabilitiesKey)
    }
}
