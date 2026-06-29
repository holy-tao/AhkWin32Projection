#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\STATPROPSETSTG.ahk" { STATPROPSETSTG }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * The IEnumSTATPROPSETSTG interface iterates through an array of STATPROPSETSTG structures containing statistical data about the property sets managed by the current IPropertySetStorage instance.
 * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nn-propidlbase-ienumstatpropsetstg
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct IEnumSTATPROPSETSTG extends IUnknown {
    /**
     * The interface identifier for IEnumSTATPROPSETSTG
     * @type {Guid}
     */
    static IID := Guid("{0000013b-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumSTATPROPSETSTG interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumSTATPROPSETSTG.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IEnumSTATPROPSETSTG::Next method retrieves a specified number of STATPROPSETSTG structures that follow subsequently in the enumeration sequence.
     * @param {Integer} celt The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures requested.
     * @param {Pointer<STATPROPSETSTG>} rgelt An array of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures returned.
     * @param {Pointer<Integer>} pceltFetched The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures  retrieved in the <i>rgelt</i> parameter.
     * @returns {HRESULT} This method supports the following return values:
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
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures returned equals the number specified in the <i>celt</i> parameter.
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
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures returned is less than the number specified in the <i>celt</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ienumstatpropsetstg-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, STATPROPSETSTG.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, Int32)
        return result
    }

    /**
     * The IEnumSTATPROPSETSTG::Skip method skips a specified number of STATPROPSETSTG structures in the enumeration sequence.
     * @remarks
     * A positive value for the <i>celt</i> parameter skips forward in the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structure enumeration. A negative value for the <i>celt</i> parameter skips backward in the <b>STATPROPSETSTG</b> structure enumeration.
     * @param {Integer} celt The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures to skip.
     * @returns {HRESULT} This method supports the following return values:
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ienumstatpropsetstg-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, Int32)
        return result
    }

    /**
     * The IEnumSTATPROPSETSTG::Reset method resets the enumeration sequence to the beginning of the STATPROPSETSTG structure array.
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
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ienumstatpropsetstg-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumSTATPROPSETSTG::Clone method creates an enumerator that contains the same enumeration state as the current STATPROPSETSTG structure enumerator.
     * @returns {IEnumSTATPROPSETSTG} A pointer to the variable that receives the  <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ienumstatpropsetstg">IEnumSTATPROPSETSTG</a> interface pointer. 
     * 
     * If the method does not succeed, the value of the <i>ppenum</i> parameter is undefined.
     * @see https://learn.microsoft.com/windows/win32/api/propidlbase/nf-propidlbase-ienumstatpropsetstg-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSTATPROPSETSTG(ppenum)
    }

    Query(iid) {
        if (IEnumSTATPROPSETSTG.IID.Equals(iid)) {
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
