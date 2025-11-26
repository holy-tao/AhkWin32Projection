#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumWiaItem.ahk
#Include .\IWiaItem.ahk
#Include .\IEnumWIA_DEV_CAPS.ahk
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
     * The IWiaItem::GetItemType method is called by applications to obtain the type information of an item.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * Receives the address of a <b>LONG</b> variable that contains a combination of <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-item-type-flags">WIA Item Type Flags</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-getitemtype
     */
    GetItemType() {
        result := ComCall(3, this, "int*", &pItemType := 0, "HRESULT")
        return pItemType
    }

    /**
     * The IWiaItem::AnalyzeItem method causes the Windows Image Acquisition (WIA) hardware device to acquire and try to detect what data types are present.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Currently unused. Should be set to zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-analyzeitem
     */
    AnalyzeItem(lFlags) {
        result := ComCall(4, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * The IWiaItem::EnumChildItems method creates an enumerator object and passes back a pointer to its IEnumWiaItem interface for non-empty folders in a IWiaItem tree of a Windows Image Acquisition (WIA) device.
     * @returns {IEnumWiaItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwiaitem">IEnumWiaItem</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwiaitem">IEnumWiaItem</a> interface that <b>IWiaItem::EnumChildItems</b> creates.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-enumchilditems
     */
    EnumChildItems() {
        result := ComCall(5, this, "ptr*", &ppIEnumWiaItem := 0, "HRESULT")
        return IEnumWiaItem(ppIEnumWiaItem)
    }

    /**
     * The IWiaItem::DeleteItem method removes the current IWiaItem object from the object tree of the device.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Currently unused. Should be set to zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns S_OK regardless of how many items were deleted. If the method fails, it returns a standard COM error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-deleteitem
     */
    DeleteItem(lFlags) {
        result := ComCall(6, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * The IWiaItem::CreateChildItem method is used by applications to add IWiaItem objects to the IWiaItem tree of a device.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Specifies the WIA item type. Must be set to one of the values listed in <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-item-type-flags">WIA Item Type Flags</a>.
     * @param {BSTR} bstrItemName Type: <b>BSTR</b>
     * 
     * Specifies the WIA item name, such as "Top". You can think of this parameter as being equivalent to a file name.
     * @param {BSTR} bstrFullItemName Type: <b>BSTR</b>
     * 
     * Specifies the full WIA item name. You can think of this parameter as equivalent to a full path to a file, such as "003\Root\Top".
     * @returns {IWiaItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> interface that sets the <b>IWiaItem::CreateChildItem</b> method.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-createchilditem
     */
    CreateChildItem(lFlags, bstrItemName, bstrFullItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(7, this, "int", lFlags, "ptr", bstrItemName, "ptr", bstrFullItemName, "ptr*", &ppIWiaItem := 0, "HRESULT")
        return IWiaItem(ppIWiaItem)
    }

    /**
     * The IWiaItem::EnumRegisterEventInfo method creates an enumerator used to obtain information about events for which an application is registered.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Currently unused. Should be set to zero.
     * @param {Pointer<Guid>} pEventGUID Type: <b>const GUID*</b>
     * 
     * Pointer to an identifier that specifies the hardware event for which you want registration information.
     * @returns {IEnumWIA_DEV_CAPS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-enumregistereventinfo
     */
    EnumRegisterEventInfo(lFlags, pEventGUID) {
        result := ComCall(8, this, "int", lFlags, "ptr", pEventGUID, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWIA_DEV_CAPS(ppIEnum)
    }

    /**
     * The IWiaItem::FindItemByName method searches an item's tree of sub-items using the name as the search key. Each IWiaItem object has a name as one of its standard properties.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Currently unused. Should be set to zero.
     * @param {BSTR} bstrFullItemName Type: <b>BSTR</b>
     * 
     * Specifies the name of the item for which to search.
     * @returns {IWiaItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a>**</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-finditembyname
     */
    FindItemByName(lFlags, bstrFullItemName) {
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(9, this, "int", lFlags, "ptr", bstrFullItemName, "ptr*", &ppIWiaItem := 0, "HRESULT")
        return IWiaItem(ppIWiaItem)
    }

    /**
     * The IWiaItem::DeviceDlg method is used by applications to display a dialog box to the user to prepare for image acquisition.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * Handle of the parent window of the dialog box.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @param {Integer} lIntent Type: <b>LONG</b>
     * 
     * Specifies what type of data the image is intended to represent. For a list of image intent values, see <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-imageintentconstants">Image Intent Constants</a>.
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This method ignores all WIA_INTENT_IMAGE_* image intents.</div>
     * <div> </div>
     * @param {Pointer<Integer>} plItemCount Type: <b>LONG*</b>
     * 
     * Receives the number of items in the array indicated by the <i>ppIWiaItem</i> parameter.
     * @param {Pointer<Pointer<IWiaItem>>} ppIWiaItem Type: <b>IWiaItem***</b>
     * 
     * Receives the address of an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> interfaces.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-devicedlg
     */
    DeviceDlg(hwndParent, lFlags, lIntent, plItemCount, ppIWiaItem) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        plItemCountMarshal := plItemCount is VarRef ? "int*" : "ptr"
        ppIWiaItemMarshal := ppIWiaItem is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", hwndParent, "int", lFlags, "int", lIntent, plItemCountMarshal, plItemCount, ppIWiaItemMarshal, ppIWiaItem, "HRESULT")
        return result
    }

    /**
     * The IWiaItem::DeviceCommand issues a command to a Windows Image Acquisition (WIA) hardware device.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Currently unused. Should be set to zero.
     * @param {Pointer<Guid>} pCmdGUID Type: <b>const GUID*</b>
     * 
     * Specifies a unique identifier that specifies the command to send to the WIA hardware device. For a list of valid device commands, see <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-device-commands">WIA Device Commands</a>.
     * @param {Pointer<IWiaItem>} pIWiaItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a>**</b>
     * 
     * On output, this pointer points to the item created by the command, if any.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-devicecommand
     */
    DeviceCommand(lFlags, pCmdGUID, pIWiaItem) {
        result := ComCall(11, this, "int", lFlags, "ptr", pCmdGUID, "ptr*", pIWiaItem, "HRESULT")
        return result
    }

    /**
     * The IWiaItem::GetRootItem method retrieves the root item of a tree of item objects used to represent a Windows Image Acquisition (WIA) hardware device.
     * @returns {IWiaItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> interface that contains a pointer to the <b>IWiaItem</b> interface of the root item.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-getrootitem
     */
    GetRootItem() {
        result := ComCall(12, this, "ptr*", &ppIWiaItem := 0, "HRESULT")
        return IWiaItem(ppIWiaItem)
    }

    /**
     * The IWiaItem::EnumDeviceCapabilities method creates an enumerator that is used to ascertain the commands and events a Windows Image Acquisition (WIA) device supports.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @returns {IEnumWIA_DEV_CAPS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a>**</b>
     * 
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a> interface created by <b>IWiaItem::EnumDeviceCapabilities</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-enumdevicecapabilities
     */
    EnumDeviceCapabilities(lFlags) {
        result := ComCall(13, this, "int", lFlags, "ptr*", &ppIEnumWIA_DEV_CAPS := 0, "HRESULT")
        return IEnumWIA_DEV_CAPS(ppIEnumWIA_DEV_CAPS)
    }

    /**
     * This method is not supported.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-dumpitemdata
     */
    DumpItemData() {
        bstrData := BSTR()
        result := ComCall(14, this, "ptr", bstrData, "HRESULT")
        return bstrData
    }

    /**
     * This method is not supported.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-dumpdrvitemdata
     */
    DumpDrvItemData() {
        bstrData := BSTR()
        result := ComCall(15, this, "ptr", bstrData, "HRESULT")
        return bstrData
    }

    /**
     * This method is not supported.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-dumptreeitemdata
     */
    DumpTreeItemData() {
        bstrData := BSTR()
        result := ComCall(16, this, "ptr", bstrData, "HRESULT")
        return bstrData
    }

    /**
     * This method is not supported.
     * @param {Integer} ulSize Type: <b>ULONG</b>
     * @param {Pointer<Integer>} pBuffer Type: <b>BYTE*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitem-diagnostic
     */
    Diagnostic(ulSize, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(17, this, "uint", ulSize, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }
}
