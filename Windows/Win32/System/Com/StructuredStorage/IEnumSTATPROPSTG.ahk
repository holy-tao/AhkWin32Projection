#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\STATPROPSTG.ahk" { STATPROPSTG }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * The IEnumSTATPROPSTG interface iterates through an array of STATPROPSTG structures containing statistical data about properties in a property set.
 * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nn-propidlbase-ienumstatpropstg
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct IEnumSTATPROPSTG extends IUnknown {
    /**
     * The interface identifier for IEnumSTATPROPSTG
     * @type {Guid}
     */
    static IID := Guid("{00000139-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumSTATPROPSTG interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumSTATPROPSTG.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IEnumSTATPROPSTG::Next method retrieves a specified number of STATPROPSTG structures, that follow subsequently in the enumeration sequence.
     * @param {Integer} celt The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures requested.
     * @param {Pointer<STATPROPSTG>} rgelt An array of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures returned.
     * @param {Pointer<Integer>} pceltFetched The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures  retrieved in the <i>rgelt</i> parameter.
     * @returns {HRESULT} This method supports the following return values.
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
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures returned is equal to the number specified in the <i>celt</i> parameter.
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
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures returned is less than the number specified in the <i>celt</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ienumstatpropstg-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, STATPROPSTG.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, Int32)
        return result
    }

    /**
     * The IEnumSTATPROPSTG::Skip method skips the specified number of STATPROPSTG structures in the enumeration sequence.
     * @remarks
     * A positive value for the <i>celt</i> parameter skips forward in the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structure enumeration. A negative value for the <i>celt</i> parameter skips backward in the <b>STATPROPSTG</b> structure enumeration.
     * @param {Integer} celt The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures to skip.
     * @returns {HRESULT} This method supports the following return values:
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ienumstatpropstg-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, Int32)
        return result
    }

    /**
     * The IEnumSTATPROPSTG::Reset method resets the enumeration sequence to the beginning of the STATPROPSTG structure array.
     * @returns {HRESULT} This method supports the S_OK return value.
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
     * The enumeration sequence was successfully reset to the beginning of the enumeration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ienumstatpropstg-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumSTATPROPSTG::Clone method creates an enumerator that contains the same enumeration state as the current STATPROPSTG structure enumerator.
     * @returns {IEnumSTATPROPSTG} A pointer to the variable that receives the  <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ienumstatpropstg">IEnumSTATPROPSTG</a> interface pointer. 
     * 
     * If the method is unsuccessful, the value of the <i>ppenum</i> parameter is undefined.
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ienumstatpropstg-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSTATPROPSTG(ppenum)
    }

    Query(iid) {
        if (IEnumSTATPROPSTG.IID.Equals(iid)) {
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
