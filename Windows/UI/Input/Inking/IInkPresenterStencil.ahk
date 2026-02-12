#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Color.ahk
#Include ..\..\..\Foundation\Numerics\Matrix3x2.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a visual stencil, displayed as an semi-transparent overlay on an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
  * 
  * 
  * The stencil transforms how an ink stroke is rendered:
  * 
  * + It snaps the ink stroke to the stencil edge if the pen tip is within a distance threshold (gutter).
  * + It acts as a mask and prevents the drawing of an ink stroke within the area obscured by the stencil.
  * 
  * 
  * The stencil can be manipulated both programmatically and by the user. It also scales and translates with the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpresenterstencil
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkPresenterStencil extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPresenterStencil
     * @type {Guid}
     */
    static IID => Guid("{30d12d6d-3e06-4d02-b116-277fb5d8addc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind", "get_IsVisible", "put_IsVisible", "get_BackgroundColor", "put_BackgroundColor", "get_ForegroundColor", "put_ForegroundColor", "get_Transform", "put_Transform"]

    /**
     * Gets the type of [IInkPresenterStencil](iinkpresenterstencil.md) object to display on the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpresenterstencil.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets or sets whether the [IInkPresenterStencil](iinkpresenterstencil.md) object is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpresenterstencil.isvisible
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
        set => this.put_IsVisible(value)
    }

    /**
     * Gets or sets the background color of the [IInkPresenterStencil](iinkpresenterstencil.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpresenterstencil.backgroundcolor
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * Gets or sets the color of the foreground elements on an [IInkPresenterStencil](iinkpresenterstencil.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpresenterstencil.foregroundcolor
     * @type {Color} 
     */
    ForegroundColor {
        get => this.get_ForegroundColor()
        set => this.put_ForegroundColor(value)
    }

    /**
     * Gets or sets the position and rotation angle of the [IInkPresenterStencil](iinkpresenterstencil.md) object within the 2-D coordinate space of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * 
     * Both position and rotation are based on the top left corner of the stencil relative to the origin of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpresenterstencil.transform
     * @type {Matrix3x2} 
     */
    Transform {
        get => this.get_Transform()
        set => this.put_Transform(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_IsVisible(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        value := Color()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_ForegroundColor() {
        value := Color()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_ForegroundColor(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_Transform() {
        value := Matrix3x2()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    put_Transform(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
