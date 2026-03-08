#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWiaItem2.ahk
#Include .\IEnumWiaItem2.ahk
#Include .\IEnumWIA_DEV_CAPS.ahk
#Include .\IWiaPreview.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaItem2 interface provides applications with the same functionality as the IWiaItem interface (the ability to query devices to discover their capabilities, to access data transfer interfaces and item properties, and to control the device).
 * @remarks
 * The **IWiaItem2** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaItem2** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * The WIA 2.0 item tree that an application can see is separate from the tree that is created and maintained by a WIA 2.0 minidriver. When a minidriver creates a tree of items, the WIA 2.0 Service uses this WIA 2.0 item tree as a guide to create identical copies that can be viewed by imaging applications. Items in the copied tree are called application items. Items in the tree created by a minidriver are called driver items. In Windows Vista the WIA 2.0 item trees are built of **IWiaItem2** objects, each one of which implements the **IWiaItem2** interface).
 * 
 * The **IWiaItem2** interface, like all Component Object Model (COM) interfaces, inherits the [IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface methods.
 * 
 * 
 * 
 * | IUnknown Methods                                        | Description                               |
 * |---------------------------------------------------------|-------------------------------------------|
 * | [IUnknown::QueryInterface](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) | Returns pointers to supported interfaces. |
 * | [IUnknown::AddRef](/windows/win32/api/unknwn/nf-unknwn-iunknown-addref)                 | Increments reference count.               |
 * | [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release)               | Decrements reference count.               |
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaItem2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaItem2
     * @type {Guid}
     */
    static IID => Guid("{6cba0075-1287-407d-9b77-cf0e030435cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateChildItem", "DeleteItem", "EnumChildItems", "FindItemByName", "GetItemCategory", "GetItemType", "DeviceDlg", "DeviceCommand", "EnumDeviceCapabilities", "CheckExtension", "GetExtension", "GetParentItem", "GetRootItem", "GetPreviewComponent", "EnumRegisterEventInfo", "Diagnostic"]

    /**
     * Create a new child item. Adds IWiaItem2 objects to a device's IWiaItem2 tree.
     * @remarks
     * Some WIA 2.0 hardware devices allow applications to create new items in the [**IWiaItem2**](-wia-iwiaitem2.md) tree that represents the device. Applications must test the devices to see if they support this capability. Use the IEnumWIA\_DEV\_CAPS interface to enumerate the current device's capabilities.
     * 
     * If the device allows the creation of new items in the [**IWiaItem2**](-wia-iwiaitem2.md) tree, invoking **IWiaItem2::CreateChildItem** creates a new **IWiaItem2** object that is a child of the current node. It passes a pointer to the new node to the application through the *ppIWiaItem2* parameter. Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *ppIWiaItem2* parameter.
     * 
     * If *lCreationFlags* is COPY\_PARENT\_PROPERTY\_VALUES and *lItemFlags* is zero, the function returns E\_INVALIDARG.
     * @param {Integer} lItemFlags Type: **LONG**
     * 
     * Specifies the WIA 2.0 item type. See [**WIA Item Type Flags**](-wia-wia-item-type-flags.md).
     * @param {Integer} lCreationFlags Type: **LONG**
     * 
     * Specifies how to create the new item.
     * 
     * 
     * <span id="0"></span>
     * 
     * <span id="0"></span>**0** (0)
     * 
     * 
     * 
     * Set the default values for the properties of the child.
     * 
     * 
     * <span id="COPY_PARENT_PROPERTY_VALUES"></span><span id="copy_parent_property_values"></span>
     * 
     * <span id="COPY_PARENT_PROPERTY_VALUES"></span><span id="copy_parent_property_values"></span>**COPY\_PARENT\_PROPERTY\_VALUES** (0x40000000)
     * 
     * 
     * 
     * Copy the values of all Read/Write properties from the parent.
     * @param {BSTR} bstrItemName Type: **BSTR**
     * 
     * Specifies the item name. This name is appended to the end of the parent item's name to generate the full item name.
     * @returns {IWiaItem2} Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\*\***
     * 
     * Receives the address of a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) interface that sets the **IWiaItem2::CreateChildItem** method.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-createchilditem
     */
    CreateChildItem(lItemFlags, lCreationFlags, bstrItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(3, this, "int", lItemFlags, "int", lCreationFlags, "ptr", bstrItemName, "ptr*", &ppIWiaItem2 := 0, "HRESULT")
        return IWiaItem2(ppIWiaItem2)
    }

    /**
     * Removes the current IWiaItem2 object from the device's object tree.
     * @remarks
     * The Windows Image Acquisition (WIA) 2.0 run-time system represents each WIA 2.0 hardware device connected to the user's computer as a hierarchical tree of [**IWiaItem2**](-wia-iwiaitem2.md) objects. A given WIA 2.0 device may or may not allow applications to delete **IWiaItem2** objects from its tree. Items that have children cannot be deleted. The [**IEnumWIA\_DEV\_CAPS**](/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps) interface must be used to query the device for item deletion capability.
     * 
     * If the device supports item deletion in its [**IWiaItem2**](-wia-iwiaitem2.md) tree, call the **IWiaItem2::DeleteItem** method to remove the **IWiaItem2** object. Note that this method only deletes an object after all references to the object have been released. If the deletion of an item has failed, E\_DELETEITEM is returned. The numeric value for this error is not yet defined.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-deleteitem
     */
    DeleteItem(lFlags) {
        result := ComCall(4, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * Creates an enumerator object and passes back a pointer to its IEnumWiaItem2 interface for folders with items in the IWiaItem2 tree of a Windows Image Acquisition (WIA) 2.0 device.
     * @remarks
     * The WIA 2.0 run-time system represents each WIA 2.0 hardware device as a hierarchical tree of [**IWiaItem2**](-wia-iwiaitem2.md) objects. The **IWiaItem2::EnumChildItems** method enables applications to enumerate child items in the current item. However, it can only be applied to items that are folders.
     * 
     * If the folder is not empty, it contains a subtree of [**IWiaItem2**](-wia-iwiaitem2.md) objects. The **IWiaItem2::EnumChildItems** method enumerates all of the items contained in the folder. It stores a pointer to an enumerator in the *ppIEnumWiaItem2* parameter. Applications use the enumerator pointer to perform the enumeration of an object's child items.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *ppIEnumWiaItem2* parameter.
     * @param {Pointer<Guid>} pCategoryGUID Type: **const GUID\***
     * 
     * Specifies a pointer to a category for which child nodes are enumerated. If **NULL**, then all child nodes are enumerated.
     * @returns {IEnumWiaItem2} Type: **[**IEnumWiaItem2**](-wia-ienumwiaitem2.md)\*\***
     * 
     * Receives the address of a pointer to the [**IEnumWiaItem2**](-wia-ienumwiaitem2.md) interface that this method creates.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-enumchilditems
     */
    EnumChildItems(pCategoryGUID) {
        result := ComCall(5, this, "ptr", pCategoryGUID, "ptr*", &ppIEnumWiaItem2 := 0, "HRESULT")
        return IEnumWiaItem2(ppIEnumWiaItem2)
    }

    /**
     * Searches an item's tree of subitems using the name as the search key.
     * @remarks
     * This method searches the current item's tree of sub-items using the name as the search key. If **IWiaItem2::FindItemByName** finds the item specified by *bstrFullItemName*, it stores the address of a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) interface of the item in the *ppIWiaItem2* parameter.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *ppIWiaItem2* parameter.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {BSTR} bstrFullItemName Type: **BSTR**
     * 
     * Specifies the name fo the item to search for.
     * @returns {IWiaItem2} Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\*\***
     * 
     * Receives the address of a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) interface of the item found.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-finditembyname
     */
    FindItemByName(lFlags, bstrFullItemName) {
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(6, this, "int", lFlags, "ptr", bstrFullItemName, "ptr*", &ppIWiaItem2 := 0, "HRESULT")
        return IWiaItem2(ppIWiaItem2)
    }

    /**
     * Gets an item's category information.
     * @remarks
     * Every [**IWiaItem2**](-wia-iwiaitem2.md) object in the hierarchical tree of objects associated with a Windows Image Acquisition (WIA) 2.0 hardware device has a specific category. This method enables applications to identify the category of any item in a hierarchical tree of item objects in a device.
     * @returns {Guid} Type: **GUID\***
     * 
     * Receives a pointer to the GUID that identifies the category of the item.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getitemcategory
     */
    GetItemCategory() {
        pItemCategoryGUID := Guid()
        result := ComCall(7, this, "ptr", pItemCategoryGUID, "HRESULT")
        return pItemCategoryGUID
    }

    /**
     * Gets an item's type information.
     * @remarks
     * Every [**IWiaItem2**](-wia-iwiaitem2.md) object in the hierarchical tree of objects associated with a Windows Image Acquisition (WIA) 2.0 hardware device has a specific data type. Item objects represent folders and files. Folders contain file objects. File objects contain data acquired by the device such as images and sounds. This method enables applications to identify the type of any item in a hierarchical tree of item objects in a device.
     * 
     * An item may have more than one type. For example, an item that represents an audio file will have the type attributes [**WiaItemTypeAudio**](-wia-wia-item-type-flags.md) \| **WiaItemTypeFile**.
     * @returns {Integer} Type: **LONG\***
     * 
     * Receives a pointer to a **LONG** that contains a combination of type flags. See [**WIA Item Type Flags**](-wia-wia-item-type-flags.md).
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getitemtype
     */
    GetItemType() {
        result := ComCall(8, this, "int*", &pItemType := 0, "HRESULT")
        return pItemType
    }

    /**
     * Displays a dialog box to the user to prepare for image acquisition.
     * @remarks
     * This method displays a dialog box to the user that an application uses to gather all the information required for image acquisition. It is also used to specify image scan properties such as brightness and contrast.
     * 
     * After this method returns, the application can use the [**IWiaTransfer**](-wia-iwiatransfer.md) interface to acquire the image.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method for each element in the array of interface pointers they receive through the *ppIWiaItem2* parameter. Applications must also free the array using [CoTaskMemFree](/windows/win32/api/combaseapi/nf-combaseapi-cotaskmemfree).
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Specifies a set of flags that control the dialog box's operation. The value can be either 0 to represent the default behavior or any of the WIA\_DEVICE\_DIALOG flags described in [**WiaFlag**](-wia-wiaflag.md).
     * @param {HWND} hwndParent Type: **HWND**
     * 
     * A handle to the parent window.
     * @param {BSTR} bstrFolderName Type: **BSTR**
     * 
     * Specifies the folder name where the files are to be transferred.
     * @param {BSTR} bstrFilename Type: **BSTR**
     * 
     * Specifies the template file name.
     * @param {Pointer<Integer>} plNumFiles Type: **LONG\***
     * 
     * A pointer to the number of items in the *ppbstrFilePaths* array.
     * @param {Pointer<Pointer<BSTR>>} ppbstrFilePaths Type: **BSTR\*\***
     * 
     * The address of a pointer to an array of paths for the scanned files. Initialize the pointer to point to an array of size zero (0) before **IWiaItem2::DeviceDlg** is called.
     * @param {Pointer<IWiaItem2>} ppItem 
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-devicedlg
     */
    DeviceDlg(lFlags, hwndParent, bstrFolderName, bstrFilename, plNumFiles, ppbstrFilePaths, ppItem) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        bstrFolderName := bstrFolderName is String ? BSTR.Alloc(bstrFolderName).Value : bstrFolderName
        bstrFilename := bstrFilename is String ? BSTR.Alloc(bstrFilename).Value : bstrFilename

        plNumFilesMarshal := plNumFiles is VarRef ? "int*" : "ptr"
        ppbstrFilePathsMarshal := ppbstrFilePaths is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "int", lFlags, "ptr", hwndParent, "ptr", bstrFolderName, "ptr", bstrFilename, plNumFilesMarshal, plNumFiles, ppbstrFilePathsMarshal, ppbstrFilePaths, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * Issues a command to a Windows Image Acquisition (WIA) 2.0 hardware device.
     * @remarks
     * The behavior of this method is different depending on the category of the node on which the method is called.
     * 
     * When the application sends the [**WIA\_CMD\_TAKE\_PICTURE**](-wia-wia-device-commands.md) command to the device using the **IWiaItem2::DeviceCommand** method, the WIA 2.0 run-time system creates an [**IWiaItem2**](-wia-iwiaitem2.md) object to represent the image. The **IWiaItem2::DeviceCommand** method stores the address of the interface in the *ppIWiaItem2* parameter.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *ppIWiaItem2* parameter.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {Pointer<Guid>} pCmdGUID Type: **const GUID\***
     * 
     * Specifies the command to send to the WIA 2.0 device. See [**WIA Device Commands**](-wia-wia-device-commands.md).
     * @param {Pointer<IWiaItem2>} ppIWiaItem2 Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\*\***
     * 
     * Receives the address of a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) item created by the command, if any.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * In addition to the standard COM error codes, the method may return the following value.
     * 
     * 
     * 
     * | Return code                                                                                       | Description                                                                                                                                                                          |
     * |---------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**E\_CMDNOTSUPPORTED**</dt> </dl> | The command is not implemented for the [**IWiaItem2**](-wia-iwiaitem2.md) interface on which the method is called. The numeric value for this error is not yet defined. <br/> |
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-devicecommand
     */
    DeviceCommand(lFlags, pCmdGUID, ppIWiaItem2) {
        result := ComCall(10, this, "int", lFlags, "ptr", pCmdGUID, "ptr*", ppIWiaItem2, "HRESULT")
        return result
    }

    /**
     * Creates an enumerator that is used to ascertain the commands and events a Windows Image Acquisition (WIA) 2.0 device supports.
     * @remarks
     * This method is used to create an enumerator object to obtain the set of commands and events that a WIA 2.0 device supports. The *lFlags* parameter is used to specify which kinds of device capabilities to enumerate. The **IWiaItem2::EnumDeviceCapabilities** method stores the address of the interface of the enumerator object in the *ppIEnumWIA\_DEV\_CAPS* parameter.
     * 
     * This method can only be called on the root item of [**IWiaItem2**](-wia-iwiaitem2.md) objects of a device tree.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *ppIEnumWIA\_DEV\_CAPS* parameter.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Specifies a flag that selects the type of capabilities to enumerate. It is one of the following values.
     * 
     * 
     * <span id="WIA_DEVICE_COMMANDS"></span><span id="wia_device_commands"></span>
     * 
     * <span id="WIA_DEVICE_COMMANDS"></span><span id="wia_device_commands"></span>**WIA\_DEVICE\_COMMANDS**
     * 
     * 
     * 
     * Enumerate device commands.
     * 
     * 
     * <span id="WIA_DEVICE_EVENTS"></span><span id="wia_device_events"></span>
     * 
     * <span id="WIA_DEVICE_EVENTS"></span><span id="wia_device_events"></span>**WIA\_DEVICE\_EVENTS**
     * 
     * 
     * 
     * Enumerate device events.
     * 
     * 
     * *ppIEnumWIA\_DEV\_CAPS* \[out\]
     * 
     * Type: **[**IEnumWIA\_DEV\_CAPS**](/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps)\*\***
     * 
     * Receives a pointer to the [**IEnumWIA\_DEV\_CAPS**](/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps) interface created by this method.
     * @returns {IEnumWIA_DEV_CAPS} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-enumdevicecapabilities
     */
    EnumDeviceCapabilities(lFlags) {
        result := ComCall(11, this, "int", lFlags, "ptr*", &ppIEnumWIA_DEV_CAPS := 0, "HRESULT")
        return IEnumWIA_DEV_CAPS(ppIEnumWIA_DEV_CAPS)
    }

    /**
     * Checks whether a specified extension is available on the machine and can be used by the IWiaItem2::GetExtension method.
     * @remarks
     * Using this method, applications can check whether an extension is available before calling the [**IWiaItem2::GetExtension**](-wia-iwiaitem2-getextension.md) method. Also, the application can check which extensions are available without co-creating each of them, and then decide which one to use.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {BSTR} bstrName Type: **BSTR**
     * 
     * Specifies the name of the extension.
     * @param {Pointer<Guid>} riidExtensionInterface Type: **REFIID**
     * 
     * Currently unused.
     * @param {Pointer<BOOL>} pbExtensionExists Type: **BOOL\***
     * 
     * Receives a pointer to a **BOOL**.
     * 
     * 
     * <span id="FALSE"></span><span id="false"></span>
     * 
     * <span id="FALSE"></span><span id="false"></span>**FALSE**
     * 
     * 
     * 
     * The specified extension is not available.
     * 
     * 
     * <span id="TRUE"></span><span id="true"></span>
     * 
     * <span id="TRUE"></span><span id="true"></span>**TRUE**
     * 
     * 
     * 
     * The specified extension is available.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-checkextension
     */
    CheckExtension(lFlags, bstrName, riidExtensionInterface, pbExtensionExists) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pbExtensionExistsMarshal := pbExtensionExists is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "int", lFlags, "ptr", bstrName, "ptr", riidExtensionInterface, pbExtensionExistsMarshal, pbExtensionExists, "HRESULT")
        return result
    }

    /**
     * Gets the extension interfaces that might come with a Windows Image Acquisition (WIA) 2.0 device driver.
     * @remarks
     * An application invokes this method to create an extension object implementing one of the WIA 2.0 driver extension interfaces. **IWiaItem2::GetExtension** stores the address of the extension object's extension interface in the *riidExtensionInterface* parameter. The application then uses the interface pointer to call its methods.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *riidExtensionInterface* parameter.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {BSTR} bstrName Type: **BSTR**
     * 
     * Specifies the name of the extension that the calling application requires a pointer to.
     * 
     * 
     * <span id="SegmentationFilter"></span><span id="segmentationfilter"></span><span id="SEGMENTATIONFILTER"></span>
     * 
     * <span id="SegmentationFilter"></span><span id="segmentationfilter"></span><span id="SEGMENTATIONFILTER"></span>**SegmentationFilter**
     * 
     * 
     * 
     * The segmentation filter extension. This is currently the only valid value for this parameter.
     * @param {Pointer<Guid>} riidExtensionInterface Type: **REFIID**
     * 
     * Specifies the identifier of the extension interface.
     * @param {Pointer<Pointer<Void>>} ppOut Type: **VOID\*\***
     * 
     * Receives the address of a pointer to the extension interface.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getextension
     */
    GetExtension(lFlags, bstrName, riidExtensionInterface, ppOut) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        ppOutMarshal := ppOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "int", lFlags, "ptr", bstrName, "ptr", riidExtensionInterface, ppOutMarshal, ppOut, "HRESULT")
        return result
    }

    /**
     * Gets the parent item in the tree that represents a Windows Image Acquisition (WIA) 2.0 hardware device.
     * @remarks
     * Given any [**IWiaItem2**](-wia-iwiaitem2.md) object in the object tree of a WIA 2.0 hardware device, the application retrieves a pointer to the parent item by calling this function.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *ppIWiaItem2* parameter if these pointers are not **NULL**.
     * @returns {IWiaItem2} Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\*\***
     * 
     * Receives the address of a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) interface of the parent of the item in the tree of item objects. If this method is called on the root of the tree, then the returned address is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getparentitem
     */
    GetParentItem() {
        result := ComCall(14, this, "ptr*", &ppIWiaItem2 := 0, "HRESULT")
        return IWiaItem2(ppIWiaItem2)
    }

    /**
     * Gets the root item of a tree of item objects used to represent a Windows Image Acquisition (WIA) 2.0 hardware device.
     * @remarks
     * Given any [**IWiaItem2**](-wia-iwiaitem2.md) object in the object tree of a WIA 2.0 hardware device, the application retrieves a pointer to the root item by calling this function.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *ppIWiaItem2* parameter.
     * @returns {IWiaItem2} Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\*\***
     * 
     * Receives the address of a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) interface of the root item.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getrootitem
     */
    GetRootItem() {
        result := ComCall(15, this, "ptr*", &ppIWiaItem2 := 0, "HRESULT")
        return IWiaItem2(ppIWiaItem2)
    }

    /**
     * Gets the Windows Image Acquisition (WIA) 2.0 preview component.
     * @remarks
     * Use this function to return a pointer to the address of the WIA 2.0 preview component for any [**IWiaItem2**](-wia-iwiaitem2.md) object in the object tree of a WIA 2.0 hardware device.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers that they receive through the *ppWiaPreview* parameter.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Not used. Set to 0.
     * @returns {IWiaPreview} Type: **[**IWiaPreview**](-wia-iwiapreview.md)\*\***
     * 
     * Returns the address of a pointer to the [**IWiaPreview**](-wia-iwiapreview.md) interface of the preview component.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getpreviewcomponent
     */
    GetPreviewComponent(lFlags) {
        result := ComCall(16, this, "int", lFlags, "ptr*", &ppWiaPreview := 0, "HRESULT")
        return IWiaPreview(ppWiaPreview)
    }

    /**
     * The IWiaItem2::EnumRegisterEventInfo method creates an enumerator that you can use to obtain information about events for which an application is registered.
     * @remarks
     * An application calls this method to create an enumerator object for the event information. **IWiaItem2::EnumRegisterEventInfo** stores the address of the [**IEnumWIA\_DEV\_CAPS**](/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps) interface of the enumerator object in the *ppIEnum* parameter. The program then uses the interface pointer to enumerate the properties of the event for which it is registered.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers that they receive through the *ppIEnum* parameter.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Not used. Set to 0.
     * @param {Pointer<Guid>} pEventGUID Type: **const GUID\***
     * 
     * Pointer to an identifier that specifies the hardware event for which you want to obtain registration information.
     * @returns {IEnumWIA_DEV_CAPS} Type: **[**IEnumWIA\_DEV\_CAPS**](/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps)\*\***
     * 
     * The address of a pointer to the [**IEnumWIA\_DEV\_CAPS**](/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_caps) interface.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-enumregistereventinfo
     */
    EnumRegisterEventInfo(lFlags, pEventGUID) {
        result := ComCall(17, this, "int", lFlags, "ptr", pEventGUID, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWIA_DEV_CAPS(ppIEnum)
    }

    /**
     * IWiaItem2::Diagnostic method
     * @param {Integer} ulSize 
     * @param {Pointer<Integer>} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-diagnostic
     */
    Diagnostic(ulSize, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, "uint", ulSize, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }
}
