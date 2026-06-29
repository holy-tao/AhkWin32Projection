#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPErrorItem.ahk" { IWMPErrorItem }

/**
 * The IWMPErrorItem2 interface provides a method that supplements the IWMPErrorItem interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmperroritem2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPErrorItem2 extends IWMPErrorItem {
    /**
     * The interface identifier for IWMPErrorItem2
     * @type {Guid}
     */
    static IID := Guid("{f75ccec0-c67c-475c-931e-8719870bee7d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPErrorItem2 interfaces
    */
    struct Vtbl extends IWMPErrorItem.Vtbl {
        get_condition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPErrorItem2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    condition {
        get => this.get_condition()
    }

    /**
     * The get_condition method retrieves a value indicating the condition for the error.
     * @remarks
     * The condition code is a value that is used by Microsoft to provide additional information for technical support personnel.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>long</b> set to 0.
     * @param {Pointer<Integer>} plCondition Pointer to a <b>long</b> containing the condition code.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmperroritem2-get_condition
     */
    get_condition(plCondition) {
        plConditionMarshal := plCondition is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plConditionMarshal, plCondition, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPErrorItem2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_condition := CallbackCreate(GetMethod(implObj, "get_condition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_condition)
    }
}
