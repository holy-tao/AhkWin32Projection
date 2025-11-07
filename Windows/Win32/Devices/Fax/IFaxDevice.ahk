#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_id
     */
    get_Id() {
        result := ComCall(7, this, "int*", &plId := 0, "HRESULT")
        return plId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_devicename
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR()
        result := ComCall(8, this, "ptr", pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_provideruniquename
     */
    get_ProviderUniqueName() {
        pbstrProviderUniqueName := BSTR()
        result := ComCall(9, this, "ptr", pbstrProviderUniqueName, "HRESULT")
        return pbstrProviderUniqueName
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_poweredoff
     */
    get_PoweredOff() {
        result := ComCall(10, this, "short*", &pbPoweredOff := 0, "HRESULT")
        return pbPoweredOff
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_receivingnow
     */
    get_ReceivingNow() {
        result := ComCall(11, this, "short*", &pbReceivingNow := 0, "HRESULT")
        return pbReceivingNow
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_sendingnow
     */
    get_SendingNow() {
        result := ComCall(12, this, "short*", &pbSendingNow := 0, "HRESULT")
        return pbSendingNow
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_usedroutingmethods
     */
    get_UsedRoutingMethods() {
        pvUsedRoutingMethods := VARIANT()
        result := ComCall(13, this, "ptr", pvUsedRoutingMethods, "HRESULT")
        return pvUsedRoutingMethods
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(14, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_sendenabled
     */
    get_SendEnabled() {
        result := ComCall(16, this, "short*", &pbSendEnabled := 0, "HRESULT")
        return pbSendEnabled
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_receivemode
     */
    get_ReceiveMode() {
        result := ComCall(18, this, "int*", &pReceiveMode := 0, "HRESULT")
        return pReceiveMode
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_ringsbeforeanswer
     */
    get_RingsBeforeAnswer() {
        result := ComCall(20, this, "int*", &plRingsBeforeAnswer := 0, "HRESULT")
        return plRingsBeforeAnswer
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR()
        result := ComCall(22, this, "ptr", pbstrCSID, "HRESULT")
        return pbstrCSID
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(24, this, "ptr", pbstrTSID, "HRESULT")
        return pbstrTSID
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-getextensionproperty
     */
    GetExtensionProperty(bstrGUID) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        pvProperty := VARIANT()
        result := ComCall(28, this, "ptr", bstrGUID, "ptr", pvProperty, "HRESULT")
        return pvProperty
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_ringingnow
     */
    get_RingingNow() {
        result := ComCall(31, this, "short*", &pbRingingNow := 0, "HRESULT")
        return pbRingingNow
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
