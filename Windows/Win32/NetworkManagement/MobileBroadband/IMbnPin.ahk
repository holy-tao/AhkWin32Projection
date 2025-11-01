#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the device PIN.
 * @remarks
 * 
  * <b>IMbnPin</b> objects are provided by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpin">GetPin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinlist">GetPinList</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> interface.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnpin
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnPin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnPin
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2007-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PinType", "get_PinFormat", "get_PinLengthMin", "get_PinLengthMax", "get_PinMode", "Enable", "Disable", "Enter", "Change", "Unblock", "GetPinManager"]

    /**
     * 
     * @param {Pointer<Integer>} PinType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-get_pintype
     */
    get_PinType(PinType) {
        PinTypeMarshal := PinType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, PinTypeMarshal, PinType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PinFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-get_pinformat
     */
    get_PinFormat(PinFormat) {
        PinFormatMarshal := PinFormat is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, PinFormatMarshal, PinFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PinLengthMin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-get_pinlengthmin
     */
    get_PinLengthMin(PinLengthMin) {
        PinLengthMinMarshal := PinLengthMin is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, PinLengthMinMarshal, PinLengthMin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PinLengthMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-get_pinlengthmax
     */
    get_PinLengthMax(PinLengthMax) {
        PinLengthMaxMarshal := PinLengthMax is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, PinLengthMaxMarshal, PinLengthMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PinMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-get_pinmode
     */
    get_PinMode(PinMode) {
        PinModeMarshal := PinMode is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, PinModeMarshal, PinMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pin 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-enable
     */
    Enable(pin, requestID) {
        pin := pin is String ? StrPtr(pin) : pin

        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pin, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pin 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-disable
     */
    Disable(pin, requestID) {
        pin := pin is String ? StrPtr(pin) : pin

        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pin, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pin 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-enter
     */
    Enter(pin, requestID) {
        pin := pin is String ? StrPtr(pin) : pin

        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", pin, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pin 
     * @param {PWSTR} newPin 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-change
     */
    Change(pin, newPin, requestID) {
        pin := pin is String ? StrPtr(pin) : pin
        newPin := newPin is String ? StrPtr(newPin) : newPin

        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", pin, "ptr", newPin, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} puk 
     * @param {PWSTR} newPin 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-unblock
     */
    Unblock(puk, newPin, requestID) {
        puk := puk is String ? StrPtr(puk) : puk
        newPin := newPin is String ? StrPtr(newPin) : newPin

        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", puk, "ptr", newPin, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMbnPinManager>} pinManager 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpin-getpinmanager
     */
    GetPinManager(pinManager) {
        result := ComCall(13, this, "ptr*", pinManager, "HRESULT")
        return result
    }
}
