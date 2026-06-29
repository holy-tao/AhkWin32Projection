#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_SIZE_F.ahk" { D2D_SIZE_F }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\ID2D1CommandList.ahk" { ID2D1CommandList }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Converts Direct2D primitives stored in an ID2D1CommandList into a fixed page representation. The print sub-system then consumes the primitives.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1printcontrol
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1PrintControl extends IUnknown {
    /**
     * The interface identifier for ID2D1PrintControl
     * @type {Guid}
     */
    static IID := Guid("{2c1d867d-c290-41c8-ae7e-34a98702e9a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1PrintControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPage : IntPtr
        Close   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1PrintControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Converts Direct2D primitives in the passed-in command list into a fixed page representation for use by the print subsystem.
     * @param {ID2D1CommandList} commandList Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1commandlist">ID2D1CommandList</a>*</b>
     * 
     * The command list that contains the rendering operations.
     * @param {D2D_SIZE_F} pageSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_size_f">D2D_SIZE_F</a></b>
     * 
     * The size of the page to add.
     * @param {IStream} pagePrintTicketStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The print ticket stream.
     * @param {Pointer<Integer>} tag1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * Contains the first label for subsequent drawing operations. This parameter is passed uninitialized. If NULL is specified, no value is retrieved for this parameter.
     * @param {Pointer<Integer>} tag2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * Contains the second label for subsequent drawing operations. This parameter is passed uninitialized. If NULL is specified, no value is retrieved for this parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * <tr>
     * <td>D2DERR_PRINT_JOB_CLOSED</td>
     * <td>The print job is already finished.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1printcontrol-addpage
     */
    AddPage(commandList, pageSize, pagePrintTicketStream, tag1, tag2) {
        tag1Marshal := tag1 is VarRef ? "uint*" : "ptr"
        tag2Marshal := tag2 is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", commandList, D2D_SIZE_F, pageSize, "ptr", pagePrintTicketStream, tag1Marshal, tag1, tag2Marshal, tag2, "HRESULT")
        return result
    }

    /**
     * Passes all remaining resources to the print sub-system, then clean up and close the current print job.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * <tr>
     * <td>D2DERR_PRINT_JOB_CLOSED</td>
     * <td>The print job is already finished.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1printcontrol-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1PrintControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPage := CallbackCreate(GetMethod(implObj, "AddPage"), flags, 6)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPage)
        CallbackFree(this.vtbl.Close)
    }
}
