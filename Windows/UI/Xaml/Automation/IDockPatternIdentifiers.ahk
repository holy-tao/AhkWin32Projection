#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IDockPatternIdentifiers extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDockPatternIdentifiers
     * @type {Guid}
     */
    static IID => Guid("{ccd7f4e6-e4f9-47ff-bde7-378b11f78e09}")

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
