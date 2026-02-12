#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkInputConfiguration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkInputConfiguration2
     * @type {Guid}
     */
    static IID => Guid("{6ac2272e-81b4-5cc4-a36d-d057c387dfda}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPenHapticFeedbackEnabled", "put_IsPenHapticFeedbackEnabled"]

    /**
     * @type {Boolean} 
     */
    IsPenHapticFeedbackEnabled {
        get => this.get_IsPenHapticFeedbackEnabled()
        set => this.put_IsPenHapticFeedbackEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPenHapticFeedbackEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPenHapticFeedbackEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
