#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Each Windows Image Acquisition (WIA) hardware device is represented to an application as a hierarchical tree of IWiaItem objects.
 * @remarks
 * 
  * Some of the methods of the <b>IWiaItem</b> interface are valid only on the root item of the device's tree. Other methods are valid on all items. The methods are grouped as follows:
  * 
  * <table class="clsStd">
  * <tr>
  * <td>Valid On Root Item Only</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-devicecommand">IWiaItem::DeviceCommand</a>
  * </td>
  * </tr>
  * <tr>
  * <td> </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-devicedlg">IWiaItem::DeviceDlg</a>
  * </td>
  * </tr>
  * <tr>
  * <td> </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-enumdevicecapabilities">IWiaItem::EnumDeviceCapabilities</a>
  * </td>
  * </tr>
  * <tr>
  * <td> </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-enumregistereventinfo">IWiaItem::EnumRegisterEventInfo</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Valid On All Items</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-analyzeitem">IWiaItem::AnalyzeItem</a>
  * </td>
  * </tr>
  * <tr>
  * <td> </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-createchilditem">IWiaItem::CreateChildItem</a>
  * </td>
  * </tr>
  * <tr>
  * <td> </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-deleteitem">IWiaItem::DeleteItem</a>
  * </td>
  * </tr>
  * <tr>
  * <td> </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-enumchilditems">IWiaItem::EnumChildItems</a>
  * </td>
  * </tr>
  * <tr>
  * <td> </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-finditembyname">IWiaItem::FindItemByName</a>
  * </td>
  * </tr>
  * <tr>
  * <td> </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-getitemtype">IWiaItem::GetItemType</a>
  * </td>
  * </tr>
  * <tr>
  * <td> </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiaitem-getrootitem">IWiaItem::GetRootItem</a>
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * The <b>IWiaItem</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
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
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-iwiaitem
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaItem
     * @type {Guid}
     */
    static IID => Guid("{4db1ad10-3391-11d2-9a33-00c04fa36145}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemType", "AnalyzeItem", "EnumChildItems", "DeleteItem", "CreateChildItem", "EnumRegisterEventInfo", "FindItemByName", "DeviceDlg", "DeviceCommand", "GetRootItem", "EnumDeviceCapabilities", "DumpItemData", "DumpDrvItemData", "DumpTreeItemData", "Diagnostic"]

    /**
     * 
     * @param {Pointer<Integer>} pItemType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-getitemtype
     */
    GetItemType(pItemType) {
        pItemTypeMarshal := pItemType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pItemTypeMarshal, pItemType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-analyzeitem
     */
    AnalyzeItem(lFlags) {
        result := ComCall(4, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumWiaItem>} ppIEnumWiaItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-enumchilditems
     */
    EnumChildItems(ppIEnumWiaItem) {
        result := ComCall(5, this, "ptr*", ppIEnumWiaItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-deleteitem
     */
    DeleteItem(lFlags) {
        result := ComCall(6, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrItemName 
     * @param {BSTR} bstrFullItemName 
     * @param {Pointer<IWiaItem>} ppIWiaItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-createchilditem
     */
    CreateChildItem(lFlags, bstrItemName, bstrFullItemName, ppIWiaItem) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(7, this, "int", lFlags, "ptr", bstrItemName, "ptr", bstrFullItemName, "ptr*", ppIWiaItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<Guid>} pEventGUID 
     * @param {Pointer<IEnumWIA_DEV_CAPS>} ppIEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-enumregistereventinfo
     */
    EnumRegisterEventInfo(lFlags, pEventGUID, ppIEnum) {
        result := ComCall(8, this, "int", lFlags, "ptr", pEventGUID, "ptr*", ppIEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrFullItemName 
     * @param {Pointer<IWiaItem>} ppIWiaItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-finditembyname
     */
    FindItemByName(lFlags, bstrFullItemName, ppIWiaItem) {
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(9, this, "int", lFlags, "ptr", bstrFullItemName, "ptr*", ppIWiaItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} lFlags 
     * @param {Integer} lIntent 
     * @param {Pointer<Integer>} plItemCount 
     * @param {Pointer<Pointer<IWiaItem>>} ppIWiaItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-devicedlg
     */
    DeviceDlg(hwndParent, lFlags, lIntent, plItemCount, ppIWiaItem) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        plItemCountMarshal := plItemCount is VarRef ? "int*" : "ptr"
        ppIWiaItemMarshal := ppIWiaItem is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", hwndParent, "int", lFlags, "int", lIntent, plItemCountMarshal, plItemCount, ppIWiaItemMarshal, ppIWiaItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<Guid>} pCmdGUID 
     * @param {Pointer<IWiaItem>} pIWiaItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-devicecommand
     */
    DeviceCommand(lFlags, pCmdGUID, pIWiaItem) {
        result := ComCall(11, this, "int", lFlags, "ptr", pCmdGUID, "ptr*", pIWiaItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWiaItem>} ppIWiaItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-getrootitem
     */
    GetRootItem(ppIWiaItem) {
        result := ComCall(12, this, "ptr*", ppIWiaItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IEnumWIA_DEV_CAPS>} ppIEnumWIA_DEV_CAPS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-enumdevicecapabilities
     */
    EnumDeviceCapabilities(lFlags, ppIEnumWIA_DEV_CAPS) {
        result := ComCall(13, this, "int", lFlags, "ptr*", ppIEnumWIA_DEV_CAPS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-dumpitemdata
     */
    DumpItemData(bstrData) {
        result := ComCall(14, this, "ptr", bstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-dumpdrvitemdata
     */
    DumpDrvItemData(bstrData) {
        result := ComCall(15, this, "ptr", bstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-dumptreeitemdata
     */
    DumpTreeItemData(bstrData) {
        result := ComCall(16, this, "ptr", bstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulSize 
     * @param {Pointer<Integer>} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitem-diagnostic
     */
    Diagnostic(ulSize, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(17, this, "uint", ulSize, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }
}
