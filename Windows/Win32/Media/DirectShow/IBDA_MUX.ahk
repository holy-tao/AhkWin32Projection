#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BDA_MUX_PIDLISTITEM.ahk" { BDA_MUX_PIDLISTITEM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a device's Mux Service. The Mux Service is used to specify which packet identifiers (PIDs) in the MPEG transport stream are delivered to a media sink device (MSD).
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_MUX)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_mux
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_MUX extends IUnknown {
    /**
     * The interface identifier for IBDA_MUX
     * @type {Guid}
     */
    static IID := Guid("{942aafec-4c05-4c74-b8eb-8706c2a4943f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_MUX interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetPidList : IntPtr
        GetPidList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_MUX.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the list of packet identifiers (PIDs) that are enabled to go across the Protected Broadcast Driver Architecture (PBDA) interface.
     * @param {Integer} ulPidListCount The number of elements in the <i>pbPidListBuffer</i> array.
     * @param {Pointer<BDA_MUX_PIDLISTITEM>} pbPidListBuffer Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bda-mux-pidlistitem">BDA_MUX_PIDLISTITEM</a> structures.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_mux-setpidlist
     */
    SetPidList(ulPidListCount, pbPidListBuffer) {
        result := ComCall(3, this, "uint", ulPidListCount, BDA_MUX_PIDLISTITEM.Ptr, pbPidListBuffer, "HRESULT")
        return result
    }

    /**
     * Gets the list of packet identifiers (PIDs) that are enabled to go across the Protected Broadcast Driver Architecture (PBDA) interface.
     * @remarks
     * If the <i>pbPidListBuffer</i> array is too small, the method returns <b>E_NOT_SUFFICIENT_BUFFER</b> and sets the required size in the <i>pulPidListCount</i> parameter.
     * @param {Pointer<Integer>} pulPidListCount On input, specifies the size, in array elements, of the <i>pbPidListBuffer</i> array. On output, receives the number of PIDs.
     * @param {Pointer<BDA_MUX_PIDLISTITEM>} pbPidListBuffer Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bda-mux-pidlistitem">BDA_MUX_PIDLISTITEM</a> structures. The method fills in the array with the list of PIDs.
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
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_NOT_SUFFICIENT_BUFFER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pbPidListBuffer</i> array is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_mux-getpidlist
     */
    GetPidList(pulPidListCount, pbPidListBuffer) {
        pulPidListCountMarshal := pulPidListCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulPidListCountMarshal, pulPidListCount, BDA_MUX_PIDLISTITEM.Ptr, pbPidListBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_MUX.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPidList := CallbackCreate(GetMethod(implObj, "SetPidList"), flags, 3)
        this.vtbl.GetPidList := CallbackCreate(GetMethod(implObj, "GetPidList"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPidList)
        CallbackFree(this.vtbl.GetPidList)
    }
}
