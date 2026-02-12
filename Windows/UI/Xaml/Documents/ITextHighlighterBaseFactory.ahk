#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ITextHighlighterBaseFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextHighlighterBaseFactory
     * @type {Guid}
     */
    static IID => Guid("{9592b2d0-eadc-4c74-92c8-6e896e22506d}")

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
