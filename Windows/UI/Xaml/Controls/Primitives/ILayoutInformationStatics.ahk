#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\UIElement.ahk
#Include ..\..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ILayoutInformationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILayoutInformationStatics
     * @type {Guid}
     */
    static IID => Guid("{cf06cf99-58e9-4682-8326-50caab65ed7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLayoutExceptionElement", "GetLayoutSlot"]

    /**
     * 
     * @param {IInspectable} dispatcher 
     * @returns {UIElement} 
     */
    GetLayoutExceptionElement(dispatcher) {
        result := ComCall(6, this, "ptr", dispatcher, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(result_)
    }

    /**
     * 
     * @param {FrameworkElement} element 
     * @returns {RECT} 
     */
    GetLayoutSlot(element) {
        result_ := RECT()
        result := ComCall(7, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
