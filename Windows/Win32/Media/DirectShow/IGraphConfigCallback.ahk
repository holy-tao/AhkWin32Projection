#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IGraphConfigCallback interface contains the callback method passed to IGraphConfig::Reconfigure. The caller (an application or filter) implements this interface. For more information, see IGraphConfig.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-igraphconfigcallback
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IGraphConfigCallback extends IUnknown {
    /**
     * The interface identifier for IGraphConfigCallback
     * @type {Guid}
     */
    static IID := Guid("{ade0fd60-d19d-11d2-abf6-00a0c905f375}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGraphConfigCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reconfigure : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGraphConfigCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Reconfigure method is a callback method passed to IGraphConfig::Reconfigure.
     * @remarks
     * If your application or filter calls <b>IGraphConfig::Reconfigure</b>, you must implement this method and pass it as a callback. The <b>IGraphConfig::Reconfigure</b> method obtains a lock on the filter graph before calling your <c>Reconfigure</c> method. Your method then handles all the other details of dynamic graph building.
     * 
     * If this method succeeds, <b>IGraphConfig::Reconfigure</b> tries to put all the filters in the graph back into a running state. If the method fails, <b>IGraphConfig::Reconfigure</b> returns whatever error code this method returned.
     * 
     * This method allows for specialized graph rebuilding. For a more straightforward approach to dynamic graph building, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphconfig-reconnect">IGraphConfig::Reconnect</a>.
     * @param {Pointer<Void>} pvContext Value passed in the <b>IGraphConfig::Reconfigure</b> method's <i>pvContext</i> parameter.
     * @param {Integer} dwFlags Value passed in the <b>IGraphConfig::Reconfigure</b> method's <i>dwFlags</i> parameter.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfigcallback-reconfigure
     */
    Reconfigure(pvContext, dwFlags) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvContextMarshal, pvContext, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGraphConfigCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reconfigure := CallbackCreate(GetMethod(implObj, "Reconfigure"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reconfigure)
    }
}
