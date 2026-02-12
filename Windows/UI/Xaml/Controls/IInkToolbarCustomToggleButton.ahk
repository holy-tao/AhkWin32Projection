#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarCustomToggleButton extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarCustomToggleButton
     * @type {Guid}
     */
    static IID => Guid("{550c4d84-4f54-4fbe-b12b-e0a50aab0d05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
