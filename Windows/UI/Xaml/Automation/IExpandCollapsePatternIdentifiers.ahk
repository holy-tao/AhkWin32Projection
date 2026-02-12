#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IExpandCollapsePatternIdentifiers extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExpandCollapsePatternIdentifiers
     * @type {Guid}
     */
    static IID => Guid("{b006bac0-751b-4d55-92cb-613ec1bdf5d0}")

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
