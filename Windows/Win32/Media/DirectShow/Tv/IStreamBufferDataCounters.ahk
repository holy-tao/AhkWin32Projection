#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SBE_PIN_DATA.ahk" { SBE_PIN_DATA }

/**
 * The IStreamBufferDataCounters interface returns performance statistics for the Stream Buffer filters. This interface is exposed by the pins on the Stream Buffer Sink filter and the Stream Buffer Source filter.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferDataCounters)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-istreambufferdatacounters
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IStreamBufferDataCounters extends IUnknown {
    /**
     * The interface identifier for IStreamBufferDataCounters
     * @type {Guid}
     */
    static IID := Guid("{9d2a2563-31ab-402e-9a6b-adb903489440}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamBufferDataCounters interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetData   : IntPtr
        ResetData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamBufferDataCounters.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetData method returns performance data for the Stream Buffer Engine.
     * @returns {SBE_PIN_DATA} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ns-sbe-sbe_pin_data">SBE_PIN_DATA</a> structure. The method fills the structure with the current performance data.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferdatacounters-getdata
     */
    GetData() {
        pPinData := SBE_PIN_DATA()
        result := ComCall(3, this, SBE_PIN_DATA.Ptr, pPinData, "HRESULT")
        return pPinData
    }

    /**
     * The ResetData method resets the Stream Buffer Engine's performance counters to zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferdatacounters-resetdata
     */
    ResetData() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStreamBufferDataCounters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 2)
        this.vtbl.ResetData := CallbackCreate(GetMethod(implObj, "ResetData"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetData)
        CallbackFree(this.vtbl.ResetData)
    }
}
