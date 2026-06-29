#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMPDVD.ahk" { IWMPDVD }
#Import ".\IWMPCore.ahk" { IWMPCore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPCore2 interface provides a method that supplements the IWMPCore interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpcore2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPCore2 extends IWMPCore {
    /**
     * The interface identifier for IWMPCore2
     * @type {Guid}
     */
    static IID := Guid("{bc17e5b7-7561-4c18-bb90-17d485775659}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPCore2 interfaces
    */
    struct Vtbl extends IWMPCore.Vtbl {
        get_dvd : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPCore2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IWMPDVD} 
     */
    dvd {
        get => this.get_dvd()
    }

    /**
     * The get_dvd method retrieves a pointer to an IWMPDVD interface.
     * @returns {IWMPDVD} Pointer to a pointer to an <b>IWMPDVD</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore2-get_dvd
     */
    get_dvd() {
        result := ComCall(28, this, "ptr*", &ppDVD := 0, "HRESULT")
        return IWMPDVD(ppDVD)
    }

    Query(iid) {
        if (IWMPCore2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_dvd := CallbackCreate(GetMethod(implObj, "get_dvd"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_dvd)
    }
}
