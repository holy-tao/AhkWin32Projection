#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IShutdownManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShutdownManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{0f69a02f-9c34-43c7-a8c3-70b30a7f7504}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsPowerStateSupported", "EnterPowerState", "EnterPowerStateWithTimeSpan"]

    /**
     * 
     * @param {Integer} powerState_ 
     * @returns {Boolean} 
     */
    IsPowerStateSupported(powerState_) {
        result := ComCall(6, this, "int", powerState_, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} powerState_ 
     * @returns {HRESULT} 
     */
    EnterPowerState(powerState_) {
        result := ComCall(7, this, "int", powerState_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} powerState_ 
     * @param {TimeSpan} wakeUpAfter 
     * @returns {HRESULT} 
     */
    EnterPowerStateWithTimeSpan(powerState_, wakeUpAfter) {
        result := ComCall(8, this, "int", powerState_, "ptr", wakeUpAfter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
