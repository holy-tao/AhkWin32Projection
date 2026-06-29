#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents information about a filter that is used to control the data that is included in an ISyncChangeBatch object.
 * @remarks
 * If a provider filters the contents of a change batch that it creates, it must create a filtered <b>ISyncChangeBatch</b> object.  The filtered change batch object contains an <b>ISyncFilterInfo</b> object that describes how the contents of the change batch were filtered.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncfilterinfo
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncFilterInfo extends IUnknown {
    /**
     * The interface identifier for ISyncFilterInfo
     * @type {Guid}
     */
    static IID := Guid("{794eaaf8-3f2e-47e6-9728-17e6fcf94cb7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncFilterInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Serialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncFilterInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Serializes the filter data to an array of bytes.
     * @param {Pointer<Integer>} pbBuffer Returns the serialized filter information. Set this value to <b>NULL</b> to request the required size of the buffer.
     * @param {Pointer<Integer>} pcbBuffer Specifies the number of bytes in <i>pbBuffer</i>. Returns the number of bytes required to serialize the filter when <i>pcbBuffer</i> is too small, or the number of bytes written.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>0x800700EA (HRESULT_FROM_WIN32(ERROR_MORE_DATA))</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbBuffer</i> is <b>NULL</b> or <i>pcbBuffer</i> is too small. In this case, the number of bytes required to serialize the filter is returned in <i>pcbBuffer</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfilterinfo-serialize
     */
    Serialize(pbBuffer, pcbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pcbBufferMarshal := pcbBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbBufferMarshal, pbBuffer, pcbBufferMarshal, pcbBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncFilterInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Serialize)
    }
}
