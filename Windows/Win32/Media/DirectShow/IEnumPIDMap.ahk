#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PID_MAP.ahk" { PID_MAP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumPIDMap interface enumerates a collection of Packet ID (PID) maps.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ienumpidmap
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IEnumPIDMap extends IUnknown {
    /**
     * The interface identifier for IEnumPIDMap
     * @type {Guid}
     */
    static IID := Guid("{afb6c2a2-2c41-11d3-8a60-0000f81e0e4a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumPIDMap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumPIDMap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method retrieves the next n elements in the collection.
     * @param {Integer} cRequest The number of elements to retrieve.
     * @param {Pointer<PID_MAP>} pPIDMap Address of an array allocated by the caller, containing <i>cRequest</i> elements. The array is filled with <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pid-map">PID_MAP</a> structures that describe the PID mapping.
     * @returns {Integer} Pointer to a variable that receives the number of elements actually retrieved. This parameter cannot be <b>NULL</b>. If <i>cRequest</i> equals zero, this parameter receives the total number of items in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ienumpidmap-next
     */
    Next(cRequest, pPIDMap) {
        result := ComCall(3, this, "uint", cRequest, PID_MAP.Ptr, pPIDMap, "uint*", &pcReceived := 0, Int32)
        return pcReceived
    }

    /**
     * The Skip method skips the specified number of elements in the collection.
     * @param {Integer} cRecords Specifies the number of elements to skip.
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
     * Reached the end of the collection.
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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ienumpidmap-skip
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "HRESULT")
        return result
    }

    /**
     * The Reset method moves the iterator to the beginning of the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails,an <b>HRESULT</b> error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ienumpidmap-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a copy the collection.
     * @remarks
     * The caller must release the returned <b>IEnumPIDMap</b> interface.
     * @returns {IEnumPIDMap} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nn-bdaiface-ienumpidmap">IEnumPIDMap</a> interface pointer, representing the new collection. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ienumpidmap-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumPIDMap := 0, "HRESULT")
        return IEnumPIDMap(ppIEnumPIDMap)
    }

    Query(iid) {
        if (IEnumPIDMap.IID.Equals(iid)) {
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
