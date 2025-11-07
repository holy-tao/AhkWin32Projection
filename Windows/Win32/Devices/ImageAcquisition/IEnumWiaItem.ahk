#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWiaItem.ahk
#Include .\IEnumWiaItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumWiaItem interface is used by applications to enumerate IWiaItem objects in the tree's current folder.
 * @remarks
 * 
  * The <b>IEnumWiaItem</b> interface is a specific implementation for WIA of the standard Component Object Model (COM) enumeration interface. For details, see <a href="https://docs.microsoft.com/previous-versions/ms680089(v=vs.85)">IEnumXXXX</a>.
  * 
  * Applications obtain a pointer to the <b>IEnumWiaItem</b> interface by invoking the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-enumchilditems">IWiaItem::EnumChildItems</a> method.
  * 
  * The <b>IEnumWiaItem</b> interface, like all COM interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
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
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-ienumwiaitem
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IEnumWiaItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumWiaItem
     * @type {Guid}
     */
    static IID => Guid("{5e8383fc-3391-11d2-9a33-00c04fa36145}")

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
     * @returns {IWiaItem} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwiaitem-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppIWiaItem := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return IWiaItem(ppIWiaItem)
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwiaitem-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwiaitem-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumWiaItem} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwiaitem-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWiaItem(ppIEnum)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-ienumwiaitem-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &celt := 0, "HRESULT")
        return celt
    }
}
