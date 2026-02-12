#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ForceFeedback\ForceFeedbackMotor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class IRawGameController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawGameController
     * @type {Guid}
     */
    static IID => Guid("{7cad6d91-a7e1-4f71-9a78-33e9c5dfea62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AxisCount", "get_ButtonCount", "get_ForceFeedbackMotors", "get_HardwareProductId", "get_HardwareVendorId", "get_SwitchCount", "GetButtonLabel", "GetCurrentReading", "GetSwitchKind"]

    /**
     * @type {Integer} 
     */
    AxisCount {
        get => this.get_AxisCount()
    }

    /**
     * @type {Integer} 
     */
    ButtonCount {
        get => this.get_ButtonCount()
    }

    /**
     * @type {IVectorView<ForceFeedbackMotor>} 
     */
    ForceFeedbackMotors {
        get => this.get_ForceFeedbackMotors()
    }

    /**
     * @type {Integer} 
     */
    HardwareProductId {
        get => this.get_HardwareProductId()
    }

    /**
     * @type {Integer} 
     */
    HardwareVendorId {
        get => this.get_HardwareVendorId()
    }

    /**
     * @type {Integer} 
     */
    SwitchCount {
        get => this.get_SwitchCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AxisCount() {
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
    get_ButtonCount() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<ForceFeedbackMotor>} 
     */
    get_ForceFeedbackMotors() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ForceFeedbackMotor, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareProductId() {
        result := ComCall(9, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareVendorId() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SwitchCount() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} buttonIndex 
     * @returns {Integer} 
     */
    GetButtonLabel(buttonIndex) {
        result := ComCall(12, this, "int", buttonIndex, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Pointer<Integer>} buttonArray_length 
     * @param {Pointer<Pointer<Boolean>>} buttonArray 
     * @param {Pointer<Integer>} switchArray_length 
     * @param {Pointer<Pointer<Integer>>} switchArray 
     * @param {Pointer<Integer>} axisArray_length 
     * @param {Pointer<Pointer<Float>>} axisArray 
     * @returns {Integer} 
     */
    GetCurrentReading(buttonArray_length, buttonArray, switchArray_length, switchArray, axisArray_length, axisArray) {
        buttonArray_lengthMarshal := buttonArray_length is VarRef ? "uint*" : "ptr"
        buttonArrayMarshal := buttonArray is VarRef ? "ptr*" : "ptr"
        switchArray_lengthMarshal := switchArray_length is VarRef ? "uint*" : "ptr"
        switchArrayMarshal := switchArray is VarRef ? "ptr*" : "ptr"
        axisArray_lengthMarshal := axisArray_length is VarRef ? "uint*" : "ptr"
        axisArrayMarshal := axisArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, buttonArray_lengthMarshal, buttonArray_length, buttonArrayMarshal, buttonArray, switchArray_lengthMarshal, switchArray_length, switchArrayMarshal, switchArray, axisArray_lengthMarshal, axisArray_length, axisArrayMarshal, axisArray, "uint*", &timestamp_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return timestamp_
    }

    /**
     * 
     * @param {Integer} switchIndex 
     * @returns {Integer} 
     */
    GetSwitchKind(switchIndex) {
        result := ComCall(14, this, "int", switchIndex, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
