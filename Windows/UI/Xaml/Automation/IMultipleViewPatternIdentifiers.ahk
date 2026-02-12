#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IMultipleViewPatternIdentifiers extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultipleViewPatternIdentifiers
     * @type {Guid}
     */
    static IID => Guid("{5d5cd3b8-1e12-488b-b0ea-5e6cb89816e1}")

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
