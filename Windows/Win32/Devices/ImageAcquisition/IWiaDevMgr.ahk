#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumWIA_DEV_INFO.ahk
#Include .\IWiaItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the IWiaDevMgr interface to create and manage image acquisition devices.
 * @remarks
 * 
  * The <b>IWiaDevMgr</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
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
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-iwiadevmgr
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaDevMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaDevMgr
     * @type {Guid}
     */
    static IID => Guid("{5eb2502a-8cf1-11d1-bf92-0060081ed811}")

    /**
     * The class identifier for WiaDevMgr
     * @type {Guid}
     */
    static CLSID => Guid("{a1f4e726-8cf1-11d1-bf92-0060081ed811}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumDeviceInfo", "CreateDevice", "SelectDeviceDlg", "SelectDeviceDlgID", "GetImageDlg", "RegisterEventCallbackProgram", "RegisterEventCallbackInterface", "RegisterEventCallbackCLSID", "AddDeviceDlg"]

    /**
     * 
     * @param {Integer} lFlag 
     * @returns {IEnumWIA_DEV_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadevmgr-enumdeviceinfo
     */
    EnumDeviceInfo(lFlag) {
        result := ComCall(3, this, "int", lFlag, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWIA_DEV_INFO(ppIEnum)
    }

    /**
     * 
     * @param {BSTR} bstrDeviceID 
     * @returns {IWiaItem} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadevmgr-createdevice
     */
    CreateDevice(bstrDeviceID) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID

        result := ComCall(4, this, "ptr", bstrDeviceID, "ptr*", &ppWiaItemRoot := 0, "HRESULT")
        return IWiaItem(ppWiaItemRoot)
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} lDeviceType 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} pbstrDeviceID 
     * @returns {IWiaItem} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadevmgr-selectdevicedlg
     */
    SelectDeviceDlg(hwndParent, lDeviceType, lFlags, pbstrDeviceID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "int", lDeviceType, "int", lFlags, "ptr", pbstrDeviceID, "ptr*", &ppItemRoot := 0, "HRESULT")
        return IWiaItem(ppItemRoot)
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} lDeviceType 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} pbstrDeviceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadevmgr-selectdevicedlgid
     */
    SelectDeviceDlgID(hwndParent, lDeviceType, lFlags, pbstrDeviceID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "int", lDeviceType, "int", lFlags, "ptr", pbstrDeviceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} lDeviceType 
     * @param {Integer} lFlags 
     * @param {Integer} lIntent 
     * @param {IWiaItem} pItemRoot 
     * @param {BSTR} bstrFilename 
     * @param {Pointer<Guid>} pguidFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadevmgr-getimagedlg
     */
    GetImageDlg(hwndParent, lDeviceType, lFlags, lIntent, pItemRoot, bstrFilename, pguidFormat) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        bstrFilename := bstrFilename is String ? BSTR.Alloc(bstrFilename).Value : bstrFilename

        result := ComCall(7, this, "ptr", hwndParent, "int", lDeviceType, "int", lFlags, "int", lIntent, "ptr", pItemRoot, "ptr", bstrFilename, "ptr", pguidFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrDeviceID 
     * @param {Pointer<Guid>} pEventGUID 
     * @param {BSTR} bstrCommandline 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrDescription 
     * @param {BSTR} bstrIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadevmgr-registereventcallbackprogram
     */
    RegisterEventCallbackProgram(lFlags, bstrDeviceID, pEventGUID, bstrCommandline, bstrName, bstrDescription, bstrIcon) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID
        bstrCommandline := bstrCommandline is String ? BSTR.Alloc(bstrCommandline).Value : bstrCommandline
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription
        bstrIcon := bstrIcon is String ? BSTR.Alloc(bstrIcon).Value : bstrIcon

        result := ComCall(8, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", bstrCommandline, "ptr", bstrName, "ptr", bstrDescription, "ptr", bstrIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrDeviceID 
     * @param {Pointer<Guid>} pEventGUID 
     * @param {IWiaEventCallback} pIWiaEventCallback 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadevmgr-registereventcallbackinterface
     */
    RegisterEventCallbackInterface(lFlags, bstrDeviceID, pEventGUID, pIWiaEventCallback) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID

        result := ComCall(9, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", pIWiaEventCallback, "ptr*", &pEventObject := 0, "HRESULT")
        return IUnknown(pEventObject)
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
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadevmgr-registereventcallbackclsid
     */
    RegisterEventCallbackCLSID(lFlags, bstrDeviceID, pEventGUID, pClsID, bstrName, bstrDescription, bstrIcon) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription
        bstrIcon := bstrIcon is String ? BSTR.Alloc(bstrIcon).Value : bstrIcon

        result := ComCall(10, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", pClsID, "ptr", bstrName, "ptr", bstrDescription, "ptr", bstrIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadevmgr-adddevicedlg
     */
    AddDeviceDlg(hwndParent, lFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(11, this, "ptr", hwndParent, "int", lFlags, "HRESULT")
        return result
    }
}
