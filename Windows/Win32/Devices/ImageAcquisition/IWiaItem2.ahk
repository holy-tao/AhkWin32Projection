#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaItem2 extends IUnknown{
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
     * 
     * @param {Integer} lItemFlags 
     * @param {Integer} lCreationFlags 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<IWiaItem2>} ppIWiaItem2 
     * @returns {HRESULT} 
     */
    CreateChildItem(lItemFlags, lCreationFlags, bstrItemName, ppIWiaItem2) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(3, this, "int", lItemFlags, "int", lCreationFlags, "ptr", bstrItemName, "ptr", ppIWiaItem2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    DeleteItem(lFlags) {
        result := ComCall(4, this, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCategoryGUID 
     * @param {Pointer<IEnumWiaItem2>} ppIEnumWiaItem2 
     * @returns {HRESULT} 
     */
    EnumChildItems(pCategoryGUID, ppIEnumWiaItem2) {
        result := ComCall(5, this, "ptr", pCategoryGUID, "ptr", ppIEnumWiaItem2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrFullItemName 
     * @param {Pointer<IWiaItem2>} ppIWiaItem2 
     * @returns {HRESULT} 
     */
    FindItemByName(lFlags, bstrFullItemName, ppIWiaItem2) {
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(6, this, "int", lFlags, "ptr", bstrFullItemName, "ptr", ppIWiaItem2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pItemCategoryGUID 
     * @returns {HRESULT} 
     */
    GetItemCategory(pItemCategoryGUID) {
        result := ComCall(7, this, "ptr", pItemCategoryGUID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pItemType 
     * @returns {HRESULT} 
     */
    GetItemType(pItemType) {
        result := ComCall(8, this, "int*", pItemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {HWND} hwndParent 
     * @param {BSTR} bstrFolderName 
     * @param {BSTR} bstrFilename 
     * @param {Pointer<Int32>} plNumFiles 
     * @param {Pointer<BSTR>} ppbstrFilePaths 
     * @param {Pointer<IWiaItem2>} ppItem 
     * @returns {HRESULT} 
     */
    DeviceDlg(lFlags, hwndParent, bstrFolderName, bstrFilename, plNumFiles, ppbstrFilePaths, ppItem) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        bstrFolderName := bstrFolderName is String ? BSTR.Alloc(bstrFolderName).Value : bstrFolderName
        bstrFilename := bstrFilename is String ? BSTR.Alloc(bstrFilename).Value : bstrFilename

        result := ComCall(9, this, "int", lFlags, "ptr", hwndParent, "ptr", bstrFolderName, "ptr", bstrFilename, "int*", plNumFiles, "ptr", ppbstrFilePaths, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<Guid>} pCmdGUID 
     * @param {Pointer<IWiaItem2>} ppIWiaItem2 
     * @returns {HRESULT} 
     */
    DeviceCommand(lFlags, pCmdGUID, ppIWiaItem2) {
        result := ComCall(10, this, "int", lFlags, "ptr", pCmdGUID, "ptr", ppIWiaItem2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IEnumWIA_DEV_CAPS>} ppIEnumWIA_DEV_CAPS 
     * @returns {HRESULT} 
     */
    EnumDeviceCapabilities(lFlags, ppIEnumWIA_DEV_CAPS) {
        result := ComCall(11, this, "int", lFlags, "ptr", ppIEnumWIA_DEV_CAPS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrName 
     * @param {Pointer<Guid>} riidExtensionInterface 
     * @param {Pointer<BOOL>} pbExtensionExists 
     * @returns {HRESULT} 
     */
    CheckExtension(lFlags, bstrName, riidExtensionInterface, pbExtensionExists) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(12, this, "int", lFlags, "ptr", bstrName, "ptr", riidExtensionInterface, "ptr", pbExtensionExists, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrName 
     * @param {Pointer<Guid>} riidExtensionInterface 
     * @param {Pointer<Void>} ppOut 
     * @returns {HRESULT} 
     */
    GetExtension(lFlags, bstrName, riidExtensionInterface, ppOut) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(13, this, "int", lFlags, "ptr", bstrName, "ptr", riidExtensionInterface, "ptr", ppOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWiaItem2>} ppIWiaItem2 
     * @returns {HRESULT} 
     */
    GetParentItem(ppIWiaItem2) {
        result := ComCall(14, this, "ptr", ppIWiaItem2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWiaItem2>} ppIWiaItem2 
     * @returns {HRESULT} 
     */
    GetRootItem(ppIWiaItem2) {
        result := ComCall(15, this, "ptr", ppIWiaItem2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWiaPreview>} ppWiaPreview 
     * @returns {HRESULT} 
     */
    GetPreviewComponent(lFlags, ppWiaPreview) {
        result := ComCall(16, this, "int", lFlags, "ptr", ppWiaPreview, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<Guid>} pEventGUID 
     * @param {Pointer<IEnumWIA_DEV_CAPS>} ppIEnum 
     * @returns {HRESULT} 
     */
    EnumRegisterEventInfo(lFlags, pEventGUID, ppIEnum) {
        result := ComCall(17, this, "int", lFlags, "ptr", pEventGUID, "ptr", ppIEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulSize 
     * @param {Pointer<Byte>} pBuffer 
     * @returns {HRESULT} 
     */
    Diagnostic(ulSize, pBuffer) {
        result := ComCall(18, this, "uint", ulSize, "char*", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
