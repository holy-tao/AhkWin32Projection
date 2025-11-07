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
     * 
     * @param {Integer} celt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {IWiaPropertyStorage} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_dev_info-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &rgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return IWiaPropertyStorage(rgelt)
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_dev_info-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_dev_info-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumWIA_DEV_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_dev_info-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWIA_DEV_INFO(ppIEnum)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwia_dev_info-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &celt := 0, "HRESULT")
        return celt
    }
}
