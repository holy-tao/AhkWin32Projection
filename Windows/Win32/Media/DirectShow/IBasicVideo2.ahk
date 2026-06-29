#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBasicVideo.ahk" { IBasicVideo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IBasicVideo2 interface extends the IBasicVideo interface.
 * @see https://learn.microsoft.com/windows/win32/api/control/nn-control-ibasicvideo2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBasicVideo2 extends IBasicVideo {
    /**
     * The interface identifier for IBasicVideo2
     * @type {Guid}
     */
    static IID := Guid("{329bb360-f6ea-11d1-9038-00a0c9697298}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBasicVideo2 interfaces
    */
    struct Vtbl extends IBasicVideo.Vtbl {
        GetPreferredAspectRatio : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBasicVideo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPreferredAspectRatio method retrieves the preferred aspect ratio.
     * @param {Pointer<Integer>} plAspectX Pointer to a value that indicates the x-axis aspect ratio.
     * @param {Pointer<Integer>} plAspectY Pointer to a value that indicates the y-axis aspect ratio.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
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
     * One or both of the parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The renderer does not implement <b>IBasicVideo2</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo2-getpreferredaspectratio
     */
    GetPreferredAspectRatio(plAspectX, plAspectY) {
        plAspectXMarshal := plAspectX is VarRef ? "int*" : "ptr"
        plAspectYMarshal := plAspectY is VarRef ? "int*" : "ptr"

        result := ComCall(39, this, plAspectXMarshal, plAspectX, plAspectYMarshal, plAspectY, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBasicVideo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPreferredAspectRatio := CallbackCreate(GetMethod(implObj, "GetPreferredAspectRatio"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPreferredAspectRatio)
    }
}
