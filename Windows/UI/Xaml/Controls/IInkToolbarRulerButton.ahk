#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Input\Inking\InkPresenterRuler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarRulerButton extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarRulerButton
     * @type {Guid}
     */
    static IID => Guid("{4a992832-1984-4148-9f25-382b35db087f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Ruler"]

    /**
     * @type {InkPresenterRuler} 
     */
    Ruler {
        get => this.get_Ruler()
    }

    /**
     * 
     * @returns {InkPresenterRuler} 
     */
    get_Ruler() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkPresenterRuler(value)
    }
}
