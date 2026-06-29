#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * Walks a stack frame looking for interesting values.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/nn-callobj-icallframewalker
 * @namespace Windows.Win32.System.Com.CallObj
 */
export default struct ICallFrameWalker extends IUnknown {
    /**
     * The interface identifier for ICallFrameWalker
     * @type {Guid}
     */
    static IID := Guid("{08b23919-392d-11d2-b8a4-00c04fb9618a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICallFrameWalker interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnWalkInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICallFrameWalker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Walks through a call frame to look for the specified interface in the call frame. The interface can be manipulated or replaced by paying close attention to the reference count.
     * @param {Pointer<Guid>} iid The IID of the interface to be found.
     * @param {Pointer<Pointer<Void>>} ppvInterface A points to the buffer from which the activation record is to be reconstituted.
     * @param {BOOL} fIn This parameter is nonzero if an interface is inside an [in] or [in, out] parameter.
     * @param {BOOL} fOut This parameter is nonzero if an interface is inside an [out] or [in, out] parameter.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframewalker-onwalkinterface
     */
    OnWalkInterface(iid, ppvInterface, fIn, fOut) {
        ppvInterfaceMarshal := ppvInterface is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, iid, ppvInterfaceMarshal, ppvInterface, BOOL, fIn, BOOL, fOut, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICallFrameWalker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnWalkInterface := CallbackCreate(GetMethod(implObj, "OnWalkInterface"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnWalkInterface)
    }
}
