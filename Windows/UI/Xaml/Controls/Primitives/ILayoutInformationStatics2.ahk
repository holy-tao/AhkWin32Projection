#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ILayoutInformationStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILayoutInformationStatics2
     * @type {Guid}
     */
    static IID => Guid("{760315b5-6d4e-4939-ac61-639863cea36b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableSize"]

    /**
     * 
     * @param {UIElement} element 
     * @returns {SIZE} 
     */
    GetAvailableSize(element) {
        result_ := SIZE()
        result := ComCall(6, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
