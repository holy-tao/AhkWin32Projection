#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumMoniker.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ICreateDevEnum interface creates an enumerator for a category of filters, such as video capture devices or audio capture devices.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-icreatedevenum
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ICreateDevEnum extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateDevEnum
     * @type {Guid}
     */
    static IID => Guid("{29840822-5b84-11d0-bd3b-00a0c911ce86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateClassEnumerator"]

    /**
     * The CreateClassEnumerator method creates an enumerator for a specified device category.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-icreatedevenum-createclassenumerator
     */
    CreateClassEnumerator(clsidDeviceClass, dwFlags) {
        result := ComCall(3, this, "ptr", clsidDeviceClass, "ptr*", &ppEnumMoniker := 0, "uint", dwFlags, "HRESULT")
        return IEnumMoniker(ppEnumMoniker)
    }
}
