#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAnnotationPatternIdentifiers extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnnotationPatternIdentifiers
     * @type {Guid}
     */
    static IID => Guid("{d475a0c1-48b2-4e40-a6cf-3dc4b638c0de}")

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
