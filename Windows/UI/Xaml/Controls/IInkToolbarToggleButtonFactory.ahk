#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarToggleButtonFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarToggleButtonFactory
     * @type {Guid}
     */
    static IID => Guid("{b2f90710-e5a1-4365-9d1a-e5b7ad8b9668}")

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
