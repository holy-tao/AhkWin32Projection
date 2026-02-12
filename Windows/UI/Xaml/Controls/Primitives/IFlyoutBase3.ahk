#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyObject.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IFlyoutBase3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlyoutBase3
     * @type {Guid}
     */
    static IID => Guid("{a89c9712-48e0-4240-95b9-0dfd0826a8d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OverlayInputPassThroughElement", "put_OverlayInputPassThroughElement"]

    /**
     * @type {DependencyObject} 
     */
    OverlayInputPassThroughElement {
        get => this.get_OverlayInputPassThroughElement()
        set => this.put_OverlayInputPassThroughElement(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_OverlayInputPassThroughElement() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_OverlayInputPassThroughElement(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
