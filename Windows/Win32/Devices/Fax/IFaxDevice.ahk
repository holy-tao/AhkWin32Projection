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
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BSTR} 
     */
    DeviceName {
        get => this.get_DeviceName()
    }

    /**
     * @type {BSTR} 
     */
    ProviderUniqueName {
        get => this.get_ProviderUniqueName()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    PoweredOff {
        get => this.get_PoweredOff()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ReceivingNow {
        get => this.get_ReceivingNow()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SendingNow {
        get => this.get_SendingNow()
    }

    /**
     * @type {VARIANT} 
     */
    UsedRoutingMethods {
        get => this.get_UsedRoutingMethods()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SendEnabled {
        get => this.get_SendEnabled()
        set => this.put_SendEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    ReceiveMode {
        get => this.get_ReceiveMode()
        set => this.put_ReceiveMode(value)
    }

    /**
     * @type {Integer} 
     */
    RingsBeforeAnswer {
        get => this.get_RingsBeforeAnswer()
        set => this.put_RingsBeforeAnswer(value)
    }

    /**
     * @type {BSTR} 
     */
    CSID {
        get => this.get_CSID()
        set => this.put_CSID(value)
    }

    /**
     * @type {BSTR} 
     */
    TSID {
        get => this.get_TSID()
        set => this.put_TSID(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RingingNow {
        get => this.get_RingingNow()
    }

    /**
     * The Id IFaxDevice::get_Id is a numeric value that uniquely identifies a fax device.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_id
     */
    get_Id() {
        result := ComCall(7, this, "int*", &plId := 0, "HRESULT")
        return plId
    }

    /**
     * The IFaxDevice::get_DeviceName property is a null-terminated string that contains the name of the fax device.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_devicename
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR()
        result := ComCall(8, this, "ptr", pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * The IFaxDevice::get_ProviderUniqueName property is a null-terminated string that contains the unique name for the fax service provider (FSP) associated with the device.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_provideruniquename
     */
    get_ProviderUniqueName() {
        pbstrProviderUniqueName := BSTR()
        result := ComCall(9, this, "ptr", pbstrProviderUniqueName, "HRESULT")
        return pbstrProviderUniqueName
    }

    /**
     * The IFaxDevice::get_PoweredOff property is a Boolean value that indicates whether the fax device is currently available for sending and receiving faxes.
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the fax device is currently offline and unavailable for sending and receiving faxes. If this property is equal to <b>FALSE</b>, the fax device is online and available.
     * 
     * <div class="alert"><b>Note</b>  The value of this property is set at the time that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object is created and is refreshed when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method.</div>
     * <div> </div>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_poweredoff
     */
    get_PoweredOff() {
        result := ComCall(10, this, "short*", &pbPoweredOff := 0, "HRESULT")
        return pbPoweredOff
    }

    /**
     * The IFaxDevice::get_ReceivingNow property is a Boolean value that indicates whether the fax device is receiving a fax at the moment the property is retrieved (the status could change immediately thereafter).
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the fax device is currently receiving a fax. If this property is equal to <b>FALSE</b>, the fax device is not currently receiving a fax.
     * 
     * <div class="alert"><b>Note</b>  The value of this property is set at the time that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object is created and is refreshed when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method.</div>
     * <div> </div>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_receivingnow
     */
    get_ReceivingNow() {
        result := ComCall(11, this, "short*", &pbReceivingNow := 0, "HRESULT")
        return pbReceivingNow
    }

    /**
     * The IFaxDevice::get_SendingNow property is a Boolean value that indicates whether the fax device is sending a fax at the moment the property is retrieved (the status could change immediately thereafter).
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the fax device is currently sending a fax. If this property is equal to <b>FALSE</b>, the fax device is not currently sending a fax.
     * 
     * <div class="alert"><b>Note</b>  The value of this property is set at the time that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object is created and is refreshed when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method.</div>
     * <div> </div>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_sendingnow
     */
    get_SendingNow() {
        result := ComCall(12, this, "short*", &pbSendingNow := 0, "HRESULT")
        return pbSendingNow
    }

    /**
     * The IFaxDevice::get_UsedRoutingMethods property is an array of strings that contains the GUIDs associated with the routing methods that the device uses, where each GUID represents an inbound routing method (FaxInboundRoutingMethod).
     * @remarks
     * 
     * To add a routing method to or remove a routing method from the array of routing method GUIDs, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-useroutingmethod-vb">IFaxDevice::UseRoutingMethod</a> method.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_usedroutingmethods
     */
    get_UsedRoutingMethods() {
        pvUsedRoutingMethods := VARIANT()
        result := ComCall(13, this, "ptr", pvUsedRoutingMethods, "HRESULT")
        return pvUsedRoutingMethods
    }

    /**
     * The IFaxDevice::get_Description property is a null-terminated string that contains a user-friendly description for the fax device. This string is suitable for display to users.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(14, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * The IFaxDevice::get_Description property is a null-terminated string that contains a user-friendly description for the fax device. This string is suitable for display to users.
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(15, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_SendEnabled property is a Boolean value that indicates whether the fax device is enabled for sending faxes.
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the fax device is enabled to send faxes. If this property is equal to <b>FALSE</b>, the fax device is not enabled to send faxes.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_sendenabled
     */
    get_SendEnabled() {
        result := ComCall(16, this, "short*", &pbSendEnabled := 0, "HRESULT")
        return pbSendEnabled
    }

    /**
     * The IFaxDevice::get_SendEnabled property is a Boolean value that indicates whether the fax device is enabled for sending faxes.
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the fax device is enabled to send faxes. If this property is equal to <b>FALSE</b>, the fax device is not enabled to send faxes.
     * 
     * 
     * @param {VARIANT_BOOL} bSendEnabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-put_sendenabled
     */
    put_SendEnabled(bSendEnabled) {
        result := ComCall(17, this, "short", bSendEnabled, "HRESULT")
        return result
    }

    /**
     * The ReceiveMode property is a value from the FAX_DEVICE_RECEIVE_MODE_ENUM enumeration that defines the way a device answers an incoming call.
     * @remarks
     * 
     * You can set only one device to receive faxes manually at any given time. If you set a device to answer manually and another device is already set to the manual mode, the device that had been previously set will automatically change to the no-answer mode. You should call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method on that device to see the change.
     * 
     * Some devices, such as virtual devices, do not support the manual-answer receive mode. For those devices, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-receivemode">ReceiveMode</a> will fail if you set the receive mode to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_device_receive_mode_enum">fdrmMANUAL_ANSWER</a>. In C++, the method will return an ERROR_NOT_SUPPORTED error code in an <b>HRESULT</b> format.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_receivemode
     */
    get_ReceiveMode() {
        result := ComCall(18, this, "int*", &pReceiveMode := 0, "HRESULT")
        return pReceiveMode
    }

    /**
     * The ReceiveMode property is a value from the FAX_DEVICE_RECEIVE_MODE_ENUM enumeration that defines the way a device answers an incoming call.
     * @remarks
     * 
     * You can set only one device to receive faxes manually at any given time. If you set a device to answer manually and another device is already set to the manual mode, the device that had been previously set will automatically change to the no-answer mode. You should call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method on that device to see the change.
     * 
     * Some devices, such as virtual devices, do not support the manual-answer receive mode. For those devices, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-receivemode">ReceiveMode</a> will fail if you set the receive mode to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_device_receive_mode_enum">fdrmMANUAL_ANSWER</a>. In C++, the method will return an ERROR_NOT_SUPPORTED error code in an <b>HRESULT</b> format.
     * 
     * 
     * @param {Integer} ReceiveMode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-put_receivemode
     */
    put_ReceiveMode(ReceiveMode) {
        result := ComCall(19, this, "int", ReceiveMode, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_RingsBeforeAnswer property is a number that specifies the number of rings that occur before the fax device answers an incoming fax call.
     * @remarks
     * 
     * This property is used only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-receivemode">ReceiveMode</a> property of the device is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_device_receive_mode_enum">fdrmAUTO_ANSWER</a>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_ringsbeforeanswer
     */
    get_RingsBeforeAnswer() {
        result := ComCall(20, this, "int*", &plRingsBeforeAnswer := 0, "HRESULT")
        return plRingsBeforeAnswer
    }

    /**
     * The IFaxDevice::get_RingsBeforeAnswer property is a number that specifies the number of rings that occur before the fax device answers an incoming fax call.
     * @remarks
     * 
     * This property is used only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-receivemode">ReceiveMode</a> property of the device is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_device_receive_mode_enum">fdrmAUTO_ANSWER</a>.
     * 
     * 
     * @param {Integer} lRingsBeforeAnswer 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-put_ringsbeforeanswer
     */
    put_RingsBeforeAnswer(lRingsBeforeAnswer) {
        result := ComCall(21, this, "int", lRingsBeforeAnswer, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_CSID property is a null-terminated string that contains the called station identifier (CSID) for the device.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The CSID is limited to 20 characters. Also, because most fax machines accept a limited set of characters in the fax transmission CSID and transmitting station identifier (TSID) strings, it is advisable to use only English letters, numeric symbols, and punctuation marks (ASCII range 0x20 to 0x7F) in these strings.</div>
     * <div> </div>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR()
        result := ComCall(22, this, "ptr", pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * The IFaxDevice::get_CSID property is a null-terminated string that contains the called station identifier (CSID) for the device.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The CSID is limited to 20 characters. Also, because most fax machines accept a limited set of characters in the fax transmission CSID and transmitting station identifier (TSID) strings, it is advisable to use only English letters, numeric symbols, and punctuation marks (ASCII range 0x20 to 0x7F) in these strings.</div>
     * <div> </div>
     * 
     * 
     * @param {BSTR} bstrCSID 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-put_csid
     */
    put_CSID(bstrCSID) {
        bstrCSID := bstrCSID is String ? BSTR.Alloc(bstrCSID).Value : bstrCSID

        result := ComCall(23, this, "ptr", bstrCSID, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_TSID property is a null-terminated string that contains the transmitting station identifier (TSID) for the device.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The TSID is limited to 20 characters. Also, because most fax machines accept a limited set of characters in the fax transmission called station identifier (CSID) and TSID strings, it is advisable to use only English letters, numeric symbols, and punctuation marks (ASCII range 0x20 to 0x7F) in these strings.</div>
     * <div> </div>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(24, this, "ptr", pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * The IFaxDevice::get_TSID property is a null-terminated string that contains the transmitting station identifier (TSID) for the device.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The TSID is limited to 20 characters. Also, because most fax machines accept a limited set of characters in the fax transmission called station identifier (CSID) and TSID strings, it is advisable to use only English letters, numeric symbols, and punctuation marks (ASCII range 0x20 to 0x7F) in these strings.</div>
     * <div> </div>
     * 
     * 
     * @param {BSTR} bstrTSID 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-put_tsid
     */
    put_TSID(bstrTSID) {
        bstrTSID := bstrTSID is String ? BSTR.Alloc(bstrTSID).Value : bstrTSID

        result := ComCall(25, this, "ptr", bstrTSID, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::Refresh method refreshes FaxDevice object information from the fax server. When the IFaxDevice::Refresh method is called, any configuration changes made after the last IFaxDevice::Save method call are lost.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-refresh
     */
    Refresh() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::Save method saves the FaxDevice object's data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-save
     */
    Save() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_GetExtensionProperty method retrieves an extension configuration property stored at the device level.
     * @param {BSTR} bstrGUID Type: <b>BSTR</b>
     * 
     * Specifies a string GUID that uniquely identifies the data to be retrieved.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * <b>VARIANT</b> that specifies the data.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-getextensionproperty
     */
    GetExtensionProperty(bstrGUID) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        pvProperty := VARIANT()
        result := ComCall(28, this, "ptr", bstrGUID, "ptr", pvProperty, "HRESULT")
        return pvProperty
    }

    /**
     * The IFaxDevice::SetExtensionProperty method stores an extension configuration property at the device level.
     * @param {BSTR} bstrGUID Type: <b>BSTR</b>
     * 
     * Specifies a string GUID that identifies the data to set.
     * @param {VARIANT} vProperty Type: <b>VARIANT</b>
     * 
     * <b>VARIANT</b> that specifies the data to be stored.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-setextensionproperty
     */
    SetExtensionProperty(bstrGUID, vProperty) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        result := ComCall(29, this, "ptr", bstrGUID, "ptr", vProperty, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::UseRoutingMethod method adds an inbound fax routing method to or removes a fax routing method (FaxInboundRoutingMethod) from the list of routing methods associated with the fax device.
     * @param {BSTR} bstrMethodGUID Type: <b>BSTR</b>
     * 
     * Specifies a null-terminated string that uniquely identifies the fax routing method to add or remove.
     * @param {VARIANT_BOOL} bUse Type: <b>VARIANT_BOOL</b>
     * 
     * Specifies a Boolean value. If this parameter is equal to <b>TRUE</b>, the method adds the fax routing method to the list of inbound methods associated with the fax device. If you set this parameter to <b>FALSE</b>, the method removes the routing method from the list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-useroutingmethod
     */
    UseRoutingMethod(bstrMethodGUID, bUse) {
        bstrMethodGUID := bstrMethodGUID is String ? BSTR.Alloc(bstrMethodGUID).Value : bstrMethodGUID

        result := ComCall(30, this, "ptr", bstrMethodGUID, "short", bUse, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_RingingNow property is a Boolean value that indicates whether the fax device is ringing at the moment the property is retrieved (the status could change immediately thereafter).
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the fax device is currently ringing. If this property is equal to <b>FALSE</b>, the fax device is not ringing.
     * 
     * <div class="alert"><b>Note</b>  The value of this property is set at the time that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object is created, and is refreshed when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method.</div>
     * <div> </div>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-get_ringingnow
     */
    get_RingingNow() {
        result := ComCall(31, this, "short*", &pbRingingNow := 0, "HRESULT")
        return pbRingingNow
    }

    /**
     * The IFaxDevice::AnswerCall method causes the fax device to answer an incoming call.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdevice-answercall
     */
    AnswerCall() {
        result := ComCall(32, this, "HRESULT")
        return result
    }
}
