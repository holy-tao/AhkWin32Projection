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
 * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nn-wia_xp-iwiaitem
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
     * @remarks
     * Every <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> object in the hierarchical tree of objects associated with a Windows Image Acquisition (WIA) hardware device has a specific data type. Item objects represent folders and files. Folders contain file objects. File objects contain data acquired by the device such as images and sounds. This method enables applications to identify the type of any item in a hierarchical tree of item objects in a device.
     * 
     * An item may have more than one type. For example, an item that represents an audio file will have the type attributes <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-item-type-flags">WiaItemTypeAudio</a> | <b>WiaItemTypeFile</b>.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * Receives the address of a <b>LONG</b> variable that contains a combination of <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-item-type-flags">WIA Item Type Flags</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-getitemtype
     */
    GetItemType() {
        result := ComCall(3, this, "int*", &pItemType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pItemType
    }

    /**
     * The IWiaItem::AnalyzeItem method causes the Windows Image Acquisition (WIA) hardware device to acquire and try to detect what data types are present.
     * @remarks
     * This method is used with scanners to detect what type of data is on a page. When an application calls this method, the WIA hardware device driver scans and analyzes the current page. For each data type it detects, it creates an <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> object to represent the region on the page the data occupies. 
     * 
     * Image processing and OCR software can use this capability to detect graphics and text on a page. This method adds the regions it creates into the WIA device's <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> tree. The application can select the individual regions and use the standard data transfer methods to acquire data from them.
     * 
     * If necessary, applications can override the regions created by this method.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Currently unused. Should be set to zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-analyzeitem
     */
    AnalyzeItem(lFlags) {
        result := ComCall(4, this, "int", lFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWiaItem::EnumChildItems method creates an enumerator object and passes back a pointer to its IEnumWiaItem interface for non-empty folders in a IWiaItem tree of a Windows Image Acquisition (WIA) device.
     * @remarks
     * The WIA run-time system represents each WIA hardware device as a hierarchical tree of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> objects. The <b>IWiaItem::EnumChildItems</b> method enables applications to enumerate child items in the current item. However, it can only be applied to items that are folders. 
     * 
     * If the folder is not empty, it contains a subtree of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> objects. The <b>IWiaItem::EnumChildItems</b> method enumerates all of the items contained in the folder. It stores a pointer to an enumerator in the <i>ppIEnumWiaItem</i> parameter. Applications use the enumerator pointer to perform the enumeration of an object's child items.
     * 
     * Applications must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the interface pointers they receive through the <i>ppIEnumWiaItem</i> parameter.
     * @returns {IEnumWiaItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwiaitem">IEnumWiaItem</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwiaitem">IEnumWiaItem</a> interface that <b>IWiaItem::EnumChildItems</b> creates.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-enumchilditems
     */
    EnumChildItems() {
        result := ComCall(5, this, "ptr*", &ppIEnumWiaItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumWiaItem(ppIEnumWiaItem)
    }

    /**
     * The IWiaItem::DeleteItem method removes the current IWiaItem object from the object tree of the device.
     * @remarks
     * The Windows Image Acquisition (WIA) run-time system represents each WIA hardware device connected to the user's computer as a hierarchical tree of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> objects. A given WIA device may or may not allow applications to delete <b>IWiaItem</b> objects from its tree. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a> interface to query the device for item deletion capability.
     * 
     * If the device supports item deletion in its <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> tree, invoke the <b>IWiaItem::DeleteItem</b> method to remove the <b>IWiaItem</b> object. Note that this method will only delete an object after all references to the object have been released.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Currently unused. Should be set to zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns S_OK regardless of how many items were deleted. If the method fails, it returns a standard COM error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-deleteitem
     */
    DeleteItem(lFlags) {
        result := ComCall(6, this, "int", lFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWiaItem::CreateChildItem method is used by applications to add IWiaItem objects to the IWiaItem tree of a device.
     * @remarks
     * Some WIA hardware devices allow applications to create new items in the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> tree that represents the device. Applications must test the devices to see if they support this capability. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a> interface to enumerate the current device's capabilities.
     * 
     * If the device allows the creation of new items in the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> tree, invoking <b>IWiaItem::CreateChildItem</b> creates a new <b>IWiaItem</b> that is a child of the current node. <b>IWiaItem::CreateChildItem</b> passes a pointer to the new node to the application through the <i>ppIWiaItem</i> parameter.
     * 
     * Applications must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the interface pointers they receive through the <i>ppIWiaItem</i> parameter.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-createchilditem
     */
    CreateChildItem(lFlags, bstrItemName, bstrFullItemName) {
        if(bstrItemName is String) {
            pin := BSTR.Alloc(bstrItemName)
            bstrItemName := pin.Value
        }
        if(bstrFullItemName is String) {
            pin := BSTR.Alloc(bstrFullItemName)
            bstrFullItemName := pin.Value
        }

        result := ComCall(7, this, "int", lFlags, "ptr", bstrItemName, "ptr", bstrFullItemName, "ptr*", &ppIWiaItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWiaItem(ppIWiaItem)
    }

    /**
     * The IWiaItem::EnumRegisterEventInfo method creates an enumerator used to obtain information about events for which an application is registered.
     * @remarks
     * An application invokes this method to create an enumerator object for the event information. <b>IWiaItem::EnumRegisterEventInfo</b> stores the address of the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a> interface of the enumerator object in the <i>ppIEnum</i> parameter. The program then uses the interface pointer to enumerate the properties of the event for which it is registered.
     * 
     * Each <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_dev_cap">WIA_DEV_CAP</a> structure includes an indication of whether the event is of type WIA_NOTIFICATION_EVENT or WIA_ACTION_EVENT or both.
     * 
     * Applications must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the interface pointers they receive through the <i>ppIEnum</i> parameter.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Currently unused. Should be set to zero.
     * @param {Pointer<Guid>} pEventGUID Type: <b>const GUID*</b>
     * 
     * Pointer to an identifier that specifies the hardware event for which you want registration information.
     * @returns {IEnumWIA_DEV_CAPS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-enumregistereventinfo
     */
    EnumRegisterEventInfo(lFlags, pEventGUID) {
        result := ComCall(8, this, "int", lFlags, "ptr", pEventGUID, "ptr*", &ppIEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumWIA_DEV_CAPS(ppIEnum)
    }

    /**
     * The IWiaItem::FindItemByName method searches an item's tree of sub-items using the name as the search key. Each IWiaItem object has a name as one of its standard properties.
     * @remarks
     * This method searches the current item's tree of sub-items using the name as the search key. If <b>IWiaItem::FindItemByName</b> finds the item specified by <i>bstrFullItemName</i>, it stores the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> interface of the item in the <i>ppIWiaItem</i> parameter.
     * 
     * Applications must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the interface pointers they receive through the <i>ppIWiaItem</i> parameter.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Currently unused. Should be set to zero.
     * @param {BSTR} bstrFullItemName Type: <b>BSTR</b>
     * 
     * Specifies the name of the item for which to search.
     * @returns {IWiaItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a>**</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-finditembyname
     */
    FindItemByName(lFlags, bstrFullItemName) {
        if(bstrFullItemName is String) {
            pin := BSTR.Alloc(bstrFullItemName)
            bstrFullItemName := pin.Value
        }

        result := ComCall(9, this, "int", lFlags, "ptr", bstrFullItemName, "ptr*", &ppIWiaItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWiaItem(ppIWiaItem)
    }

    /**
     * The IWiaItem::DeviceDlg method is used by applications to display a dialog box to the user to prepare for image acquisition.
     * @remarks
     * This method displays a dialog box to the user that an application uses to gather all the information required for image acquisition. For instance, this dialog box enables the user to select images to download from a camera. When using a scanner, it is also used to specify image scan properties such as brightness and contrast.
     * 
     * After this method returns, the application can use the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiadatatransfer">IWiaDataTransfer</a> interface to acquire the image.
     * 
     * Applications must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method for each element in the array of interface pointers they receive through the <i>ppIWiaItem</i> parameter. Applications must also free the array using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * 
     * It is recommended that applications make device and image selection available through a menu item named <b>From scanner or camera</b> on the <b>File</b> menu.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-devicedlg
     */
    DeviceDlg(hwndParent, lFlags, lIntent, plItemCount, ppIWiaItem) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        plItemCountMarshal := plItemCount is VarRef ? "int*" : "ptr"
        ppIWiaItemMarshal := ppIWiaItem is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", hwndParent, "int", lFlags, "int", lIntent, plItemCountMarshal, plItemCount, ppIWiaItemMarshal, ppIWiaItem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWiaItem::DeviceCommand issues a command to a Windows Image Acquisition (WIA) hardware device.
     * @remarks
     * Applications use this method to send WIA commands to hardware devices. 
     * 
     * When the application sends the WIA_CMD_TAKE_PICTURE command to the device, <b>IWiaItem::DeviceCommand</b>, the WIA run-time system creates the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> object to represent the image. The <b>IWiaItem::DeviceCommand</b> method stores the address of the interface in the <i>pIWiaItem</i>  parameter. 
     * 
     * Applications must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the interface pointers they receive through the <i>pIWiaItem</i> parameter.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-devicecommand
     */
    DeviceCommand(lFlags, pCmdGUID, pIWiaItem) {
        result := ComCall(11, this, "int", lFlags, "ptr", pCmdGUID, "ptr*", pIWiaItem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWiaItem::GetRootItem method retrieves the root item of a tree of item objects used to represent a Windows Image Acquisition (WIA) hardware device.
     * @remarks
     * Given any <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> object in the object tree of a WIA hardware device, the application retrieves a pointer to the root item by calling this function. 
     * 
     * Applications must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the interface pointers they receive through the <i>ppIWiaItem</i> parameter.
     * @returns {IWiaItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> interface that contains a pointer to the <b>IWiaItem</b> interface of the root item.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-getrootitem
     */
    GetRootItem() {
        result := ComCall(12, this, "ptr*", &ppIWiaItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWiaItem(ppIWiaItem)
    }

    /**
     * The IWiaItem::EnumDeviceCapabilities method creates an enumerator that is used to ascertain the commands and events a Windows Image Acquisition (WIA) device supports.
     * @remarks
     * Use this method to create an enumerator object to obtain the set of commands and events that a WIA device supports. You can use the <i>lFlags</i> parameter to specify which kinds of device capabilities to enumerate. The <b>IWiaItem::EnumDeviceCapabilities</b> method stores the address of the interface of the enumerator object in the <i>ppIEnumWIA_DEV_CAPS</i> parameter.
     * 
     * Applications must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the interface pointers they receive through the <i>ppIEnumWIA_DEV_CAPS</i> parameter.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @returns {IEnumWIA_DEV_CAPS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a>**</b>
     * 
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps">IEnumWIA_DEV_CAPS</a> interface created by <b>IWiaItem::EnumDeviceCapabilities</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-enumdevicecapabilities
     */
    EnumDeviceCapabilities(lFlags) {
        result := ComCall(13, this, "int", lFlags, "ptr*", &ppIEnumWIA_DEV_CAPS := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumWIA_DEV_CAPS(ppIEnumWIA_DEV_CAPS)
    }

    /**
     * This method is not supported. (IWiaItem.DumpItemData)
     * @returns {BSTR} Type: <b>BSTR*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-dumpitemdata
     */
    DumpItemData() {
        bstrData := BSTR()
        result := ComCall(14, this, "ptr", bstrData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bstrData
    }

    /**
     * This method is not supported. (IWiaItem.DumpDrvItemData)
     * @returns {BSTR} Type: <b>BSTR*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-dumpdrvitemdata
     */
    DumpDrvItemData() {
        bstrData := BSTR()
        result := ComCall(15, this, "ptr", bstrData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bstrData
    }

    /**
     * This method is not supported. (IWiaItem.DumpTreeItemData)
     * @returns {BSTR} Type: <b>BSTR*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-dumptreeitemdata
     */
    DumpTreeItemData() {
        bstrData := BSTR()
        result := ComCall(16, this, "ptr", bstrData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bstrData
    }

    /**
     * This method is not supported. (IWiaItem.Diagnostic)
     * @param {Integer} ulSize Type: <b>ULONG</b>
     * @param {Pointer<Integer>} pBuffer Type: <b>BYTE*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiaitem-diagnostic
     */
    Diagnostic(ulSize, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(17, this, "uint", ulSize, pBufferMarshal, pBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
