#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Input\Inking\InkPresenterRuler.ahk
#Include ..\..\Input\Inking\InkPresenterProtractor.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarStencilButton extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarStencilButton
     * @type {Guid}
     */
    static IID => Guid("{306a2616-5b40-4bf3-92b7-f1df936aeff5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Ruler", "get_Protractor", "get_SelectedStencil", "put_SelectedStencil", "get_IsRulerItemVisible", "put_IsRulerItemVisible", "get_IsProtractorItemVisible", "put_IsProtractorItemVisible"]

    /**
     * @type {InkPresenterRuler} 
     */
    Ruler {
        get => this.get_Ruler()
    }

    /**
     * @type {InkPresenterProtractor} 
     */
    Protractor {
        get => this.get_Protractor()
    }

    /**
     * @type {Integer} 
     */
    SelectedStencil {
        get => this.get_SelectedStencil()
        set => this.put_SelectedStencil(value)
    }

    /**
     * @type {Boolean} 
     */
    IsRulerItemVisible {
        get => this.get_IsRulerItemVisible()
        set => this.put_IsRulerItemVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsProtractorItemVisible {
        get => this.get_IsProtractorItemVisible()
        set => this.put_IsProtractorItemVisible(value)
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

    /**
     * 
     * @returns {InkPresenterProtractor} 
     */
    get_Protractor() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkPresenterProtractor(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedStencil() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedStencil(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRulerItemVisible() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_IsRulerItemVisible(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtractorItemVisible() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_IsProtractorItemVisible(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
