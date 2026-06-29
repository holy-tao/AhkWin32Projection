#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPart.ahk" { IPart }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPartsList interface represents a list of parts, each of which is an object with an IPart interface that represents a connector or subunit.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-ipartslist
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IPartsList extends IUnknown {
    /**
     * The interface identifier for IPartsList
     * @type {Guid}
     */
    static IID := Guid("{6daa848c-5eb0-45cc-aea5-998a2cda1ffb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPartsList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        GetPart  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPartsList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetCount method gets the number of parts in the parts list.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the parts count (the number of parts in the parts list).
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipartslist-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The GetPart method gets a part from the parts list.
     * @remarks
     * For a code example that calls the <b>GetPart</b> method, see the implementation of the SelectCaptureDevice function in <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
     * @param {Integer} nIndex The part number of the part to retrieve. If the parts list contains <i>n</i> parts, the parts are numbered 0 to <i>n</i>– 1. Call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-ipartslist-getcount">IPartsList::GetCount</a> method to get the number of parts in the list.
     * @returns {IPart} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipart">IPart</a> interface of the part object. Through this method, the caller obtains a counted reference to the <b>IPart</b> interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetPart</b> call fails,  <i>*ppPart</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipartslist-getpart
     */
    GetPart(nIndex) {
        result := ComCall(4, this, "uint", nIndex, "ptr*", &ppPart := 0, "HRESULT")
        return IPart(ppPart)
    }

    Query(iid) {
        if (IPartsList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetPart := CallbackCreate(GetMethod(implObj, "GetPart"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetPart)
    }
}
