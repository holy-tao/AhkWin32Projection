#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Ensures that error information can be propagated up the call chain correctly. Automation objects that use the error handling interfaces must implement ISupportErrorInfo.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-isupporterrorinfo
 * @namespace Windows.Win32.System.Com
 */
export default struct ISupportErrorInfo extends IUnknown {
    /**
     * The interface identifier for ISupportErrorInfo
     * @type {Guid}
     */
    static IID := Guid("{df0b3d60-548f-101b-8e65-08002b2bd119}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISupportErrorInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InterfaceSupportsErrorInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISupportErrorInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates whether an interface supports the IErrorInfo interface.
     * @remarks
     * Objects that support the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo">IErrorInfo</a> interface must also implement this interface.
     * 
     * 
     * 
     * Programs that receive an error return value should call <b>QueryInterface</b> to get a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-isupporterrorinfo">ISupportErrorInfo</a> interface, and then call <b>InterfaceSupportsErrorInfo</b> with the <i>riid</i> of the interface that returned the return value. If <b>InterfaceSupportsErrorInfo</b> returns S_FALSE, then the error object does not represent an error returned from the caller, but from somewhere else. In this case, the error object can be considered incorrect and should be discarded.
     * 
     * 
     * 
     * If <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-isupporterrorinfo">ISupportErrorInfo</a> returns S_OK, use the <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a> function to get a pointer to the error object.
     * 
     * 
     * 
     * For an example that demonstrates implementing <b>InterfaceSupportsErrorInfo</b>, see the ErrorInfo.cpp file in the COM Fundamentals Lines sample.
     * @param {Pointer<Guid>} riid An interface identifier (IID).
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface supports <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo">IErrorInfo</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface does not support <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo">IErrorInfo</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-isupporterrorinfo-interfacesupportserrorinfo
     */
    InterfaceSupportsErrorInfo(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISupportErrorInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InterfaceSupportsErrorInfo := CallbackCreate(GetMethod(implObj, "InterfaceSupportsErrorInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InterfaceSupportsErrorInfo)
    }
}
