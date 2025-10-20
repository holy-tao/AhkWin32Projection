#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxDevice interface defines a configuration object used by a fax client application to retrieve and set fax device information, and to add and remove fax routing methods associated with a fax device.
 * @remarks
 * 
  * A default implementation of <b>IFaxDevice</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxdevice
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxDevice extends IDispatch{
    /**
     * The interface identifier for IFaxDevice
     * @type {Guid}
     */
    static IID => Guid("{49306c59-b52e-4867-9df4-ca5841c956d0}")

    /**
     * The class identifier for FaxDevice
     * @type {Guid}
     */
    static CLSID => Guid("{59e3a5b2-d676-484b-a6de-720bfa89b5af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plId 
     * @returns {HRESULT} 
     */
    get_Id(plId) {
        result := ComCall(7, this, "int*", plId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDeviceName 
     * @returns {HRESULT} 
     */
    get_DeviceName(pbstrDeviceName) {
        result := ComCall(8, this, "ptr", pbstrDeviceName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrProviderUniqueName 
     * @returns {HRESULT} 
     */
    get_ProviderUniqueName(pbstrProviderUniqueName) {
        result := ComCall(9, this, "ptr", pbstrProviderUniqueName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbPoweredOff 
     * @returns {HRESULT} 
     */
    get_PoweredOff(pbPoweredOff) {
        result := ComCall(10, this, "ptr", pbPoweredOff, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbReceivingNow 
     * @returns {HRESULT} 
     */
    get_ReceivingNow(pbReceivingNow) {
        result := ComCall(11, this, "ptr", pbReceivingNow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSendingNow 
     * @returns {HRESULT} 
     */
    get_SendingNow(pbSendingNow) {
        result := ComCall(12, this, "ptr", pbSendingNow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvUsedRoutingMethods 
     * @returns {HRESULT} 
     */
    get_UsedRoutingMethods(pvUsedRoutingMethods) {
        result := ComCall(13, this, "ptr", pvUsedRoutingMethods, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    get_Description(pbstrDescription) {
        result := ComCall(14, this, "ptr", pbstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(15, this, "ptr", bstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSendEnabled 
     * @returns {HRESULT} 
     */
    get_SendEnabled(pbSendEnabled) {
        result := ComCall(16, this, "ptr", pbSendEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSendEnabled 
     * @returns {HRESULT} 
     */
    put_SendEnabled(bSendEnabled) {
        result := ComCall(17, this, "short", bSendEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pReceiveMode 
     * @returns {HRESULT} 
     */
    get_ReceiveMode(pReceiveMode) {
        result := ComCall(18, this, "int*", pReceiveMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ReceiveMode 
     * @returns {HRESULT} 
     */
    put_ReceiveMode(ReceiveMode) {
        result := ComCall(19, this, "int", ReceiveMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRingsBeforeAnswer 
     * @returns {HRESULT} 
     */
    get_RingsBeforeAnswer(plRingsBeforeAnswer) {
        result := ComCall(20, this, "int*", plRingsBeforeAnswer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRingsBeforeAnswer 
     * @returns {HRESULT} 
     */
    put_RingsBeforeAnswer(lRingsBeforeAnswer) {
        result := ComCall(21, this, "int", lRingsBeforeAnswer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCSID 
     * @returns {HRESULT} 
     */
    get_CSID(pbstrCSID) {
        result := ComCall(22, this, "ptr", pbstrCSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCSID 
     * @returns {HRESULT} 
     */
    put_CSID(bstrCSID) {
        bstrCSID := bstrCSID is String ? BSTR.Alloc(bstrCSID).Value : bstrCSID

        result := ComCall(23, this, "ptr", bstrCSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTSID 
     * @returns {HRESULT} 
     */
    get_TSID(pbstrTSID) {
        result := ComCall(24, this, "ptr", pbstrTSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTSID 
     * @returns {HRESULT} 
     */
    put_TSID(bstrTSID) {
        bstrTSID := bstrTSID is String ? BSTR.Alloc(bstrTSID).Value : bstrTSID

        result := ComCall(25, this, "ptr", bstrTSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(26, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(27, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGUID 
     * @param {Pointer<VARIANT>} pvProperty 
     * @returns {HRESULT} 
     */
    GetExtensionProperty(bstrGUID, pvProperty) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        result := ComCall(28, this, "ptr", bstrGUID, "ptr", pvProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGUID 
     * @param {VARIANT} vProperty 
     * @returns {HRESULT} 
     */
    SetExtensionProperty(bstrGUID, vProperty) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        result := ComCall(29, this, "ptr", bstrGUID, "ptr", vProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrMethodGUID 
     * @param {VARIANT_BOOL} bUse 
     * @returns {HRESULT} 
     */
    UseRoutingMethod(bstrMethodGUID, bUse) {
        bstrMethodGUID := bstrMethodGUID is String ? BSTR.Alloc(bstrMethodGUID).Value : bstrMethodGUID

        result := ComCall(30, this, "ptr", bstrMethodGUID, "short", bUse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRingingNow 
     * @returns {HRESULT} 
     */
    get_RingingNow(pbRingingNow) {
        result := ComCall(31, this, "ptr", pbRingingNow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AnswerCall() {
        result := ComCall(32, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
