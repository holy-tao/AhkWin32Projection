#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to controls or elements that can be moved, resized, or rotated within a two-dimensional space. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Transform](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [Transform Control Pattern](/windows/desktop/WinAuto/uiauto-implementingtransform).
 * 
 * ITransformProvider isn't implemented by any existing Windows Runtime automation peers. The interface exists so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same Windows Runtime managed or C++ API as they use to define control logic or other automation support.
 * 
 * Use the [TransformPatternIdentifiers](../windows.ui.xaml.automation/transformpatternidentifiers.md) class if you want to reference the ITransformProvider pattern properties from control code when you call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ITransformProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransformProvider
     * @type {Guid}
     */
    static IID => Guid("{79670fdd-f6a9-4a65-af17-861db799a2da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanMove", "get_CanResize", "get_CanRotate", "Move", "Resize", "Rotate"]

    /**
     * Gets a value that indicates whether the element can be moved.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider.canmove
     * @type {Boolean} 
     */
    CanMove {
        get => this.get_CanMove()
    }

    /**
     * Gets a value that indicates whether the element can be resized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider.canresize
     * @type {Boolean} 
     */
    CanResize {
        get => this.get_CanResize()
    }

    /**
     * Gets a value that indicates whether the element can be rotated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider.canrotate
     * @type {Boolean} 
     */
    CanRotate {
        get => this.get_CanRotate()
    }

    /**
     * Indicates whether the control can be moved.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itransformprovider-get_canmove
     */
    get_CanMove() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Indicates whether the control can be resized.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itransformprovider-get_canresize
     */
    get_CanResize() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Indicates whether the control can be rotated.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itransformprovider-get_canrotate
     */
    get_CanRotate() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Moves the control.
     * @param {Float} x The absolute screen coordinates of the left side of the control.
     * @param {Float} y The absolute screen coordinates of the top of the control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider.move
     */
    Move(x, y) {
        result := ComCall(9, this, "double", x, "double", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resizes the control.
     * @param {Float} width The new width of the window, in pixels.
     * @param {Float} height The new height of the window, in pixels.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider.resize
     */
    Resize(width, height) {
        result := ComCall(10, this, "double", width, "double", height, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Rotates the control.
     * @param {Float} degrees The number of degrees to rotate the control. A positive number rotates the control clockwise. A negative number rotates the control counterclockwise.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider.rotate
     */
    Rotate(degrees) {
        result := ComCall(11, this, "double", degrees, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
