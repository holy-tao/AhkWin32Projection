#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\FAX_DEVICE_RECEIVE_MODE_ENUM.ahk" { FAX_DEVICE_RECEIVE_MODE_ENUM }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IFaxDevice interface defines a configuration object used by a fax client application to retrieve and set fax device information, and to add and remove fax routing methods associated with a fax device.
 * @remarks
 * A default implementation of <b>IFaxDevice</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxdevice
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxDevice extends IDispatch {
    /**
     * The interface identifier for IFaxDevice
     * @type {Guid}
     */
    static IID := Guid("{49306c59-b52e-4867-9df4-ca5841c956d0}")

    /**
     * The class identifier for FaxDevice
     * @type {Guid}
     */
    static CLSID := Guid("{59e3a5b2-d676-484b-a6de-720bfa89b5af}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxDevice interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id                 : IntPtr
        get_DeviceName         : IntPtr
        get_ProviderUniqueName : IntPtr
        get_PoweredOff         : IntPtr
        get_ReceivingNow       : IntPtr
        get_SendingNow         : IntPtr
        get_UsedRoutingMethods : IntPtr
        get_Description        : IntPtr
        put_Description        : IntPtr
        get_SendEnabled        : IntPtr
        put_SendEnabled        : IntPtr
        get_ReceiveMode        : IntPtr
        put_ReceiveMode        : IntPtr
        get_RingsBeforeAnswer  : IntPtr
        put_RingsBeforeAnswer  : IntPtr
        get_CSID               : IntPtr
        put_CSID               : IntPtr
        get_TSID               : IntPtr
        put_TSID               : IntPtr
        Refresh                : IntPtr
        Save                   : IntPtr
        GetExtensionProperty   : IntPtr
        SetExtensionProperty   : IntPtr
        UseRoutingMethod       : IntPtr
        get_RingingNow         : IntPtr
        AnswerCall             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {FAX_DEVICE_RECEIVE_MODE_ENUM} 
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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_id
     */
    get_Id() {
        result := ComCall(7, this, "int*", &plId := 0, "HRESULT")
        return plId
    }

    /**
     * The IFaxDevice::get_DeviceName property is a null-terminated string that contains the name of the fax device.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_devicename
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * The IFaxDevice::get_ProviderUniqueName property is a null-terminated string that contains the unique name for the fax service provider (FSP) associated with the device.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_provideruniquename
     */
    get_ProviderUniqueName() {
        pbstrProviderUniqueName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrProviderUniqueName, "HRESULT")
        return pbstrProviderUniqueName
    }

    /**
     * The IFaxDevice::get_PoweredOff property is a Boolean value that indicates whether the fax device is currently available for sending and receiving faxes.
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax device is currently offline and unavailable for sending and receiving faxes. If this property is equal to <b>FALSE</b>, the fax device is online and available.
     * 
     * <div class="alert"><b>Note</b>  The value of this property is set at the time that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object is created and is refreshed when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method.</div>
     * <div> </div>
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_poweredoff
     */
    get_PoweredOff() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pbPoweredOff := 0, "HRESULT")
        return pbPoweredOff
    }

    /**
     * The IFaxDevice::get_ReceivingNow property is a Boolean value that indicates whether the fax device is receiving a fax at the moment the property is retrieved (the status could change immediately thereafter).
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax device is currently receiving a fax. If this property is equal to <b>FALSE</b>, the fax device is not currently receiving a fax.
     * 
     * <div class="alert"><b>Note</b>  The value of this property is set at the time that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object is created and is refreshed when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method.</div>
     * <div> </div>
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_receivingnow
     */
    get_ReceivingNow() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &pbReceivingNow := 0, "HRESULT")
        return pbReceivingNow
    }

    /**
     * The IFaxDevice::get_SendingNow property is a Boolean value that indicates whether the fax device is sending a fax at the moment the property is retrieved (the status could change immediately thereafter).
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax device is currently sending a fax. If this property is equal to <b>FALSE</b>, the fax device is not currently sending a fax.
     * 
     * <div class="alert"><b>Note</b>  The value of this property is set at the time that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object is created and is refreshed when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method.</div>
     * <div> </div>
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_sendingnow
     */
    get_SendingNow() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &pbSendingNow := 0, "HRESULT")
        return pbSendingNow
    }

    /**
     * The IFaxDevice::get_UsedRoutingMethods property is an array of strings that contains the GUIDs associated with the routing methods that the device uses, where each GUID represents an inbound routing method (FaxInboundRoutingMethod).
     * @remarks
     * To add a routing method to or remove a routing method from the array of routing method GUIDs, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-useroutingmethod-vb">IFaxDevice::UseRoutingMethod</a> method.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_usedroutingmethods
     */
    get_UsedRoutingMethods() {
        pvUsedRoutingMethods := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, pvUsedRoutingMethods, "HRESULT")
        return pvUsedRoutingMethods
    }

    /**
     * The IFaxDevice::get_Description property is a null-terminated string that contains a user-friendly description for the fax device. This string is suitable for display to users. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_description
     */
    get_Description() {
        pbstrDescription := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * The IFaxDevice::get_Description property is a null-terminated string that contains a user-friendly description for the fax device. This string is suitable for display to users. (Put)
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(15, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_SendEnabled property is a Boolean value that indicates whether the fax device is enabled for sending faxes. (Get)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax device is enabled to send faxes. If this property is equal to <b>FALSE</b>, the fax device is not enabled to send faxes.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_sendenabled
     */
    get_SendEnabled() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &pbSendEnabled := 0, "HRESULT")
        return pbSendEnabled
    }

    /**
     * The IFaxDevice::get_SendEnabled property is a Boolean value that indicates whether the fax device is enabled for sending faxes. (Put)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax device is enabled to send faxes. If this property is equal to <b>FALSE</b>, the fax device is not enabled to send faxes.
     * @param {VARIANT_BOOL} bSendEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_sendenabled
     */
    put_SendEnabled(bSendEnabled) {
        result := ComCall(17, this, VARIANT_BOOL, bSendEnabled, "HRESULT")
        return result
    }

    /**
     * The ReceiveMode property is a value from the FAX_DEVICE_RECEIVE_MODE_ENUM enumeration that defines the way a device answers an incoming call. (Get)
     * @remarks
     * You can set only one device to receive faxes manually at any given time. If you set a device to answer manually and another device is already set to the manual mode, the device that had been previously set will automatically change to the no-answer mode. You should call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method on that device to see the change.
     * 
     * Some devices, such as virtual devices, do not support the manual-answer receive mode. For those devices, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-receivemode">ReceiveMode</a> will fail if you set the receive mode to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_device_receive_mode_enum">fdrmMANUAL_ANSWER</a>. In C++, the method will return an ERROR_NOT_SUPPORTED error code in an <b>HRESULT</b> format.
     * @returns {FAX_DEVICE_RECEIVE_MODE_ENUM} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_receivemode
     */
    get_ReceiveMode() {
        result := ComCall(18, this, "int*", &pReceiveMode := 0, "HRESULT")
        return pReceiveMode
    }

    /**
     * The ReceiveMode property is a value from the FAX_DEVICE_RECEIVE_MODE_ENUM enumeration that defines the way a device answers an incoming call. (Put)
     * @remarks
     * You can set only one device to receive faxes manually at any given time. If you set a device to answer manually and another device is already set to the manual mode, the device that had been previously set will automatically change to the no-answer mode. You should call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method on that device to see the change.
     * 
     * Some devices, such as virtual devices, do not support the manual-answer receive mode. For those devices, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-receivemode">ReceiveMode</a> will fail if you set the receive mode to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_device_receive_mode_enum">fdrmMANUAL_ANSWER</a>. In C++, the method will return an ERROR_NOT_SUPPORTED error code in an <b>HRESULT</b> format.
     * @param {FAX_DEVICE_RECEIVE_MODE_ENUM} ReceiveMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_receivemode
     */
    put_ReceiveMode(ReceiveMode) {
        result := ComCall(19, this, FAX_DEVICE_RECEIVE_MODE_ENUM, ReceiveMode, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_RingsBeforeAnswer property is a number that specifies the number of rings that occur before the fax device answers an incoming fax call. (Get)
     * @remarks
     * This property is used only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-receivemode">ReceiveMode</a> property of the device is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_device_receive_mode_enum">fdrmAUTO_ANSWER</a>.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_ringsbeforeanswer
     */
    get_RingsBeforeAnswer() {
        result := ComCall(20, this, "int*", &plRingsBeforeAnswer := 0, "HRESULT")
        return plRingsBeforeAnswer
    }

    /**
     * The IFaxDevice::get_RingsBeforeAnswer property is a number that specifies the number of rings that occur before the fax device answers an incoming fax call. (Put)
     * @remarks
     * This property is used only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-receivemode">ReceiveMode</a> property of the device is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_device_receive_mode_enum">fdrmAUTO_ANSWER</a>.
     * @param {Integer} lRingsBeforeAnswer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_ringsbeforeanswer
     */
    put_RingsBeforeAnswer(lRingsBeforeAnswer) {
        result := ComCall(21, this, "int", lRingsBeforeAnswer, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_CSID property is a null-terminated string that contains the called station identifier (CSID) for the device. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  The CSID is limited to 20 characters. Also, because most fax machines accept a limited set of characters in the fax transmission CSID and transmitting station identifier (TSID) strings, it is advisable to use only English letters, numeric symbols, and punctuation marks (ASCII range 0x20 to 0x7F) in these strings.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * The IFaxDevice::get_CSID property is a null-terminated string that contains the called station identifier (CSID) for the device. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  The CSID is limited to 20 characters. Also, because most fax machines accept a limited set of characters in the fax transmission CSID and transmitting station identifier (TSID) strings, it is advisable to use only English letters, numeric symbols, and punctuation marks (ASCII range 0x20 to 0x7F) in these strings.</div>
     * <div> </div>
     * @param {BSTR} bstrCSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_csid
     */
    put_CSID(bstrCSID) {
        bstrCSID := bstrCSID is String ? BSTR.Alloc(bstrCSID).Value : bstrCSID

        result := ComCall(23, this, BSTR, bstrCSID, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_TSID property is a null-terminated string that contains the transmitting station identifier (TSID) for the device. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  The TSID is limited to 20 characters. Also, because most fax machines accept a limited set of characters in the fax transmission called station identifier (CSID) and TSID strings, it is advisable to use only English letters, numeric symbols, and punctuation marks (ASCII range 0x20 to 0x7F) in these strings.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * The IFaxDevice::get_TSID property is a null-terminated string that contains the transmitting station identifier (TSID) for the device. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  The TSID is limited to 20 characters. Also, because most fax machines accept a limited set of characters in the fax transmission called station identifier (CSID) and TSID strings, it is advisable to use only English letters, numeric symbols, and punctuation marks (ASCII range 0x20 to 0x7F) in these strings.</div>
     * <div> </div>
     * @param {BSTR} bstrTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-put_tsid
     */
    put_TSID(bstrTSID) {
        bstrTSID := bstrTSID is String ? BSTR.Alloc(bstrTSID).Value : bstrTSID

        result := ComCall(25, this, BSTR, bstrTSID, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::Refresh method refreshes FaxDevice object information from the fax server. When the IFaxDevice::Refresh method is called, any configuration changes made after the last IFaxDevice::Save method call are lost.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-refresh
     */
    Refresh() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::Save method saves the FaxDevice object's data.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-save
     */
    Save() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_GetExtensionProperty method retrieves an extension configuration property stored at the device level.
     * @remarks
     * <div class="alert"><b>Note</b>  The returned data is a blob of bytes represented as a variant safe array of unsigned chars (VT_UI1 | VT_ARRAY). The data is relevant only to the specific extension that uses it. For more information see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-extension-configuration-api">About the Fax Extension Configuration API</a>.</div>
     * <div> </div>
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {BSTR} bstrGUID Type: <b>BSTR</b>
     * 
     * Specifies a string GUID that uniquely identifies the data to be retrieved.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * <b>VARIANT</b> that specifies the data.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-getextensionproperty
     */
    GetExtensionProperty(bstrGUID) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        pvProperty := VARIANT()
        result := ComCall(28, this, BSTR, bstrGUID, VARIANT.Ptr, pvProperty, "HRESULT")
        return pvProperty
    }

    /**
     * The IFaxDevice::SetExtensionProperty method stores an extension configuration property at the device level.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
     * 
     * <div class="alert"><b>Note</b>  The required data is a blob of bytes represented as a variant safe array of unsigned chars (VT_UI1 | VT_ARRAY). The data is relevant only to the specific extension that uses it. For more information see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-extension-configuration-api">About the Fax Extension Configuration API</a>.</div>
     * <div> </div>
     * @param {BSTR} bstrGUID Type: <b>BSTR</b>
     * 
     * Specifies a string GUID that identifies the data to set.
     * @param {VARIANT} vProperty Type: <b>VARIANT</b>
     * 
     * <b>VARIANT</b> that specifies the data to be stored.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-setextensionproperty
     */
    SetExtensionProperty(bstrGUID, vProperty) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        result := ComCall(29, this, BSTR, bstrGUID, VARIANT, vProperty, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::UseRoutingMethod method adds an inbound fax routing method to or removes a fax routing method (FaxInboundRoutingMethod) from the list of routing methods associated with the fax device.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
     * @param {BSTR} bstrMethodGUID Type: <b>BSTR</b>
     * 
     * Specifies a null-terminated string that uniquely identifies the fax routing method to add or remove.
     * @param {VARIANT_BOOL} bUse Type: <b>VARIANT_BOOL</b>
     * 
     * Specifies a Boolean value. If this parameter is equal to <b>TRUE</b>, the method adds the fax routing method to the list of inbound methods associated with the fax device. If you set this parameter to <b>FALSE</b>, the method removes the routing method from the list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-useroutingmethod
     */
    UseRoutingMethod(bstrMethodGUID, bUse) {
        bstrMethodGUID := bstrMethodGUID is String ? BSTR.Alloc(bstrMethodGUID).Value : bstrMethodGUID

        result := ComCall(30, this, BSTR, bstrMethodGUID, VARIANT_BOOL, bUse, "HRESULT")
        return result
    }

    /**
     * The IFaxDevice::get_RingingNow property is a Boolean value that indicates whether the fax device is ringing at the moment the property is retrieved (the status could change immediately thereafter).
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax device is currently ringing. If this property is equal to <b>FALSE</b>, the fax device is not ringing.
     * 
     * <div class="alert"><b>Note</b>  The value of this property is set at the time that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object is created, and is refreshed when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-refresh-vb">IFaxDevice::Refresh</a> method.</div>
     * <div> </div>
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-get_ringingnow
     */
    get_RingingNow() {
        result := ComCall(31, this, VARIANT_BOOL.Ptr, &pbRingingNow := 0, "HRESULT")
        return pbRingingNow
    }

    /**
     * The IFaxDevice::AnswerCall method causes the fax device to answer an incoming call.
     * @remarks
     * The <b>IFaxDevice::AnswerCall</b> method will only work on a fax device on the local server. The method will work regardless of the value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-receivemode">ReceiveMode</a> property.
     * 
     * You can use this method to manually answer a call. You may use this method if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-receivemode">ReceiveMode</a> property is set to answer manually, automatically, or not at all. The fax device must be idle for the incoming call to succeed.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a> access right.
     * 
     * If the method succeeds, the service has successfully accepted the request and has validated the parameters and the access rights. Method success does not indicate that the service answered the call and started to receive a fax. If the method succeeds but the service fails to answer a call on a device, as in the case when the device does not respond as expected, no notification is sent.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevice-answercall
     */
    AnswerCall() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_DeviceName := CallbackCreate(GetMethod(implObj, "get_DeviceName"), flags, 2)
        this.vtbl.get_ProviderUniqueName := CallbackCreate(GetMethod(implObj, "get_ProviderUniqueName"), flags, 2)
        this.vtbl.get_PoweredOff := CallbackCreate(GetMethod(implObj, "get_PoweredOff"), flags, 2)
        this.vtbl.get_ReceivingNow := CallbackCreate(GetMethod(implObj, "get_ReceivingNow"), flags, 2)
        this.vtbl.get_SendingNow := CallbackCreate(GetMethod(implObj, "get_SendingNow"), flags, 2)
        this.vtbl.get_UsedRoutingMethods := CallbackCreate(GetMethod(implObj, "get_UsedRoutingMethods"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_SendEnabled := CallbackCreate(GetMethod(implObj, "get_SendEnabled"), flags, 2)
        this.vtbl.put_SendEnabled := CallbackCreate(GetMethod(implObj, "put_SendEnabled"), flags, 2)
        this.vtbl.get_ReceiveMode := CallbackCreate(GetMethod(implObj, "get_ReceiveMode"), flags, 2)
        this.vtbl.put_ReceiveMode := CallbackCreate(GetMethod(implObj, "put_ReceiveMode"), flags, 2)
        this.vtbl.get_RingsBeforeAnswer := CallbackCreate(GetMethod(implObj, "get_RingsBeforeAnswer"), flags, 2)
        this.vtbl.put_RingsBeforeAnswer := CallbackCreate(GetMethod(implObj, "put_RingsBeforeAnswer"), flags, 2)
        this.vtbl.get_CSID := CallbackCreate(GetMethod(implObj, "get_CSID"), flags, 2)
        this.vtbl.put_CSID := CallbackCreate(GetMethod(implObj, "put_CSID"), flags, 2)
        this.vtbl.get_TSID := CallbackCreate(GetMethod(implObj, "get_TSID"), flags, 2)
        this.vtbl.put_TSID := CallbackCreate(GetMethod(implObj, "put_TSID"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.GetExtensionProperty := CallbackCreate(GetMethod(implObj, "GetExtensionProperty"), flags, 3)
        this.vtbl.SetExtensionProperty := CallbackCreate(GetMethod(implObj, "SetExtensionProperty"), flags, 3)
        this.vtbl.UseRoutingMethod := CallbackCreate(GetMethod(implObj, "UseRoutingMethod"), flags, 3)
        this.vtbl.get_RingingNow := CallbackCreate(GetMethod(implObj, "get_RingingNow"), flags, 2)
        this.vtbl.AnswerCall := CallbackCreate(GetMethod(implObj, "AnswerCall"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_DeviceName)
        CallbackFree(this.vtbl.get_ProviderUniqueName)
        CallbackFree(this.vtbl.get_PoweredOff)
        CallbackFree(this.vtbl.get_ReceivingNow)
        CallbackFree(this.vtbl.get_SendingNow)
        CallbackFree(this.vtbl.get_UsedRoutingMethods)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_SendEnabled)
        CallbackFree(this.vtbl.put_SendEnabled)
        CallbackFree(this.vtbl.get_ReceiveMode)
        CallbackFree(this.vtbl.put_ReceiveMode)
        CallbackFree(this.vtbl.get_RingsBeforeAnswer)
        CallbackFree(this.vtbl.put_RingsBeforeAnswer)
        CallbackFree(this.vtbl.get_CSID)
        CallbackFree(this.vtbl.put_CSID)
        CallbackFree(this.vtbl.get_TSID)
        CallbackFree(this.vtbl.put_TSID)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.GetExtensionProperty)
        CallbackFree(this.vtbl.SetExtensionProperty)
        CallbackFree(this.vtbl.UseRoutingMethod)
        CallbackFree(this.vtbl.get_RingingNow)
        CallbackFree(this.vtbl.AnswerCall)
    }
}
