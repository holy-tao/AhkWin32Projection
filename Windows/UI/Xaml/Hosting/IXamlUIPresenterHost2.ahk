#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Extends [IXamlUIPresenterHost](ixamluipresenterhost.md) to add [GetGenericXamlFilePath](ixamluipresenterhost2_getgenericxamlfilepath_723616829.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.ixamluipresenterhost2
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IXamlUIPresenterHost2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlUIPresenterHost2
     * @type {Guid}
     */
    static IID => Guid("{61595672-7ca4-4a21-b56a-88f4812388ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGenericXamlFilePath"]

    /**
     * Loads an alternative generic.xaml file into the presenter host at design time.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.ixamluipresenterhost2.getgenericxamlfilepath
     */
    GetGenericXamlFilePath() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
