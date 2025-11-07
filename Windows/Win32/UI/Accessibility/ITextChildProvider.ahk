#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include .\ITextRangeProvider.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a text-based control (or an object embedded in text) that is a child or descendant of another text-based control.
 * @remarks
 * 
 * An element that implements the [TextChild control pattern](/windows/desktop/WinAuto/textchild-control-pattern) must be a child, or descendent, of an element that supports the [Text control pattern](/windows/desktop/WinAuto/uiauto-implementingtextandtextrange).
 * 
 * It is not required that this element also implement the [Text control pattern](/windows/desktop/WinAuto/uiauto-implementingtextandtextrange).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itextchildprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITextChildProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextChildProvider
     * @type {Guid}
     */
    static IID => Guid("{4c2de2b9-c88f-4f88-a111-f1d336b7d1a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextContainer", "get_TextRange"]

    /**
     * 
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextchildprovider-get_textcontainer
     */
    get_TextContainer() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }

    /**
     * 
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextchildprovider-get_textrange
     */
    get_TextRange() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }
}
