#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Input\Inking\InkPresenter.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbar3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbar3
     * @type {Guid}
     */
    static IID => Guid("{a8a6def0-7aa8-5326-b7c4-88ae25013362}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetInkPresenter", "put_TargetInkPresenter"]

    /**
     * @type {InkPresenter} 
     */
    TargetInkPresenter {
        get => this.get_TargetInkPresenter()
        set => this.put_TargetInkPresenter(value)
    }

    /**
     * 
     * @returns {InkPresenter} 
     */
    get_TargetInkPresenter() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkPresenter(value)
    }

    /**
     * 
     * @param {InkPresenter} value 
     * @returns {HRESULT} 
     */
    put_TargetInkPresenter(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
