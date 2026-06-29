#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CONNECTDATA.ahk" { CONNECTDATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Enumerates the current connections for a connectable object.
 * @remarks
 * Connectable objects support the following features: 
 * 
 * 
 * 
 * <ul>
 * <li>Outgoing interfaces, such as event sets
 * </li>
 * <li>The ability to enumerate the IIDs of the outgoing interfaces
 * </li>
 * <li>The ability to connect and disconnect sinks to the object for those outgoing IIDs
 * </li>
 * <li>The ability to enumerate the connections that exist to a particular outgoing interface
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ienumconnections
 * @namespace Windows.Win32.System.Com
 */
export default struct IEnumConnections extends IUnknown {
    /**
     * The interface identifier for IEnumConnections
     * @type {Guid}
     */
    static IID := Guid("{b196b287-bab4-101a-b69c-00aa00341d07}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumConnections interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumConnections.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the specified number of items in the enumeration sequence. (IEnumConnections.Next)
     * @remarks
     * After this method returns successfully, the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> (see the <b>pUnk</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-connectdata">CONNECTDATA</a>) for each element in the array. If <i>cConnections</i> is greater than one, the caller must also pass a non-NULL pointer to <i>lpcFetched</i> to get the number of pointers it has to be released.
     * 
     * E_NOTIMPL is not allowed as a return value. If an error value is returned, no entries in the array are valid on exit, and therefore no release is required.
     * @param {Integer} cConnections The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
     * @param {Pointer<CONNECTDATA>} rgcd An array of enumerated items.
     * 
     * The enumerator is responsible for allocating any memory, and the caller is responsible for freeing it. If <i>celt</i> is greater than 1, the caller must also pass a non-NULL pointer passed to <i>pceltFetched</i> to know how many pointers to release.
     * @param {Pointer<Integer>} pcFetched The number of items that were retrieved. This parameter is always less than or equal to the number of items requested.
     * @returns {HRESULT} If the method retrieves the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnections-next
     */
    Next(cConnections, rgcd, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cConnections, CONNECTDATA.Ptr, rgcd, pcFetchedMarshal, pcFetched, Int32)
        return result
    }

    /**
     * Skips over the specified number of items in the enumeration sequence. (IEnumConnections.Skip)
     * @param {Integer} cConnections The number of items to be skipped.
     * @returns {HRESULT} If the method skips the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnections-skip
     */
    Skip(cConnections) {
        result := ComCall(4, this, "uint", cConnections, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning. (IEnumConnections.Reset)
     * @remarks
     * There is no guarantee that the same set of objects will be enumerated after the reset operation has completed. A static collection is reset to the beginning, but it can be too expensive for some collections, such as files in a directory, to guarantee this condition.
     * @returns {HRESULT} The return value is S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnections-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new enumerator that contains the same enumeration state as the current one. (IEnumConnections.Clone)
     * @returns {IEnumConnections} A pointer to the cloned enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnections-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumConnections(ppEnum)
    }

    Query(iid) {
        if (IEnumConnections.IID.Equals(iid)) {
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
