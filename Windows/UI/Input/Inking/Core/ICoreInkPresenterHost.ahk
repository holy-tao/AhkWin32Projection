#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\InkPresenter.ahk
#Include ..\..\..\Composition\ContainerVisual.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class ICoreInkPresenterHost extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInkPresenterHost
     * @type {Guid}
     */
    static IID => Guid("{396e89e6-7d55-4617-9e58-68c70c9169b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InkPresenter", "get_RootVisual", "put_RootVisual"]

    /**
     * @type {InkPresenter} 
     */
    InkPresenter {
        get => this.get_InkPresenter()
    }

    /**
     * @type {ContainerVisual} 
     */
    RootVisual {
        get => this.get_RootVisual()
        set => this.put_RootVisual(value)
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

    /**
     * 
     * @returns {ContainerVisual} 
     */
    get_RootVisual() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContainerVisual(value)
    }

    /**
     * 
     * @param {ContainerVisual} value 
     * @returns {HRESULT} 
     */
    put_RootVisual(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
