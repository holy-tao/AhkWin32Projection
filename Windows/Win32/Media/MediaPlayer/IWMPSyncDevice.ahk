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
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_friendlyName(pbstrName) {
        result := ComCall(3, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_friendlyName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(4, this, "ptr", bstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_deviceName(pbstrName) {
        result := ComCall(5, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDeviceId 
     * @returns {HRESULT} 
     */
    get_deviceId(pbstrDeviceId) {
        result := ComCall(6, this, "ptr", pbstrDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plIndex 
     * @returns {HRESULT} 
     */
    get_partnershipIndex(plIndex) {
        result := ComCall(7, this, "int*", plIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbConnected 
     * @returns {HRESULT} 
     */
    get_connected(pvbConnected) {
        result := ComCall(8, this, "ptr", pvbConnected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pwmpds 
     * @returns {HRESULT} 
     */
    get_status(pwmpds) {
        result := ComCall(9, this, "int*", pwmpds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pwmpss 
     * @returns {HRESULT} 
     */
    get_syncState(pwmpss) {
        result := ComCall(10, this, "int*", pwmpss, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plProgress 
     * @returns {HRESULT} 
     */
    get_progress(plProgress) {
        result := ComCall(11, this, "int*", plProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     */
    getItemInfo(bstrItemName, pbstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(12, this, "ptr", bstrItemName, "ptr", pbstrVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbShowUI 
     * @returns {HRESULT} 
     */
    createPartnership(vbShowUI) {
        result := ComCall(13, this, "short", vbShowUI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deletePartnership() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    start() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stop() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    showSettings() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPSyncDevice>} pDevice 
     * @param {Pointer<VARIANT_BOOL>} pvbool 
     * @returns {HRESULT} 
     */
    isIdentical(pDevice, pvbool) {
        result := ComCall(18, this, "ptr", pDevice, "ptr", pvbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
