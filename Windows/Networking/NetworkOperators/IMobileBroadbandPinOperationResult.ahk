#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandPinOperationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandPinOperationResult
     * @type {Guid}
     */
    static IID => Guid("{11dddc32-31e7-49f5-b663-123d3bef0362}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSuccessful", "get_AttemptsRemaining"]

    /**
     * @type {Boolean} 
     */
    IsSuccessful {
        get => this.get_IsSuccessful()
    }

    /**
     * @type {Integer} 
     */
    AttemptsRemaining {
        get => this.get_AttemptsRemaining()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuccessful() {
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
    get_AttemptsRemaining() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
