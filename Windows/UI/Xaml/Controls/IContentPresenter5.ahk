#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\BrushTransition.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentPresenter5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPresenter5
     * @type {Guid}
     */
    static IID => Guid("{d248970c-b785-5e7f-9c11-8a6cd3d5929b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackgroundTransition", "put_BackgroundTransition", "get_BackgroundSizing", "put_BackgroundSizing"]

    /**
     * @type {BrushTransition} 
     */
    BackgroundTransition {
        get => this.get_BackgroundTransition()
        set => this.put_BackgroundTransition(value)
    }

    /**
     * @type {Integer} 
     */
    BackgroundSizing {
        get => this.get_BackgroundSizing()
        set => this.put_BackgroundSizing(value)
    }

    /**
     * 
     * @returns {BrushTransition} 
     */
    get_BackgroundTransition() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BrushTransition(value)
    }

    /**
     * 
     * @param {BrushTransition} value 
     * @returns {HRESULT} 
     */
    put_BackgroundTransition(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundSizing() {
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
    put_BackgroundSizing(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
