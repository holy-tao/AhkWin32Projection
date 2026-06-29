#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WIA_FORMAT_INFO.ahk" { WIA_FORMAT_INFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use the IEnumWIA_FORMAT_INFO interface to enumerate the format and media type information for a device.
 * @remarks
 * The <b>IEnumWIA_FORMAT_INFO</b> interface is a specific implementation for Windows Image Acquisition (WIA) of the standard Component Object Model (COM) enumeration interface. For details, see <a href="https://docs.microsoft.com/previous-versions/ms680089(v=vs.85)">IEnumXXXX</a>.
 * 
 * Applications obtain a pointer to the <b>IEnumWIA_FORMAT_INFO</b> interface by invoking the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtenumwia_format_info">IWiaDataTransfer::idtEnumWIA_FORMAT_INFO</a> method of an item's <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiadatatransfer">IWiaDataTransfer</a> interface.
 * 
 * The <b>IEnumWIA_FORMAT_INFO</b> interface, like all COM interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>IUnknown Methods</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>
 * </td>
 * <td>Returns pointers to supported interfaces.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a>
 * </td>
 * <td>Increments reference count.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>
 * </td>
 * <td>Decrements reference count.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nn-wia_xp-ienumwia_format_info
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IEnumWIA_FORMAT_INFO extends IUnknown {
    /**
     * The interface identifier for IEnumWIA_FORMAT_INFO
     * @type {Guid}
     */
    static IID := Guid("{81befc5b-656d-44f1-b24c-d41d51b4dc81}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumWIA_FORMAT_INFO interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next     : IntPtr
        Skip     : IntPtr
        Reset    : IntPtr
        Clone    : IntPtr
        GetCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumWIA_FORMAT_INFO.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IEnumWIA_FORMAT_INFO::Next method returns an array of WIA_FORMAT_INFO structures.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of elements requested.
     * @param {Pointer<WIA_FORMAT_INFO>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_format_info">WIA_FORMAT_INFO</a>*</b>
     * 
     * Receives the address of the array of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_format_info">WIA_FORMAT_INFO</a> structures.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * On output, receives the address of a <b>ULONG</b> that contains the number of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_format_info">WIA_FORMAT_INFO</a> structures actually returned in the <i>rgelt</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the enumeration is continuing, this method returns S_OK and sets the value pointed to by <i>pceltFetched</i> to the number of capabilities returned. If the enumeration is complete, it returns S_FALSE and sets the value pointed to by <i>pceltFetched</i> to zero. If the method fails, it returns a standard COM error.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_format_info-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, WIA_FORMAT_INFO.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_FORMAT_INFO::Skip method skips the specified number of structures in the enumeration.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of structures to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns S_OK if it is able to skip the specified number of elements. It returns S_FALSE if it is unable to skip the specified number of elements. If the method fails, it returns a standard COM error.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_format_info-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_FORMAT_INFO::Reset method sets the enumeration back to the first WIA_FORMAT_INFO structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_format_info-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_FORMAT_INFO::Clone method creates an additional instance of the IEnumWIA_FORMAT_INFO interface and returns an interface pointer to the new interface.
     * @remarks
     * Applications must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the interface pointers they receive through the <i>ppIEnum</i> parameter.
     * @returns {IEnumWIA_FORMAT_INFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_format_info">IEnumWIA_FORMAT_INFO</a>**</b>
     * 
     * Pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_format_info">IEnumWIA_FORMAT_INFO</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_format_info-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWIA_FORMAT_INFO(ppIEnum)
    }

    /**
     * The IEnumWIA_FORMAT_INFO::GetCount method returns the number of elements stored by this enumerator.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * Pointer to a <b>ULONG</b> that receives the number of elements in the enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_format_info-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &pcelt := 0, "HRESULT")
        return pcelt
    }

    Query(iid) {
        if (IEnumWIA_FORMAT_INFO.IID.Equals(iid)) {
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
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
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
        CallbackFree(this.vtbl.GetCount)
    }
}
