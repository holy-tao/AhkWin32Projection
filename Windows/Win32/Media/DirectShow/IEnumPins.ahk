#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPin.ahk" { IPin }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates pins on a filter.The IBaseFilter::EnumPins method returns this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ienumpins
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IEnumPins extends IUnknown {
    /**
     * The interface identifier for IEnumPins
     * @type {Guid}
     */
    static IID := Guid("{56a86892-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumPins interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumPins.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method retrieves a specified number of pins in the enumeration sequence.
     * @remarks
     * This method retrieves pointers to the specified number of pins, starting at the current position in the enumeration, and places them in the specified array.
     * 
     * If the method succeeds, the <b>IPin</b> pointers all have outstanding reference counts. Be sure to release them when you are done.
     * 
     * If the number of pins changes, the enumerator is no longer consistent with the filter, and the method returns VFW_E_ENUM_OUT_OF_SYNC. Discard any data obtained from previous calls to the enumerator, because it might be invalid. Update the enumerator by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ienumpins-reset">IEnumPins::Reset</a> method. You can then call the <c>Next</c> method safely.
     * @param {Integer} cPins Number of pins to retrieve.
     * @param {Pointer<IPin>} ppPins Array of size <i>cPins</i> that is filled with <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> pointers. The caller must release the interfaces.
     * @param {Pointer<Integer>} pcFetched Pointer to a variable that receives the number of pins retrieved. Can be <b>NULL</b> if <i>cPins</i> is 1.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Did not retrieve as many pins as requested.
     * 
     * </td>
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
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_ENUM_OUT_OF_SYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter's state has changed and is now inconsistent with the enumerator.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumpins-next
     */
    Next(cPins, ppPins, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cPins, IPin.Ptr, ppPins, pcFetchedMarshal, pcFetched, Int32)
        return result
    }

    /**
     * The Skip method skips over a specified number of pins.
     * @remarks
     * If the number of pins changes, the enumerator is no longer consistent with the filter, and the method returns VFW_E_ENUM_OUT_OF_SYNC. Discard any data obtained from previous calls to the enumerator, because it might be invalid. Update the enumerator by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ienumpins-reset">IEnumPins::Reset</a> method. You can then call the <c>Skip</c> method safely.
     * @param {Integer} cPins Number of pins to skip.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b>
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Skipped past the end of the sequence.
     * 
     * </td>
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
     * <dt><b>VFW_E_ENUM_OUT_OF_SYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter's state has changed and is now inconsistent with the enumerator.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumpins-skip
     */
    Skip(cPins) {
        result := ComCall(4, this, "uint", cPins, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning. (IEnumPins.Reset)
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumpins-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method makes a copy of the enumerator with the same enumeration state.
     * @remarks
     * If the number of pins changes, the enumerator is no longer consistent with the filter, and the method returns VFW_E_ENUM_OUT_OF_SYNC. Discard any data obtained from previous calls to the enumerator, because it might be invalid. Update the enumerator by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ienumpins-reset">IEnumPins::Reset</a> method. You can then call the <c>Clone</c> method safely.
     * @returns {IEnumPins} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumpins">IEnumPins</a> interface of the new enumerator. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumpins-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPins(ppEnum)
    }

    Query(iid) {
        if (IEnumPins.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
