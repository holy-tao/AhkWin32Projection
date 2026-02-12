#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ActionEntityFactory.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionInvocationContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionInvocationContext
     * @type {Guid}
     */
    static IID => Guid("{c32b622e-86e1-5eba-9661-605910104978}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EntityFactory", "SetInputEntity", "GetInputEntities", "SetOutputEntity", "GetOutputEntities", "get_Result", "put_Result", "get_ExtendedError", "put_ExtendedError"]

    /**
     * @type {ActionEntityFactory} 
     */
    EntityFactory {
        get => this.get_EntityFactory()
    }

    /**
     * @type {Integer} 
     */
    Result {
        get => this.get_Result()
        set => this.put_Result(value)
    }

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
        set => this.put_ExtendedError(value)
    }

    /**
     * 
     * @returns {ActionEntityFactory} 
     */
    get_EntityFactory() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionEntityFactory(value)
    }

    /**
     * 
     * @param {HSTRING} inputName 
     * @param {ActionEntity} inputValue 
     * @returns {HRESULT} 
     */
    SetInputEntity(inputName, inputValue) {
        if(inputName is String) {
            pin := HSTRING.Create(inputName)
            inputName := pin.Value
        }
        inputName := inputName is Win32Handle ? NumGet(inputName, "ptr") : inputName

        result := ComCall(7, this, "ptr", inputName, "ptr", inputValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetInputEntities(result_) {
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} outputName 
     * @param {ActionEntity} outputValue 
     * @returns {HRESULT} 
     */
    SetOutputEntity(outputName, outputValue) {
        if(outputName is String) {
            pin := HSTRING.Create(outputName)
            outputName := pin.Value
        }
        outputName := outputName is Win32Handle ? NumGet(outputName, "ptr") : outputName

        result := ComCall(9, this, "ptr", outputName, "ptr", outputValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetOutputEntities(result_) {
        result := ComCall(10, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Result() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Result(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HRESULT} value 
     * @returns {HRESULT} 
     */
    put_ExtendedError(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
