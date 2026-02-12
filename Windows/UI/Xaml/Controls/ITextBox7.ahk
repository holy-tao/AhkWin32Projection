#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HandwritingView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITextBox7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBox7
     * @type {Guid}
     */
    static IID => Guid("{da4911f9-ffe1-4c6a-ac6d-1b4a174ccf80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HandwritingView", "put_HandwritingView", "get_IsHandwritingViewEnabled", "put_IsHandwritingViewEnabled"]

    /**
     * @type {HandwritingView} 
     */
    HandwritingView {
        get => this.get_HandwritingView()
        set => this.put_HandwritingView(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHandwritingViewEnabled {
        get => this.get_IsHandwritingViewEnabled()
        set => this.put_IsHandwritingViewEnabled(value)
    }

    /**
     * 
     * @returns {HandwritingView} 
     */
    get_HandwritingView() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HandwritingView(value)
    }

    /**
     * 
     * @param {HandwritingView} value 
     * @returns {HRESULT} 
     */
    put_HandwritingView(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHandwritingViewEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IsHandwritingViewEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
