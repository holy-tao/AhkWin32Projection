#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITAgentHandler.ahk" { ITAgentHandler }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumAgentHandler interface (tapi3cc.h) provides COM-standard enumeration methods for the ITAgentHandler interface.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-ienumagenthandler
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct IEnumAgentHandler extends IUnknown {
    /**
     * The interface identifier for IEnumAgentHandler
     * @type {Guid}
     */
    static IID := Guid("{587e8c28-9802-11d1-a0a4-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumAgentHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Reset : IntPtr
        Skip  : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumAgentHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IEnumAgentHandler::Next method (tapi3cc.h) gets the next specified number of elements in the enumeration sequence.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumagenthandler">IEnumAgentHandler</a> interface returned by <b>IEnumAgentHandler::Next</b>. The application must call <b>Release</b> on the 
     * <b>IEnumAgentHandler</b> interface to free resources associated with it.
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<ITAgentHandler>} ppElements Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandler">ITAgentHandler</a> interfaces.
     * @param {Pointer<Integer>} pceltFetched Pointer to number of elements actually supplied. May be <b>NULL</b> if <i>celt</i> is one.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method returned <i>celt</i> number of elements.
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
     * Number of elements remaining was less than <i>celt</i>.
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
     * The <i>ppElements</i> parameter is not a valid pointer.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-ienumagenthandler-next
     */
    Next(celt, ppElements, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, ITAgentHandler.Ptr, ppElements, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The IEnumAgentHandler::Next method (tapi3cc.h) resets the enumeration sequence to the beginning.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-ienumagenthandler-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The IEnumAgentHandler::Skip method (tapi3cc.h) skips over the next specified number of elements in the enumeration sequence.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-ienumagenthandler-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumAgentHandler::Clone method (tapi3cc.h) creates another enumerator that contains the same enumeration state as the current one.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumagenthandler">IEnumAgentHandler</a> interface returned by <b>IEnumAgentHandler::Clone</b>. The application must call <b>Release</b> on the 
     * <b>IEnumAgentHandler</b> interface to free resources associated with it.
     * @returns {IEnumAgentHandler} Pointer to new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumagenthandler">IEnumAgentHandler</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-ienumagenthandler-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumAgentHandler(ppEnum)
    }

    Query(iid) {
        if (IEnumAgentHandler.IID.Equals(iid)) {
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
