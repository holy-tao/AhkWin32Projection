#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextRangeProvider.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Extends the [ITextProvider](itextprovider.md) interface to enable Microsoft UI Automation providers to expose textual content that is the target of an annotation or selection. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Text2](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * For more info on this pattern, see [Text and TextRange Control Patterns](/windows/desktop/WinAuto/uiauto-implementingtextandtextrange).
 * 
 * [ITextProvider](itextprovider.md), ITextProvider2 and [ITextRangeProvider](itextrangeprovider.md) aren't implemented by any existing Windows Runtime automation peers using this definition of the interface. The text models supported by Windows Runtime text controls such as [TextBox](../windows.ui.xaml.controls/textbox.md) and [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) do implement some of these patterns, but do so at a native level that doesn't appear in the Windows Runtime definitions of the API surface. For more info, see the peer classes for the various Windows Runtime text controls.
 * 
 * The ITextProvider2 pattern doesn't have a Windows Runtime property identifier class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextprovider2
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ITextProvider2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextProvider2
     * @type {Guid}
     */
    static IID => Guid("{df1d48bc-0487-4e7f-9d5e-f09e77e41246}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RangeFromAnnotation", "GetCaretRange"]

    /**
     * Exposes a text range that contains the text that is the target of the annotation associated with the specified annotation element.
     * @param {IRawElementProviderSimple} annotationElement Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider for an element that implements the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iannotationprovider">IAnnotationProvider</a> interface. The annotation element is a sibling of the element that implements the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider2">ITextProvider2</a> interface for the document.
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextprovider2-rangefromannotation
     */
    RangeFromAnnotation(annotationElement) {
        result := ComCall(6, this, "ptr", annotationElement, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRangeProvider(result_)
    }

    /**
     * Provides a zero-length text range at the location of the caret that belongs to the text-based control.
     * @remarks
     * If the <i>isActive</i> parameter is <b>FALSE</b>, the caret that belongs to the text-based control might not be at the same location as the system caret.
     * 
     * This method retrieves a text range that a client can use to find the bounding rectangle of the caret that belongs to the text-based control, or to find the text near the caret.
     * @param {Pointer<Boolean>} isActive Type: <b>BOOL*</b>
     * 
     * <b>TRUE</b> if the text-based control that contains the caret has keyboard focus, otherwise <b>FALSE</b>.
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextprovider2-getcaretrange
     */
    GetCaretRange(isActive) {
        result := ComCall(7, this, "ptr", isActive, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRangeProvider(returnValue)
    }
}
