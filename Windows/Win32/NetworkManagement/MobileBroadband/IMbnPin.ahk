#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMbnPinManager.ahk" { IMbnPinManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MBN_PIN_FORMAT.ahk" { MBN_PIN_FORMAT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MBN_PIN_TYPE.ahk" { MBN_PIN_TYPE }
#Import ".\MBN_PIN_MODE.ahk" { MBN_PIN_MODE }

/**
 * Represents the device PIN.
 * @remarks
 * <b>IMbnPin</b> objects are provided by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpin">GetPin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinlist">GetPinList</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnpin
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnPin extends IUnknown {
    /**
     * The interface identifier for IMbnPin
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2007-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnPin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_PinType      : IntPtr
        get_PinFormat    : IntPtr
        get_PinLengthMin : IntPtr
        get_PinLengthMax : IntPtr
        get_PinMode      : IntPtr
        Enable           : IntPtr
        Disable          : IntPtr
        Enter            : IntPtr
        Change           : IntPtr
        Unblock          : IntPtr
        GetPinManager    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnPin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {MBN_PIN_TYPE} 
     */
    PinType {
        get => this.get_PinType()
    }

    /**
     * @type {MBN_PIN_FORMAT} 
     */
    PinFormat {
        get => this.get_PinFormat()
    }

    /**
     * @type {Integer} 
     */
    PinLengthMin {
        get => this.get_PinLengthMin()
    }

    /**
     * @type {Integer} 
     */
    PinLengthMax {
        get => this.get_PinLengthMax()
    }

    /**
     * @type {MBN_PIN_MODE} 
     */
    PinMode {
        get => this.get_PinMode()
    }

    /**
     * The PIN type.
     * @returns {MBN_PIN_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-get_pintype
     */
    get_PinType() {
        result := ComCall(3, this, "int*", &PinType := 0, "HRESULT")
        return PinType
    }

    /**
     * The PIN format.
     * @returns {MBN_PIN_FORMAT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-get_pinformat
     */
    get_PinFormat() {
        result := ComCall(4, this, "int*", &PinFormat := 0, "HRESULT")
        return PinFormat
    }

    /**
     * The minimum length of the PIN.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-get_pinlengthmin
     */
    get_PinLengthMin() {
        result := ComCall(5, this, "uint*", &PinLengthMin := 0, "HRESULT")
        return PinLengthMin
    }

    /**
     * The maximum length of the PIN.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-get_pinlengthmax
     */
    get_PinLengthMax() {
        result := ComCall(6, this, "uint*", &PinLengthMax := 0, "HRESULT")
        return PinLengthMax
    }

    /**
     * The PIN mode.
     * @returns {MBN_PIN_MODE} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-get_pinmode
     */
    get_PinMode() {
        result := ComCall(7, this, "int*", &PinMode := 0, "HRESULT")
        return PinMode
    }

    /**
     * Enables a PIN.
     * @remarks
     * The <b>Enable</b> method enables the PIN type for the Mobile Broadband device. The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-get_pintype">PinType</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> represents the type of PIN to be activated. <i>pin</i> contains the current value of the PIN for the PIN type.
     * 
     * This is an asynchronous operation. If the method returns with success, then upon completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinevents-onenablecomplete">OnEnableComplete</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinevents">IMbnPinEvents</a>.
     * @param {PWSTR} pin The PIN value for the PIN type to be enabled.
     * @returns {Integer} A request ID set by the Mobile Broadband service to identify this asynchronous request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-enable
     */
    Enable(pin) {
        pin := pin is String ? StrPtr(pin) : pin

        result := ComCall(8, this, "ptr", pin, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Disables a PIN.
     * @remarks
     * The <b>Disable</b> method disables the PIN type for a Mobile Broadband device. The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-get_pintype">PinType</a> property of this <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> represents the type of PIN to be deactivated for the device. <i>pin</i> contains the current value of PIN for the PIN type.
     * 
     * This is an asynchronous operation. If the method returns with success, then upon completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinevents-ondisablecomplete">OnDisableComplete</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinevents">IMbnPinEvents</a>.
     * @param {PWSTR} pin The PIN value for the PIN type to be disabled.
     * @returns {Integer} A request ID set by the Mobile Broadband service to identify this asynchronous request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-disable
     */
    Disable(pin) {
        pin := pin is String ? StrPtr(pin) : pin

        result := ComCall(9, this, "ptr", pin, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Enters a PIN.
     * @remarks
     * The <b>Enter</b> method enters the PIN for the PIN type. The  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-get_pintype">PinType</a> property of this <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> represents the type of PIN that is to be entered. <i>pin</i> contains the PIN to be entered for the PIN type.
     * 
     * This is an asynchronous operation. If the method returns with success, then upon completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinevents-onentercomplete">OnEnterComplete</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinevents">IMbnPinEvents</a>.
     * @param {PWSTR} pin The PIN value for the PIN type.
     * @returns {Integer} A request ID set by the Mobile Broadband service to identify this asynchronous request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-enter
     */
    Enter(pin) {
        pin := pin is String ? StrPtr(pin) : pin

        result := ComCall(10, this, "ptr", pin, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Changes the PIN.
     * @remarks
     * The <b>Change</b> method changes the PIN for the PIN type. The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-get_pintype">PinType</a> property of this <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> represents the type of PIN to be changed.
     * 
     * This is an asynchronous operation. If the method returns with success, then upon completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinevents-onchangecomplete">OnChangeComplete</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinevents">IMbnPinEvents</a>
     * 
     * 
     * .
     * @param {PWSTR} pin The current PIN for this PIN type.
     * @param {PWSTR} newPin The new PIN for this PIN type.
     * @returns {Integer} A request ID set by the Mobile Broadband service to identify this asynchronous request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-change
     */
    Change(pin, newPin) {
        pin := pin is String ? StrPtr(pin) : pin
        newPin := newPin is String ? StrPtr(newPin) : newPin

        result := ComCall(11, this, "ptr", pin, "ptr", newPin, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Unblocks a blocked PIN.
     * @remarks
     * The <b>Unblock</b> method unblocks the PIN for the pin type by entering the PUK and sets a new PIN. The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-get_pintype">PinType</a> property of this <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> represents the type of PIN which is being changed.
     * 
     * This is an asynchronous operation. If the method returns with success, then upon completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinevents-onunblockcomplete">OnUnblockComplete</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinevents">IMbnPinEvents</a>.
     * 
     * Whenever the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinstate">GetPinState</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> results with the current PIN state set to <b>MBN_PIN_STATE_UNBLOCK</b>, then the application should use <b>Unblock</b> on the PIN type which is returned in <b>PinInfo.pinType</b> passed by the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanagerevents-ongetpinstatecomplete">OnGetPinStateComplete</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanagerevents">IMbnPinManagerEvents</a>. 
     * 
     * 
     * Invoking this method requires administrator privileges.
     * @param {PWSTR} puk The password unblock key (PUK) value for this PIN type.
     * @param {PWSTR} newPin A new PIN to be set for this PIN type.
     * @returns {Integer} A request ID set by the Mobile Broadband service to identify this asynchronous request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-unblock
     */
    Unblock(puk, newPin) {
        puk := puk is String ? StrPtr(puk) : puk
        newPin := newPin is String ? StrPtr(newPin) : newPin

        result := ComCall(12, this, "ptr", puk, "ptr", newPin, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Gets the IMbnPinManager.
     * @remarks
     * This method can be used to retrieve an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> interface for the given PIN type.  The <b>GetPinManager</b> method retrieves an <b>IMbnPinManager</b> interface from the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> object passed in <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinevents">IMbnPinEvents</a> methods.
     * @returns {IMbnPinManager} Pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> to manage the PIN type.  When this function returns anything other than S_OK, this value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-getpinmanager
     */
    GetPinManager() {
        result := ComCall(13, this, "ptr*", &pinManager := 0, "HRESULT")
        return IMbnPinManager(pinManager)
    }

    Query(iid) {
        if (IMbnPin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PinType := CallbackCreate(GetMethod(implObj, "get_PinType"), flags, 2)
        this.vtbl.get_PinFormat := CallbackCreate(GetMethod(implObj, "get_PinFormat"), flags, 2)
        this.vtbl.get_PinLengthMin := CallbackCreate(GetMethod(implObj, "get_PinLengthMin"), flags, 2)
        this.vtbl.get_PinLengthMax := CallbackCreate(GetMethod(implObj, "get_PinLengthMax"), flags, 2)
        this.vtbl.get_PinMode := CallbackCreate(GetMethod(implObj, "get_PinMode"), flags, 2)
        this.vtbl.Enable := CallbackCreate(GetMethod(implObj, "Enable"), flags, 3)
        this.vtbl.Disable := CallbackCreate(GetMethod(implObj, "Disable"), flags, 3)
        this.vtbl.Enter := CallbackCreate(GetMethod(implObj, "Enter"), flags, 3)
        this.vtbl.Change := CallbackCreate(GetMethod(implObj, "Change"), flags, 4)
        this.vtbl.Unblock := CallbackCreate(GetMethod(implObj, "Unblock"), flags, 4)
        this.vtbl.GetPinManager := CallbackCreate(GetMethod(implObj, "GetPinManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PinType)
        CallbackFree(this.vtbl.get_PinFormat)
        CallbackFree(this.vtbl.get_PinLengthMin)
        CallbackFree(this.vtbl.get_PinLengthMax)
        CallbackFree(this.vtbl.get_PinMode)
        CallbackFree(this.vtbl.Enable)
        CallbackFree(this.vtbl.Disable)
        CallbackFree(this.vtbl.Enter)
        CallbackFree(this.vtbl.Change)
        CallbackFree(this.vtbl.Unblock)
        CallbackFree(this.vtbl.GetPinManager)
    }
}
