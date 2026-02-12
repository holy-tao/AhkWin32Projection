#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InteractionSourceConfiguration.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IVisualInteractionSource3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualInteractionSource3
     * @type {Guid}
     */
    static IID => Guid("{d941ef2a-0d5c-4057-92d7-c9711533204f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointerWheelConfig"]

    /**
     * @type {InteractionSourceConfiguration} 
     */
    PointerWheelConfig {
        get => this.get_PointerWheelConfig()
    }

    /**
     * 
     * @returns {InteractionSourceConfiguration} 
     */
    get_PointerWheelConfig() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InteractionSourceConfiguration(value)
    }
}
