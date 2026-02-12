#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkPresenterRuler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the implementation for a type that generates [InkPresenterRuler](inkpresenterruler.md) objects used in the construction of an [InkPresenter](inkpresenter.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpresenterrulerfactory
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkPresenterRulerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPresenterRulerFactory
     * @type {Guid}
     */
    static IID => Guid("{34361beb-9001-4a4b-a690-69dbaf63e501}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Generates an [InkPresenterRuler](inkpresenterruler.md) object that includes information used in the construction of an [InkPresenter](inkpresenter.md).
     * @param {InkPresenter} inkPresenter_ Provides properties, methods, and events for managing the input, processing, and rendering of ink input (standard and modified) for an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * @returns {InkPresenterRuler} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpresenterrulerfactory.create
     */
    Create(inkPresenter_) {
        result := ComCall(6, this, "ptr", inkPresenter_, "ptr*", &inkPresenterRuler_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkPresenterRuler(inkPresenterRuler_)
    }
}
