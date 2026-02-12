#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextRangeProvider.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Extends the ITextProvider interface to support access by a Microsoft UI Automation client to controls that support programmatic text-edit actions. Implement ITextEditProvider in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and PatternInterface.TextEdit.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itexteditprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ITextEditProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextEditProvider
     * @type {Guid}
     */
    static IID => Guid("{ea3605b4-3a05-400e-b5f9-4e91b40f6176}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActiveComposition", "GetConversionTarget"]

    /**
     * Returns the active composition. (ITextEditProvider.GetActiveComposition)
     * @remarks
     * Follow the guidance given in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/textedit-control-pattern">TextEdit Control Pattern</a> that describes how to implement this method and how to raise the related notification events.
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itexteditprovider-getactivecomposition
     */
    GetActiveComposition() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRangeProvider(result_)
    }

    /**
     * Returns the current conversion target range. (ITextEditProvider.GetConversionTarget)
     * @remarks
     * Follow the guidance given in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/textedit-control-pattern">TextEdit Control Pattern</a> that describes how to implement this method and how to raise the related notification events.
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itexteditprovider-getconversiontarget
     */
    GetConversionTarget() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRangeProvider(result_)
    }
}
