#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWiaPropertyStorage.ahk
#Include .\IEnumWIA_DEV_INFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumWIA_DEV_INFO interface enumerates the currently available Windows Image Acquisition (WIA) hardware devices and their properties. Device information properties describe the installation and configuration of WIA hardware devices.
 * @remarks
 * 
 * The <b>IEnumWIA_DEV_INFO</b> interface is a specific implementation for WIA of the standard OLE enumeration interface. For details, see <a href="https://docs.microsoft.com/previous-versions/ms680089(v=vs.85)">IEnumXXXX</a>.
 * 
 * Applications obtain a pointer to the <b>IEnumWIA_DEV_INFO</b> interface by invoking the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadevmgr-enumdeviceinfo">IWiaDevMgr::EnumDeviceInfo</a> method.
 * 
 * The <b>IEnumWIA_DEV_INFO</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-ienumwia_dev_info
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IEnumWIA_DEV_INFO extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumWIA_DEV_INFO
     * @type {Guid}
     */
    static IID => Guid("{5e38b83c-8cf1-11d1-bf92-0060081ed811}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone", "GetCount"]

    /**
     * The IEnumWIA_DEV_INFO::Next method fills an array of pointers to IWiaPropertyStorage interfaces.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of array elements in the array indicated by the <i>rgelt</i> parameter.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * On output, this parameter contains the number of interface pointers actually stored in the array indicated by the <i>rgelt</i> parameter.
     * @returns {IWiaPropertyStorage} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiapropertystorage">IWiaPropertyStorage</a>**</b>
     * 
     * Receives the address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiapropertystorage">IWiaPropertyStorage</a> interface pointers. <b>IEnumWIA_DEV_INFO::Next</b> fills this array with interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_dev_info-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &rgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return IWiaPropertyStorage(rgelt)
    }

    /**
     * The IEnumWIA_DEV_INFO::Skip method skips the specified number of hardware devices during an enumeration of available devices.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of devices to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the method returns S_OK. If it is unable to skip the specified number of devices, it returns S_FALSE. If the method fails, it returns a standard COM error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_dev_info-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_DEV_INFO::Reset method is used by applications to restart the enumeration of device information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_dev_info-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_DEV_INFO::Clone method creates an additional instance of the IEnumWIA_DEV_INFO interface and sends back a pointer to it.
     * @returns {IEnumWIA_DEV_INFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_info">IEnumWIA_DEV_INFO</a>**</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_info">IEnumWIA_DEV_INFO</a> interface. This parameter contains a pointer to the <b>IEnumWIA_DEV_INFO</b> interface instance that <b>IEnumWIA_DEV_INFO::Clone</b> creates.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_dev_info-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWIA_DEV_INFO(ppIEnum)
    }

    /**
     * The IEnumWIA_DEV_INFO::GetCount method returns the number of elements stored by this enumerator.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * This parameter points to a <b>ULONG</b> that receives the number of elements in the enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_dev_info-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &celt := 0, "HRESULT")
        return celt
    }
}
