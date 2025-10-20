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
     * 
     * @param {Pointer<Int32>} PinType 
     * @returns {HRESULT} 
     */
    get_PinType(PinType) {
        result := ComCall(3, this, "int*", PinType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} PinFormat 
     * @returns {HRESULT} 
     */
    get_PinFormat(PinFormat) {
        result := ComCall(4, this, "int*", PinFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PinLengthMin 
     * @returns {HRESULT} 
     */
    get_PinLengthMin(PinLengthMin) {
        result := ComCall(5, this, "uint*", PinLengthMin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PinLengthMax 
     * @returns {HRESULT} 
     */
    get_PinLengthMax(PinLengthMax) {
        result := ComCall(6, this, "uint*", PinLengthMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} PinMode 
     * @returns {HRESULT} 
     */
    get_PinMode(PinMode) {
        result := ComCall(7, this, "int*", PinMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pin 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    Enable(pin, requestID) {
        pin := pin is String ? StrPtr(pin) : pin

        result := ComCall(8, this, "ptr", pin, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pin 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    Disable(pin, requestID) {
        pin := pin is String ? StrPtr(pin) : pin

        result := ComCall(9, this, "ptr", pin, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pin 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    Enter(pin, requestID) {
        pin := pin is String ? StrPtr(pin) : pin

        result := ComCall(10, this, "ptr", pin, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pin 
     * @param {PWSTR} newPin 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    Change(pin, newPin, requestID) {
        pin := pin is String ? StrPtr(pin) : pin
        newPin := newPin is String ? StrPtr(newPin) : newPin

        result := ComCall(11, this, "ptr", pin, "ptr", newPin, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} puk 
     * @param {PWSTR} newPin 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    Unblock(puk, newPin, requestID) {
        puk := puk is String ? StrPtr(puk) : puk
        newPin := newPin is String ? StrPtr(newPin) : newPin

        result := ComCall(12, this, "ptr", puk, "ptr", newPin, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMbnPinManager>} pinManager 
     * @returns {HRESULT} 
     */
    GetPinManager(pinManager) {
        result := ComCall(13, this, "ptr", pinManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
