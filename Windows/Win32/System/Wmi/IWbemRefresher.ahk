#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides an entry point through which refreshable objects such as enumerators or refresher objects, can be refreshed.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemrefresher
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemRefresher extends IUnknown {
    /**
     * The interface identifier for IWbemRefresher
     * @type {Guid}
     */
    static IID := Guid("{49353c99-516b-11d1-aea6-00c04fb68820}")

    /**
     * The class identifier for WbemRefresher
     * @type {Guid}
     */
    static CLSID := Guid("{c71566f2-561e-11d1-ad87-00c04fd8fdff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemRefresher interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Refresh : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemRefresher.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWbemRefresher::Refresh method updates all refreshable objects, enumerators, and nested refreshers. The WMI Refresher calls this function in response to a client request to Refresh.
     * @remarks
     * When refreshing enumerators and objects, providers should take as little time as possible. Using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemobjectaccess">IWbemObjectAccess</a> methods and caching property handles for reuse can dramatically improve performance. When updating enumerators, a provider can either remove and re-instantiate all objects, or simply remove and add the changed instances. It is up to you to choose the best approach. In either case, caching instances can improve performance.
     * 
     * The provider should only access the objects and enumerators in a refresher in response to a call to 
     * <b>IWbemRefresher::Refresh</b>. It would, however, be perfectly valid to have a background thread polling for data with which to fill these objects, to prepare for when 
     * <b>Refresh</b> is called.
     * @param {Integer} lFlags Bitmask of flags that modify the behavior of this method.
     * 
     * If <b>WBEM_FLAG_REFRESH_AUTO_RECONNECT</b> is specified and if the connection is broken, the refresher attempts to reconnect to the provider automatically. This is the default behavior for this method.
     * 
     * If you do not want the refresher to attempt to reconnect to the provider, specify <b>WBEM_FLAG_REFRESH_NO_AUTO_RECONNECT</b>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemrefresher-refresh
     */
    Refresh(lFlags) {
        result := ComCall(3, this, "int", lFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemRefresher.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Refresh)
    }
}
