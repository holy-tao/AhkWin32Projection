#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaDevMgr2 extends IUnknown{
    /**
     * The interface identifier for IWiaDevMgr2
     * @type {Guid}
     */
    static IID => Guid("{79c07cf1-cbdd-41ee-8ec3-f00080cada7a}")

    /**
     * The class identifier for WiaDevMgr2
     * @type {Guid}
     */
    static CLSID => Guid("{b6c292bc-7c88-41ee-8b54-8ec92617e599}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IEnumWIA_DEV_INFO>} ppIEnum 
     * @returns {HRESULT} 
     */
    EnumDeviceInfo(lFlags, ppIEnum) {
        result := ComCall(3, this, "int", lFlags, "ptr", ppIEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrDeviceID 
     * @param {Pointer<IWiaItem2>} ppWiaItem2Root 
     * @returns {HRESULT} 
     */
    CreateDevice(lFlags, bstrDeviceID, ppWiaItem2Root) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID

        result := ComCall(4, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", ppWiaItem2Root, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} lDeviceType 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} pbstrDeviceID 
     * @param {Pointer<IWiaItem2>} ppItemRoot 
     * @returns {HRESULT} 
     */
    SelectDeviceDlg(hwndParent, lDeviceType, lFlags, pbstrDeviceID, ppItemRoot) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "int", lDeviceType, "int", lFlags, "ptr", pbstrDeviceID, "ptr", ppItemRoot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} lDeviceType 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} pbstrDeviceID 
     * @returns {HRESULT} 
     */
    SelectDeviceDlgID(hwndParent, lDeviceType, lFlags, pbstrDeviceID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "int", lDeviceType, "int", lFlags, "ptr", pbstrDeviceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrDeviceID 
     * @param {Pointer<Guid>} pEventGUID 
     * @param {Pointer<IWiaEventCallback>} pIWiaEventCallback 
     * @param {Pointer<IUnknown>} pEventObject 
     * @returns {HRESULT} 
     */
    RegisterEventCallbackInterface(lFlags, bstrDeviceID, pEventGUID, pIWiaEventCallback, pEventObject) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID

        result := ComCall(7, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", pIWiaEventCallback, "ptr", pEventObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrDeviceID 
     * @param {Pointer<Guid>} pEventGUID 
     * @param {BSTR} bstrFullAppName 
     * @param {BSTR} bstrCommandLineArg 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrDescription 
     * @param {BSTR} bstrIcon 
     * @returns {HRESULT} 
     */
    RegisterEventCallbackProgram(lFlags, bstrDeviceID, pEventGUID, bstrFullAppName, bstrCommandLineArg, bstrName, bstrDescription, bstrIcon) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID
        bstrFullAppName := bstrFullAppName is String ? BSTR.Alloc(bstrFullAppName).Value : bstrFullAppName
        bstrCommandLineArg := bstrCommandLineArg is String ? BSTR.Alloc(bstrCommandLineArg).Value : bstrCommandLineArg
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription
        bstrIcon := bstrIcon is String ? BSTR.Alloc(bstrIcon).Value : bstrIcon

        result := ComCall(8, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", bstrFullAppName, "ptr", bstrCommandLineArg, "ptr", bstrName, "ptr", bstrDescription, "ptr", bstrIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrDeviceID 
     * @param {Pointer<Guid>} pEventGUID 
     * @param {Pointer<Guid>} pClsID 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrDescription 
     * @param {BSTR} bstrIcon 
     * @returns {HRESULT} 
     */
    RegisterEventCallbackCLSID(lFlags, bstrDeviceID, pEventGUID, pClsID, bstrName, bstrDescription, bstrIcon) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription
        bstrIcon := bstrIcon is String ? BSTR.Alloc(bstrIcon).Value : bstrIcon

        result := ComCall(9, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", pClsID, "ptr", bstrName, "ptr", bstrDescription, "ptr", bstrIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrDeviceID 
     * @param {HWND} hwndParent 
     * @param {BSTR} bstrFolderName 
     * @param {BSTR} bstrFilename 
     * @param {Pointer<Int32>} plNumFiles 
     * @param {Pointer<BSTR>} ppbstrFilePaths 
     * @param {Pointer<IWiaItem2>} ppItem 
     * @returns {HRESULT} 
     */
    GetImageDlg(lFlags, bstrDeviceID, hwndParent, bstrFolderName, bstrFilename, plNumFiles, ppbstrFilePaths, ppItem) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        bstrFolderName := bstrFolderName is String ? BSTR.Alloc(bstrFolderName).Value : bstrFolderName
        bstrFilename := bstrFilename is String ? BSTR.Alloc(bstrFilename).Value : bstrFilename

        result := ComCall(10, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", hwndParent, "ptr", bstrFolderName, "ptr", bstrFilename, "int*", plNumFiles, "ptr", ppbstrFilePaths, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
