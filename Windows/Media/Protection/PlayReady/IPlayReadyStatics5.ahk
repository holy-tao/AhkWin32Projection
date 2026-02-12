#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyStatics5
     * @type {Guid}
     */
    static IID => Guid("{230a7075-dfa0-4f8e-a779-cefea9c6824b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HardwareDRMDisabledAtTime", "get_HardwareDRMDisabledUntilTime", "ResetHardwareDRMDisabled"]

    /**
     * @type {IReference<DateTime>} 
     */
    HardwareDRMDisabledAtTime {
        get => this.get_HardwareDRMDisabledAtTime()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    HardwareDRMDisabledUntilTime {
        get => this.get_HardwareDRMDisabledUntilTime()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_HardwareDRMDisabledAtTime() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_HardwareDRMDisabledUntilTime() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetHardwareDRMDisabled() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
