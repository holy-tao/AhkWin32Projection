#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfSourceSingle interface is implemented by the TSF manager.
 * @remarks
 * The TSF manager has different implementations of <b>ITfSourceSingle</b>, depending upon how the <b>ITfSourceSingle</b> interface is obtained. The difference in the implementations is the types of advise sinks that can be installed with the interface. The different implementations can be obtained from the following objects.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfthreadmgr">ITfThreadMgr
 *             </a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext
 *             </a>
 * </li>
 * </ul>
 * For more information about advise sinks that can be installed by each implementation, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsourcesingle-advisesinglesink">ITfSourceSingle::AdviseSingleSink</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfsourcesingle
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfSourceSingle extends IUnknown {
    /**
     * The interface identifier for ITfSourceSingle
     * @type {Guid}
     */
    static IID := Guid("{73131f9c-56a9-49dd-b0ee-d046633f7528}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfSourceSingle interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AdviseSingleSink   : IntPtr
        UnadviseSingleSink : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfSourceSingle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfSourceSingle::AdviseSingleSink method
     * @param {Integer} tid Contains a <b>TfClientId</b> value that identifies the client.
     * @param {Pointer<Guid>} riid Identifies the type of advise sink to install.
     * @param {IUnknown} punk Pointer to the advise sink <b>IUnknown</b> pointer.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONNECT_E_CANNOTCONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The advise sink cannot be installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONNECT_E_ADVISELIMIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum number of advise sinks has been reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfsourcesingle-advisesinglesink
     */
    AdviseSingleSink(tid, riid, punk) {
        result := ComCall(3, this, "uint", tid, Guid.Ptr, riid, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * ITfSourceSingle::UnadviseSingleSink method
     * @param {Integer} tid Contains a <b>TfClientId</b> value that identifies the client.
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The advise sink was successfully uninstalled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>tid</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONNECT_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The advise sink is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfsourcesingle-unadvisesinglesink
     */
    UnadviseSingleSink(tid, riid) {
        result := ComCall(4, this, "uint", tid, Guid.Ptr, riid, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfSourceSingle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AdviseSingleSink := CallbackCreate(GetMethod(implObj, "AdviseSingleSink"), flags, 4)
        this.vtbl.UnadviseSingleSink := CallbackCreate(GetMethod(implObj, "UnadviseSingleSink"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AdviseSingleSink)
        CallbackFree(this.vtbl.UnadviseSingleSink)
    }
}
