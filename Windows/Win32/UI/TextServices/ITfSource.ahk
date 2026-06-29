#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfSource interface is implemented by the TSF manager. It is used by applications and text services to install and uninstall advise sinks.
 * @remarks
 * The TSF manager has different implementations of <b>ITfSource</b>, depending upon how the <b>ITfSource</b> interface is obtained. The difference in the implementations is the types of advise sinks that can be installed with the interface. The different implementations can be obtained from the following objects.
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
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompartment">ITfCompartment
 *             </a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfinputprocessorprofiles">ITfInputProcessorProfiles
 *             </a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itflangbaritem">ITfLangBarItem
 *             </a>
 * </li>
 * </ul>
 * For more information about advise sinks that can be installed by each implementation, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-advisesink">ITfSource::AdviseSink</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfsource
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfSource extends IUnknown {
    /**
     * The interface identifier for ITfSource
     * @type {Guid}
     */
    static IID := Guid("{4ea48a35-60ae-446f-8fd6-e6a8d82459f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AdviseSink   : IntPtr
        UnadviseSink : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfSource::AdviseSink method
     * @param {Pointer<Guid>} riid Identifies the type of advise sink to install.
     * @param {IUnknown} punk The advise sink <b>IUnknown</b> pointer.
     * @returns {Integer} Address of a DWORD value that receives an identifying cookie. This value is used to uninstall the advise sink in a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-unadvisesink">ITfSource::UnadviseSink</a>. Receives (DWORD)-1 if a failure occurs.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfsource-advisesink
     */
    AdviseSink(riid, punk) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr", punk, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * ITfSource::UnadviseSink method
     * @param {Integer} dwCookie A DWORD that identifies the advise sink to uninstall. This value is provided by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-advisesink">ITfSource::AdviseSink</a>.
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
     * The <i>dwCookie</i> value is invalid.
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
     * The advise sink cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfsource-unadvisesink
     */
    UnadviseSink(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AdviseSink := CallbackCreate(GetMethod(implObj, "AdviseSink"), flags, 4)
        this.vtbl.UnadviseSink := CallbackCreate(GetMethod(implObj, "UnadviseSink"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AdviseSink)
        CallbackFree(this.vtbl.UnadviseSink)
    }
}
