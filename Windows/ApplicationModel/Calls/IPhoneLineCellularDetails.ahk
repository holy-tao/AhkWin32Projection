#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneLineCellularDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneLineCellularDetails
     * @type {Guid}
     */
    static IID => Guid("{192601d5-147c-4769-b673-98a5ec8426cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SimState", "get_SimSlotIndex", "get_IsModemOn", "get_RegistrationRejectCode", "GetNetworkOperatorDisplayText"]

    /**
     * @type {Integer} 
     */
    SimState {
        get => this.get_SimState()
    }

    /**
     * @type {Integer} 
     */
    SimSlotIndex {
        get => this.get_SimSlotIndex()
    }

    /**
     * @type {Boolean} 
     */
    IsModemOn {
        get => this.get_IsModemOn()
    }

    /**
     * @type {Integer} 
     */
    RegistrationRejectCode {
        get => this.get_RegistrationRejectCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SimState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SimSlotIndex() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsModemOn() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RegistrationRejectCode() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} location_ 
     * @returns {HSTRING} 
     */
    GetNetworkOperatorDisplayText(location_) {
        value := HSTRING()
        result := ComCall(10, this, "int", location_, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
