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
 * 
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
     * 
     * @param {Integer} lItemFlags 
     * @param {Integer} lCreationFlags 
     * @param {BSTR} bstrItemName 
     * @returns {IWiaItem2} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-createchilditem
     */
    CreateChildItem(lItemFlags, lCreationFlags, bstrItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(3, this, "int", lItemFlags, "int", lCreationFlags, "ptr", bstrItemName, "ptr*", &ppIWiaItem2 := 0, "HRESULT")
        return IWiaItem2(ppIWiaItem2)
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-deleteitem
     */
    DeleteItem(lFlags) {
        result := ComCall(4, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCategoryGUID 
     * @returns {IEnumWiaItem2} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-enumchilditems
     */
    EnumChildItems(pCategoryGUID) {
        result := ComCall(5, this, "ptr", pCategoryGUID, "ptr*", &ppIEnumWiaItem2 := 0, "HRESULT")
        return IEnumWiaItem2(ppIEnumWiaItem2)
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrFullItemName 
     * @returns {IWiaItem2} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-finditembyname
     */
    FindItemByName(lFlags, bstrFullItemName) {
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(6, this, "int", lFlags, "ptr", bstrFullItemName, "ptr*", &ppIWiaItem2 := 0, "HRESULT")
        return IWiaItem2(ppIWiaItem2)
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getitemcategory
     */
    GetItemCategory() {
        pItemCategoryGUID := Guid()
        result := ComCall(7, this, "ptr", pItemCategoryGUID, "HRESULT")
        return pItemCategoryGUID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getitemtype
     */
    GetItemType() {
        result := ComCall(8, this, "int*", &pItemType := 0, "HRESULT")
        return pItemType
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {HWND} hwndParent 
     * @param {BSTR} bstrFolderName 
     * @param {BSTR} bstrFilename 
     * @param {Pointer<Integer>} plNumFiles 
     * @param {Pointer<Pointer<BSTR>>} ppbstrFilePaths 
     * @param {Pointer<IWiaItem2>} ppItem 
     * @returns {HRESULT} 
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
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<Guid>} pCmdGUID 
     * @param {Pointer<IWiaItem2>} ppIWiaItem2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-devicecommand
     */
    DeviceCommand(lFlags, pCmdGUID, ppIWiaItem2) {
        result := ComCall(10, this, "int", lFlags, "ptr", pCmdGUID, "ptr*", ppIWiaItem2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {IEnumWIA_DEV_CAPS} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-enumdevicecapabilities
     */
    EnumDeviceCapabilities(lFlags) {
        result := ComCall(11, this, "int", lFlags, "ptr*", &ppIEnumWIA_DEV_CAPS := 0, "HRESULT")
        return IEnumWIA_DEV_CAPS(ppIEnumWIA_DEV_CAPS)
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrName 
     * @param {Pointer<Guid>} riidExtensionInterface 
     * @param {Pointer<BOOL>} pbExtensionExists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-checkextension
     */
    CheckExtension(lFlags, bstrName, riidExtensionInterface, pbExtensionExists) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pbExtensionExistsMarshal := pbExtensionExists is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "int", lFlags, "ptr", bstrName, "ptr", riidExtensionInterface, pbExtensionExistsMarshal, pbExtensionExists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrName 
     * @param {Pointer<Guid>} riidExtensionInterface 
     * @param {Pointer<Pointer<Void>>} ppOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getextension
     */
    GetExtension(lFlags, bstrName, riidExtensionInterface, ppOut) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        ppOutMarshal := ppOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "int", lFlags, "ptr", bstrName, "ptr", riidExtensionInterface, ppOutMarshal, ppOut, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWiaItem2} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getparentitem
     */
    GetParentItem() {
        result := ComCall(14, this, "ptr*", &ppIWiaItem2 := 0, "HRESULT")
        return IWiaItem2(ppIWiaItem2)
    }

    /**
     * 
     * @returns {IWiaItem2} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getrootitem
     */
    GetRootItem() {
        result := ComCall(15, this, "ptr*", &ppIWiaItem2 := 0, "HRESULT")
        return IWiaItem2(ppIWiaItem2)
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {IWiaPreview} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-getpreviewcomponent
     */
    GetPreviewComponent(lFlags) {
        result := ComCall(16, this, "int", lFlags, "ptr*", &ppWiaPreview := 0, "HRESULT")
        return IWiaPreview(ppWiaPreview)
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<Guid>} pEventGUID 
     * @returns {IEnumWIA_DEV_CAPS} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaitem2-enumregistereventinfo
     */
    EnumRegisterEventInfo(lFlags, pEventGUID) {
        result := ComCall(17, this, "int", lFlags, "ptr", pEventGUID, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWIA_DEV_CAPS(ppIEnum)
    }

    /**
     * 
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
