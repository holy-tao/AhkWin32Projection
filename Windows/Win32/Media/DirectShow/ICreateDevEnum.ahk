#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IEnumMoniker.ahk" { IEnumMoniker }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ICreateDevEnum interface creates an enumerator for a category of filters, such as video capture devices or audio capture devices.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-icreatedevenum
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct ICreateDevEnum extends IUnknown {
    /**
     * The interface identifier for ICreateDevEnum
     * @type {Guid}
     */
    static IID := Guid("{29840822-5b84-11d0-bd3b-00a0c911ce86}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreateDevEnum interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateClassEnumerator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreateDevEnum.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The CreateClassEnumerator method creates an enumerator for a specified device category.
     * @remarks
     * If the category does not exist or is empty, the return value is S_FALSE, and the <i>ppEnumMoniker</i> parameter receives the value <b>NULL</b>. Therefore, test for the return value S_OK instead of using the <b>SUCCEEDED</b> macro:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * IEnumMoniker *pEnum = NULL;
     * hr = pSysDevEnum-&gt;CreateClassEnumerator(
     *     CLSID_VideoCompressorCategory, &amp;pEnum, 0);
     * if (hr == S_OK) 
     * {
     *     // Safe to dereference pEnum.
     *     pEnum-&gt;Release();
     * }
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * Use the <b>IEnumMoniker</b> interface to enumerate monikers that represent the filters in the device category. Monikers support the <b>IMoniker</b> interface. The monikers created by <b>CreateClassEnumerator</b> also support the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igetcapabilitieskey">IGetCapabilitiesKey</a> interface.
     * @param {Pointer<Guid>} clsidDeviceClass Specifies the class identifier (CLSID) of the device category. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-categories">Filter Categories</a>.
     * @param {Integer} dwFlags Bitwise combination of zero or more flags. If zero, the method enumerates every filter in the category. If any flags are set, the enumeration includes only filters that match the specified flags. The following flags are defined:
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>CDEF_DEVMON_CMGR_DEVICE</td>
     * <td>Enumerate audio or video codecs, using the audio compression manager (ACM) or video compression manager (VCM).</td>
     * </tr>
     * <tr>
     * <td>CDEF_DEVMON_DMO</td>
     * <td>Enumerate DirectX Media Objects (DMOs).</td>
     * </tr>
     * <tr>
     * <td>CDEF_DEVMON_FILTER</td>
     * <td>Enumerate native DirectShow filters.</td>
     * </tr>
     * <tr>
     * <td>CDEF_DEVMON_PNP_DEVICE</td>
     * <td>Enumerate Plug and Play hardware devices.</td>
     * </tr>
     * </table>
     * @returns {IEnumMoniker} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienummoniker">IEnumMoniker</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icreatedevenum-createclassenumerator
     */
    CreateClassEnumerator(clsidDeviceClass, dwFlags) {
        result := ComCall(3, this, Guid.Ptr, clsidDeviceClass, "ptr*", &ppEnumMoniker := 0, "uint", dwFlags, "HRESULT")
        return IEnumMoniker(ppEnumMoniker)
    }

    Query(iid) {
        if (ICreateDevEnum.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateClassEnumerator := CallbackCreate(GetMethod(implObj, "CreateClassEnumerator"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateClassEnumerator)
    }
}
