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
     * The IEnumWiaItem::Next method fills an array of pointers to IWiaItem interfaces.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of array elements in the array indicated by the <i>ppIWiaItem</i> parameter.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * On output, this parameter receives the number of interface pointers actually stored in the array indicated by the <i>ppIWiaItem</i> parameter. When the enumeration is complete, this parameter will contain zero.
     * @returns {IWiaItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a>**</b>
     * 
     * Receives the address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> interface pointers. <b>IEnumWiaItem::Next</b> fills this array with interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwiaitem-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppIWiaItem := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return IWiaItem(ppIWiaItem)
    }

    /**
     * The IEnumWiaItem::Skip method skips the specified number of items during an enumeration of available IWiaItem objects.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of items to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the method returns S_OK. If it is unable to skip the specified number of items, it returns S_FALSE. If the method fails, it returns a standard COM error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwiaitem-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumWiaItem::Reset method is used by applications to restart the enumeration of item information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwiaitem-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumWiaItem::Clone method creates an additional instance of the IEnumWiaItem interface and sends back a pointer to it.
     * @returns {IEnumWiaItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwiaitem">IEnumWiaItem</a>**</b>
     * 
     * Pointer  to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwiaitem">IEnumWiaItem</a> interface. Receives the address of the <b>IEnumWiaItem</b> interface instance that <b>IEnumWiaItem::Clone</b> creates.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwiaitem-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWiaItem(ppIEnum)
    }

    /**
     * The IEnumWiaItem::GetCount method returns the number of elements stored by this enumerator.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * Pointer to a <b>ULONG</b> that receives the number of elements in the enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwiaitem-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &celt := 0, "HRESULT")
        return celt
    }
}
