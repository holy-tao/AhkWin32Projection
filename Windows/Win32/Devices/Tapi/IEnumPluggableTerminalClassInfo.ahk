#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITPluggableTerminalClassInfo.ahk" { ITPluggableTerminalClassInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumPluggableTerminalClassInfo interface provides COM-standard enumeration methods for the ITPluggableTerminalClassInfo interface. The ITTerminalSupport2::EnumeratePluggableTerminalClasses method returns a pointer to IEnumPluggableTerminalClassInfo.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-ienumpluggableterminalclassinfo
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct IEnumPluggableTerminalClassInfo extends IUnknown {
    /**
     * The interface identifier for IEnumPluggableTerminalClassInfo
     * @type {Guid}
     */
    static IID := Guid("{4567450c-dbee-4e3f-aaf5-37bf9ebf5e29}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumPluggableTerminalClassInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Reset : IntPtr
        Skip  : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumPluggableTerminalClassInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method gets the next specified number of elements in the enumeration sequence. This method is hidden from Visual Basic and scripting languages. (IEnumPluggableTerminalClassInfo.Next)
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itpluggableterminalclassinfo">ITPluggableTerminalClassInfo</a> interface returned by <b>IEnumPluggableTerminalClassInfo::Next</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>ITPluggableTerminalClassInfo</b> interface to free resources associated with it.
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Integer>} pceltFetched Pointer to number of elements actually supplied. May be <b>NULL</b> if <i>celt</i> is one.
     * @returns {ITPluggableTerminalClassInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itpluggableterminalclassinfo">ITPluggableTerminalClassInfo</a> list of pointers returned.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumpluggableterminalclassinfo-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppElements := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ITPluggableTerminalClassInfo(ppElements)
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning. This method is hidden from Visual Basic and scripting languages. (IEnumPluggableTerminalClassInfo.Reset)
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumpluggableterminalclassinfo-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over the next specified number of elements in the enumeration sequence. This method is hidden from Visual Basic and scripting languages. (IEnumPluggableTerminalClassInfo.Skip)
     * @param {Integer} celt Number of elements to skip.
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
     * Number of elements skipped was <i>celt</i>.
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
     * Number of elements skipped was not <i>celt</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumpluggableterminalclassinfo-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Clone method creates another enumerator that contains the same enumeration state as the current one. This method is hidden from Visual Basic and scripting languages. (IEnumPluggableTerminalClassInfo.Clone)
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumpluggableterminalclassinfo">IEnumPluggableTerminalClassInfo</a> interface returned by <b>IEnumPluggableTerminalClassInfo::Clone</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>IEnumPluggableTerminalClassInfo</b> interface to free resources associated with it.
     * @returns {IEnumPluggableTerminalClassInfo} Pointer to new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumpluggableterminalclassinfo">IEnumPluggableTerminalClassInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumpluggableterminalclassinfo-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPluggableTerminalClassInfo(ppEnum)
    }

    Query(iid) {
        if (IEnumPluggableTerminalClassInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Clone)
    }
}
