#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IScrollViewerStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollViewerStatics4
     * @type {Guid}
     */
    static IID => Guid("{220cf7cc-4f46-59f1-af9b-67fa8eb33d01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReduceViewportForCoreInputViewOcclusionsProperty", "get_HorizontalAnchorRatioProperty", "get_VerticalAnchorRatioProperty", "get_CanContentRenderOutsideBoundsProperty", "GetCanContentRenderOutsideBounds", "SetCanContentRenderOutsideBounds"]

    /**
     * @type {DependencyProperty} 
     */
    ReduceViewportForCoreInputViewOcclusionsProperty {
        get => this.get_ReduceViewportForCoreInputViewOcclusionsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalAnchorRatioProperty {
        get => this.get_HorizontalAnchorRatioProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalAnchorRatioProperty {
        get => this.get_VerticalAnchorRatioProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CanContentRenderOutsideBoundsProperty {
        get => this.get_CanContentRenderOutsideBoundsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ReduceViewportForCoreInputViewOcclusionsProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalAnchorRatioProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VerticalAnchorRatioProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CanContentRenderOutsideBoundsProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetCanContentRenderOutsideBounds(element) {
        result := ComCall(10, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} canContentRenderOutsideBounds 
     * @returns {HRESULT} 
     */
    SetCanContentRenderOutsideBounds(element, canContentRenderOutsideBounds) {
        result := ComCall(11, this, "ptr", element, "int", canContentRenderOutsideBounds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
