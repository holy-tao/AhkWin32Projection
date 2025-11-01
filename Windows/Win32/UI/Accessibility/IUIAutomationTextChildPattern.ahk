#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access a text-based control (or an object embedded in text) that is a child or descendant of another text-based control.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextchildpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextChildPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTextChildPattern
     * @type {Guid}
     */
    static IID => Guid("{6552b038-ae05-40c8-abfd-aa08352aab86}")

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
     * @param {Pointer<IUIAutomationElement>} container 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextchildpattern-get_textcontainer
     */
    get_TextContainer(container) {
        result := ComCall(3, this, "ptr*", container, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextchildpattern-get_textrange
     */
    get_TextRange(range) {
        result := ComCall(4, this, "ptr*", range, "HRESULT")
        return result
    }
}
