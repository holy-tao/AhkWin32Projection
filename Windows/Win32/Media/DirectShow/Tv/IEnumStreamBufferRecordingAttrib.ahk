#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\STREAMBUFFER_ATTRIBUTE.ahk" { STREAMBUFFER_ATTRIBUTE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumStreamBufferRecordingAttrib interface enumerates a collection of attributes on a stream buffer file.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEnumStreamBufferRecordingAttrib)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-ienumstreambufferrecordingattrib
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IEnumStreamBufferRecordingAttrib extends IUnknown {
    /**
     * The interface identifier for IEnumStreamBufferRecordingAttrib
     * @type {Guid}
     */
    static IID := Guid("{c18a9162-1e82-4142-8c73-5690fa62fe33}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumStreamBufferRecordingAttrib interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumStreamBufferRecordingAttrib.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method returns a specified number of attributes in the enumeration sequence.
     * @remarks
     * The caller allocates the array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ns-sbe-streambuffer_attribute">STREAMBUFFER_ATTRIBUTE</a> structures, but the method allocates buffers for the attributes and the attribute names, which are contained in the <b>pszName</b> and <b>pbAttribute</b> members of each structure. The caller must release those buffers, by calling <b>CoTaskMemFree</b>.
     * @param {Integer} cRequest The number of attributes to retrieve.
     * @param {Pointer<STREAMBUFFER_ATTRIBUTE>} pStreamBufferAttribute Pointer to an array of size <i>cRequest</i>. The array is filled with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ns-sbe-streambuffer_attribute">STREAMBUFFER_ATTRIBUTE</a> structures.
     * @returns {Integer} Pointer to a variable that receives the number of attributes that are returned in the <i>pStreamBufferAttribute</i> array. This parameter can be <b>NULL</b> if <i>cRequest</i> is 1.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-ienumstreambufferrecordingattrib-next
     */
    Next(cRequest, pStreamBufferAttribute) {
        result := ComCall(3, this, "uint", cRequest, STREAMBUFFER_ATTRIBUTE.Ptr, pStreamBufferAttribute, "uint*", &pcReceived := 0, "HRESULT")
        return pcReceived
    }

    /**
     * The Skip method skips over a specified number of attributes.
     * @param {Integer} cRecords The number of attributes to skip.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-ienumstreambufferrecordingattrib-skip
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-ienumstreambufferrecordingattrib-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method makes a copy of the enumerator object. The returned object starts with the same enumeration state as the original.
     * @returns {IEnumStreamBufferRecordingAttrib} Address of a variable that receives a pointer to the <b>IEnumStreamBufferRecordingAttrib</b> interface of the new enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-ienumstreambufferrecordingattrib-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumStreamBufferAttrib := 0, "HRESULT")
        return IEnumStreamBufferRecordingAttrib(ppIEnumStreamBufferAttrib)
    }

    Query(iid) {
        if (IEnumStreamBufferRecordingAttrib.IID.Equals(iid)) {
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
