#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextRangeProvider.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support Microsoft UI Automation client access to controls that contain text. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Text](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * For more info on this pattern, see [Text and TextRange Control Patterns](/windows/desktop/WinAuto/uiauto-implementingtextandtextrange).
 * 
 * ITextProvider, [ITextProvider2](itextprovider2.md) and [ITextRangeProvider](itextrangeprovider.md) aren't implemented by any existing Windows Runtime automation peers using this definition of the interface. The text models supported by Windows Runtime text controls such as [TextBox](../windows.ui.xaml.controls/textbox.md) and [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) do implement some of these patterns, but do so at a native level that doesn't appear in the Windows Runtime definitions of the API surface. For more info, see the peer classes for the various Windows Runtime text controls.
 * 
 * The Microsoft UI Automation interfaces within the Windows Runtime API exist so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same Windows Runtime managed or C++ API as they use to define control logic or other automation support.
 * 
 * The ITextProvider pattern doesn't have a Windows Runtime property identifier class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ITextProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextProvider
     * @type {Guid}
     */
    static IID => Guid("{db5bbc9f-4807-4f2a-8678-1b13f3c60e22}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DocumentRange", "get_SupportedTextSelection", "GetSelection", "GetVisibleRanges", "RangeFromChild", "RangeFromPoint"]

    /**
     * Gets a text range that encloses the main text of a document.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextprovider.documentrange
     * @type {ITextRangeProvider} 
     */
    DocumentRange {
        get => this.get_DocumentRange()
    }

    /**
     * Gets a value that specifies whether a text provider supports selection, and if it does, the type of selection that is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextprovider.supportedtextselection
     * @type {Integer} 
     */
    SupportedTextSelection {
        get => this.get_SupportedTextSelection()
    }

    /**
     * Retrieves a text range that encloses the main text of a document. (ITextProvider.get_DocumentRange)
     * @remarks
     * Some auxiliary text such as headers, footnotes, or annotations may not be included.
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextprovider-get_documentrange
     */
    get_DocumentRange() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRangeProvider(value)
    }

    /**
     * Retrieves a value that specifies the type of text selection that is supported by the control. (ITextProvider.get_SupportedTextSelection)
     * @remarks
     * > ### Parameters
     * >
     * > `pRetVal` [out]
     * >
     * > Type: **[SupportedTextSelection](../uiautomationcore/ne-uiautomationcore-supportedtextselection.md)\***
     * >
     * > When this function returns, contains a pointer to the [SupportedTextSelection](../uiautomationcore/ne-uiautomationcore-supportedtextselection.md) object.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextprovider-get_supportedtextselection
     */
    get_SupportedTextSelection() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves a collection of text ranges that represents the currently selected text in a text-based control. (ITextProvider.GetSelection)
     * @remarks
     * For UI Automation providers that support text selection, 
     *         the provider should implement this method and also return a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-itextprovider-get_supportedtextselection">ITextProvider::SupportedTextSelection</a> value.
     *         
     * 
     * If the control contains only a single span of selected text, the <i>pRetVal</i> array should contain a single text range. 
     * 
     * If the control contains a text insertion point but no text is selected,  the <i>pRetVal</i> array should contain a degenerate (empty) text range at the position of the text insertion point.
     * 
     *  If the control contains no selected text, or if the control does not contain a text insertion point, set <i>pRetVal</i> to <b>NULL</b>.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextprovider-getselection
     */
    GetSelection(result_) {
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves an array of disjoint text ranges from a text-based control where each text range represents a contiguous span of visible text. (ITextProvider.GetVisibleRanges)
     * @remarks
     * If the visible text consists of one contiguous span of text, the <i>pRetVal</i> array should contain a single text range that represents all of the visible text. 
     * 
     * If the visible text consists of multiple, disjoint spans of text, the <i>pRetVal</i> array should contain one text range for each visible span, beginning with the first visible span, and ending with the last visible span. Disjoint spans of visible text can occur when the content of a text-based control is partially obscured 
     *             by an overlapping window or other object, or when a text-based  control with multiple pages or columns 
     *             has content that is partially scrolled out of view.
     *             
     * 
     * <b>ITextProvider::GetVisibleRanges</b> should return  a degenerate (empty) text range if no text is visible, if all text is scrolled out of view, or if the text-based control contains no text.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextprovider-getvisibleranges
     */
    GetVisibleRanges(result_) {
        result := ComCall(9, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a text range enclosing a child element such as an image, hyperlink, or other embedded object.
     * @remarks
     * Each element retrieved with [ITextRangeProvider::GetChildren](nf-uiautomationcore-itextrangeprovider-getchildren.md) also has a valid text range that can be retrieved through [RangeFromChild](nf-uiautomationcore-itextprovider-rangefromchild.md). This includes any elements in the UI Automation tree between the [ITextProvider](nn-uiautomationcore-itextprovider.md) and the child element.
     * @param {IRawElementProviderSimple} childElement Type: **[IRawElementProviderSimple](nn-uiautomationcore-irawelementprovidersimple.md)\***
     * 
     * The UI Automation provider of the specified child element.
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextprovider-rangefromchild
     */
    RangeFromChild(childElement) {
        result := ComCall(10, this, "ptr", childElement, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRangeProvider(result_)
    }

    /**
     * Returns the degenerate (empty) text range nearest to the specified screen coordinates.
     * @remarks
     * A text range that encloses a child object is returned if the screen coordinates are 
     *             within the coordinates of an image, hyperlink, or other embedded object. 
     *             
     * 
     * Because hidden text is not ignored by <b>ITextProvider::RangeFromPoint</b>, a degenerate range from the visible text 
     * 			closest to the given point is returned.
     * 
     * The property never returns <b>NULL</b>.
     * @param {POINT} screenLocation 
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextprovider-rangefrompoint
     */
    RangeFromPoint(screenLocation) {
        result := ComCall(11, this, "ptr", screenLocation, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRangeProvider(result_)
    }
}
