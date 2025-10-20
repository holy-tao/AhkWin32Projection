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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_DeviceName", "get_ProviderUniqueName", "get_PoweredOff", "get_ReceivingNow", "get_SendingNow", "get_UsedRoutingMethods", "get_Description", "put_Description", "get_SendEnabled", "put_SendEnabled", "get_ReceiveMode", "put_ReceiveMode", "get_RingsBeforeAnswer", "put_RingsBeforeAnswer", "get_CSID", "put_CSID", "get_TSID", "put_TSID", "Refresh", "Save", "GetExtensionProperty", "SetExtensionProperty", "UseRoutingMethod", "get_RingingNow", "AnswerCall"]

    /**
     * 
     * @param {Pointer<Integer>} plId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_id
     */
    get_Id(plId) {
        result := ComCall(7, this, "int*", plId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDeviceName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_devicename
     */
    get_DeviceName(pbstrDeviceName) {
        result := ComCall(8, this, "ptr", pbstrDeviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrProviderUniqueName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_provideruniquename
     */
    get_ProviderUniqueName(pbstrProviderUniqueName) {
        result := ComCall(9, this, "ptr", pbstrProviderUniqueName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbPoweredOff 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_poweredoff
     */
    get_PoweredOff(pbPoweredOff) {
        result := ComCall(10, this, "ptr", pbPoweredOff, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbReceivingNow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_receivingnow
     */
    get_ReceivingNow(pbReceivingNow) {
        result := ComCall(11, this, "ptr", pbReceivingNow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSendingNow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_sendingnow
     */
    get_SendingNow(pbSendingNow) {
        result := ComCall(12, this, "ptr", pbSendingNow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvUsedRoutingMethods 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_usedroutingmethods
     */
    get_UsedRoutingMethods(pvUsedRoutingMethods) {
        result := ComCall(13, this, "ptr", pvUsedRoutingMethods, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_description
     */
    get_Description(pbstrDescription) {
        result := ComCall(14, this, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(15, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSendEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_sendenabled
     */
    get_SendEnabled(pbSendEnabled) {
        result := ComCall(16, this, "ptr", pbSendEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSendEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_sendenabled
     */
    put_SendEnabled(bSendEnabled) {
        result := ComCall(17, this, "short", bSendEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pReceiveMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_receivemode
     */
    get_ReceiveMode(pReceiveMode) {
        result := ComCall(18, this, "int*", pReceiveMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ReceiveMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_receivemode
     */
    put_ReceiveMode(ReceiveMode) {
        result := ComCall(19, this, "int", ReceiveMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRingsBeforeAnswer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_ringsbeforeanswer
     */
    get_RingsBeforeAnswer(plRingsBeforeAnswer) {
        result := ComCall(20, this, "int*", plRingsBeforeAnswer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRingsBeforeAnswer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_ringsbeforeanswer
     */
    put_RingsBeforeAnswer(lRingsBeforeAnswer) {
        result := ComCall(21, this, "int", lRingsBeforeAnswer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_csid
     */
    get_CSID(pbstrCSID) {
        result := ComCall(22, this, "ptr", pbstrCSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_csid
     */
    put_CSID(bstrCSID) {
        bstrCSID := bstrCSID is String ? BSTR.Alloc(bstrCSID).Value : bstrCSID

        result := ComCall(23, this, "ptr", bstrCSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_tsid
     */
    get_TSID(pbstrTSID) {
        result := ComCall(24, this, "ptr", pbstrTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_tsid
     */
    put_TSID(bstrTSID) {
        bstrTSID := bstrTSID is String ? BSTR.Alloc(bstrTSID).Value : bstrTSID

        result := ComCall(25, this, "ptr", bstrTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-refresh
     */
    Refresh() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-save
     */
    Save() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGUID 
     * @param {Pointer<VARIANT>} pvProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-getextensionproperty
     */
    GetExtensionProperty(bstrGUID, pvProperty) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        result := ComCall(28, this, "ptr", bstrGUID, "ptr", pvProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGUID 
     * @param {VARIANT} vProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-setextensionproperty
     */
    SetExtensionProperty(bstrGUID, vProperty) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        result := ComCall(29, this, "ptr", bstrGUID, "ptr", vProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMethodGUID 
     * @param {VARIANT_BOOL} bUse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-useroutingmethod
     */
    UseRoutingMethod(bstrMethodGUID, bUse) {
        bstrMethodGUID := bstrMethodGUID is String ? BSTR.Alloc(bstrMethodGUID).Value : bstrMethodGUID

        result := ComCall(30, this, "ptr", bstrMethodGUID, "short", bUse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRingingNow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_ringingnow
     */
    get_RingingNow(pbRingingNow) {
        result := ComCall(31, this, "ptr", pbRingingNow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-answercall
     */
    AnswerCall() {
        result := ComCall(32, this, "HRESULT")
        return result
    }
}
