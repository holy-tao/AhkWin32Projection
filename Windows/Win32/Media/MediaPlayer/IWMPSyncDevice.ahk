#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPSyncDevice interface represents a device to which Windows Media Player 10 or later can copy digital media files.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpsyncdevice
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSyncDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSyncDevice
     * @type {Guid}
     */
    static IID => Guid("{82a2986c-0293-4fd0-b279-b21b86c058be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_friendlyName", "put_friendlyName", "get_deviceName", "get_deviceId", "get_partnershipIndex", "get_connected", "get_status", "get_syncState", "get_progress", "getItemInfo", "createPartnership", "deletePartnership", "start", "stop", "showSettings", "isIdentical"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-get_friendlyname
     */
    get_friendlyName(pbstrName) {
        result := ComCall(3, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-put_friendlyname
     */
    put_friendlyName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(4, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-get_devicename
     */
    get_deviceName(pbstrName) {
        result := ComCall(5, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-get_deviceid
     */
    get_deviceId(pbstrDeviceId) {
        result := ComCall(6, this, "ptr", pbstrDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-get_partnershipindex
     */
    get_partnershipIndex(plIndex) {
        plIndexMarshal := plIndex is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plIndexMarshal, plIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbConnected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-get_connected
     */
    get_connected(pvbConnected) {
        pvbConnectedMarshal := pvbConnected is VarRef ? "short*" : "ptr"

        result := ComCall(8, this, pvbConnectedMarshal, pvbConnected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwmpds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-get_status
     */
    get_status(pwmpds) {
        pwmpdsMarshal := pwmpds is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pwmpdsMarshal, pwmpds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwmpss 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-get_syncstate
     */
    get_syncState(pwmpss) {
        pwmpssMarshal := pwmpss is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pwmpssMarshal, pwmpss, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-get_progress
     */
    get_progress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plProgressMarshal, plProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-getiteminfo
     */
    getItemInfo(bstrItemName, pbstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(12, this, "ptr", bstrItemName, "ptr", pbstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbShowUI 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-createpartnership
     */
    createPartnership(vbShowUI) {
        result := ComCall(13, this, "short", vbShowUI, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-deletepartnership
     */
    deletePartnership() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-start
     */
    start() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-stop
     */
    stop() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-showsettings
     */
    showSettings() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPSyncDevice} pDevice 
     * @param {Pointer<VARIANT_BOOL>} pvbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice-isidentical
     */
    isIdentical(pDevice, pvbool) {
        pvboolMarshal := pvbool is VarRef ? "short*" : "ptr"

        result := ComCall(18, this, "ptr", pDevice, pvboolMarshal, pvbool, "HRESULT")
        return result
    }
}
