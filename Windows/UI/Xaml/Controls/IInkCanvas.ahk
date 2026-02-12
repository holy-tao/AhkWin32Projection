#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Input\Inking\InkPresenter.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkCanvas extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkCanvas
     * @type {Guid}
     */
    static IID => Guid("{29443c28-8e48-4fc8-a473-35b0ba12acea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InkPresenter"]

    /**
     * @type {InkPresenter} 
     */
    InkPresenter {
        get => this.get_InkPresenter()
    }

    /**
     * 
     * @returns {InkPresenter} 
     */
    get_InkPresenter() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkPresenter(value)
    }
}
