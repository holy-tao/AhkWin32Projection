#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AcousticEchoCancellationConfiguration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IAudioEffect2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEffect2
     * @type {Guid}
     */
    static IID => Guid("{06703cb0-757e-5757-8af0-6ba58a8b2990}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AcousticEchoCancellationConfiguration", "get_CanSetState", "get_State", "SetState"]

    /**
     * @type {AcousticEchoCancellationConfiguration} 
     */
    AcousticEchoCancellationConfiguration {
        get => this.get_AcousticEchoCancellationConfiguration()
    }

    /**
     * @type {Boolean} 
     */
    CanSetState {
        get => this.get_CanSetState()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {AcousticEchoCancellationConfiguration} 
     */
    get_AcousticEchoCancellationConfiguration() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AcousticEchoCancellationConfiguration(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSetState() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} newState 
     * @returns {HRESULT} 
     */
    SetState(newState) {
        result := ComCall(9, this, "int", newState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
