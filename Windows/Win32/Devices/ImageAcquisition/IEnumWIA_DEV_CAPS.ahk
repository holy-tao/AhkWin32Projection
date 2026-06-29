#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WIA_DEV_CAP.ahk" { WIA_DEV_CAP }

/**
 * The IEnumWIA_DEV_CAPS interface enumerates the currently available Windows Image Acquisition (WIA) hardware device capabilities. Device capabilities include commands and events that the device supports.
 * @remarks
 * The <b>IEnumWIA_DEV_CAPS</b> interface is a specific implementation for WIA of the standard OLE enumeration interface. For details, see <a href="https://docs.microsoft.com/previous-versions/ms680089(v=vs.85)">IEnumXXXX</a>.
 * 
 * Applications obtain a pointer to the <b>IEnumWIA_DEV_CAPS</b> interface by invoking the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-enumdevicecapabilities">IWiaItem::EnumDeviceCapabilities</a> method.
 * 
 * The <b>IEnumWIA_DEV_CAPS</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods.
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
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nn-wia_xp-ienumwia_dev_caps
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IEnumWIA_DEV_CAPS extends IUnknown {
    /**
     * The interface identifier for IEnumWIA_DEV_CAPS
     * @type {Guid}
     */
    static IID := Guid("{1fcc4287-aca6-11d2-a093-00c04f72dc3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumWIA_DEV_CAPS interfaces
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
            this.vtbl := IEnumWIA_DEV_CAPS.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IEnumWIA_DEV_CAPS::Next method fills an array of pointers to WIA_DEV_CAP structures.
     * @remarks
     * Applications use this method to query the capabilities of each available Windows Image Acquisition (WIA) hardware device. To do so, the application passes a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_dev_cap">WIA_DEV_CAP</a> structures that it allocates. It also passes in the number of array elements in the parameter <i>celt</i>. The <b>IEnumWIA_DEV_CAPS::Next</b> method fills the array with structures. Applications then use the structures to enumerate WIA hardware device capabilities.
     * 
     * WIA device capabilities are defined as events and commands that the device supports. Using the <i>rgelt</i> array, <b>IEnumWIA_DEV_CAPS::Next</b> passes a single structure to the application for each event and command that the device supports.
     * 
     * Note that <b>IEnumWIA_DEV_CAPS::Next</b> dynamically allocates the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_dev_cap">WIA_DEV_CAP</a> structures it provides to applications. Therefore, applications must delete the <b>WIA_DEV_CAP</b> structures they receive through the <i>rgelt</i> parameter. Applications should use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the <i>bstrName</i>, <i>bstrDescription</i>, and <i>bstrIcon</i> fields of all <b>WIA_DEV_CAP</b> structures.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of array elements in the array indicated by the <i>rgelt</i> parameter.
     * @param {Pointer<WIA_DEV_CAP>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_dev_cap">WIA_DEV_CAP</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_dev_cap">WIA_DEV_CAP</a> structures. <b>IEnumWIA_DEV_CAPS::Next</b> fills this array of structures.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * On output, this parameter contains the number of structure pointers actually stored in the array indicated by the <i>rgelt</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_dev_caps-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, WIA_DEV_CAP.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_DEV_CAPS::Skip method skips the specified number of hardware device capabilities during an enumeration of available device capabilities.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of items to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the method returns S_OK. It returns S_FALSE if it could not skip the specified number of device capabilities. If the method fails, it returns a standard COM error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_dev_caps-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_DEV_CAPS::Reset method is used by applications to restart the enumeration of device capabilities.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_dev_caps-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_DEV_CAPS::Clone method creates an additional instance of the IEnumWIA_DEV_CAPS interface and sends back a pointer to it.
     * @remarks
     * Applications must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the pointers they receive through the <i>ppIEnum</i> parameter.
     * @returns {IEnumWIA_DEV_CAPS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a>**</b>
     * 
     * Contains the address of a pointer to the instance of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a> that <b>IEnumWIA_DEV_CAPS::Clone</b> creates.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_dev_caps-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWIA_DEV_CAPS(ppIEnum)
    }

    /**
     * The IEnumWIA_DEV_CAPS::GetCount method returns the number of elements stored by this enumerator.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * Pointer to a <b>ULONG</b> that receives the number of elements in the enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_dev_caps-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &pcelt := 0, "HRESULT")
        return pcelt
    }

    Query(iid) {
        if (IEnumWIA_DEV_CAPS.IID.Equals(iid)) {
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
