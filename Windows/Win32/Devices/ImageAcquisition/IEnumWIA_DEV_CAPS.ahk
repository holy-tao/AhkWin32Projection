#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumWIA_DEV_CAPS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumWIA_DEV_CAPS interface enumerates the currently available Windows Image Acquisition (WIA) hardware device capabilities. Device capabilities include commands and events that the device supports.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-ienumwia_dev_caps
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IEnumWIA_DEV_CAPS extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumWIA_DEV_CAPS
     * @type {Guid}
     */
    static IID => Guid("{1fcc4287-aca6-11d2-a093-00c04f72dc3c}")

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
     * The IEnumWIA_DEV_CAPS::Next method fills an array of pointers to WIA_DEV_CAP structures.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_dev_caps-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_dev_caps-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_DEV_CAPS::Reset method is used by applications to restart the enumeration of device capabilities.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_dev_caps-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_DEV_CAPS::Clone method creates an additional instance of the IEnumWIA_DEV_CAPS interface and sends back a pointer to it.
     * @returns {IEnumWIA_DEV_CAPS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a>**</b>
     * 
     * Contains the address of a pointer to the instance of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a> that <b>IEnumWIA_DEV_CAPS::Clone</b> creates.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_dev_caps-clone
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
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_dev_caps-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &pcelt := 0, "HRESULT")
        return pcelt
    }
}
