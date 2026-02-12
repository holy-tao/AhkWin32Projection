#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkToolbarCustomPen.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarCustomPenButton extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarCustomPenButton
     * @type {Guid}
     */
    static IID => Guid("{46024401-2b2a-4f3c-a53c-1a045a408efa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CustomPen", "put_CustomPen", "get_ConfigurationContent", "put_ConfigurationContent"]

    /**
     * @type {InkToolbarCustomPen} 
     */
    CustomPen {
        get => this.get_CustomPen()
        set => this.put_CustomPen(value)
    }

    /**
     * @type {UIElement} 
     */
    ConfigurationContent {
        get => this.get_ConfigurationContent()
        set => this.put_ConfigurationContent(value)
    }

    /**
     * 
     * @returns {InkToolbarCustomPen} 
     */
    get_CustomPen() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkToolbarCustomPen(value)
    }

    /**
     * 
     * @param {InkToolbarCustomPen} value 
     * @returns {HRESULT} 
     */
    put_CustomPen(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_ConfigurationContent() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_ConfigurationContent(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
