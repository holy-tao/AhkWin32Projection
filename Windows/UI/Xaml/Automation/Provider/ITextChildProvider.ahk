#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include .\ITextRangeProvider.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to a text-based control that is a child of another text-based control. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.TextChild](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [TextChild Control Pattern](/windows/desktop/WinAuto/textchild-control-pattern).
 * 
 * ITextChildProvider isn't implemented by any existing Windows Runtime automation peers. The interface exists so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same Windows Runtime managed or C++ API as they use to define control logic or other automation support.
 * 
 * The [ITableItemProvider](itableitemprovider.md) pattern doesn't have a pattern property identifier class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextchildprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ITextChildProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextChildProvider
     * @type {Guid}
     */
    static IID => Guid("{1133c336-a89b-4130-9be6-55e33334f557}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextContainer", "get_TextRange"]

    /**
     * Gets this element's nearest ancestor provider that supports the **Text** ([ITextProvider](itextprovider.md)) control pattern.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextchildprovider.textcontainer
     * @type {IRawElementProviderSimple} 
     */
    TextContainer {
        get => this.get_TextContainer()
    }

    /**
     * Gets a text range that encloses this child element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextchildprovider.textrange
     * @type {ITextRangeProvider} 
     */
    TextRange {
        get => this.get_TextRange()
    }

    /**
     * Retrieves this element's nearest ancestor provider that supports the Text control pattern.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextchildprovider-get_textcontainer
     */
    get_TextContainer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawElementProviderSimple(value)
    }

    /**
     * Retrieves a text range that encloses this child element. (ITextChildProvider.get_TextRange)
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextchildprovider-get_textrange
     */
    get_TextRange() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRangeProvider(value)
    }
}
