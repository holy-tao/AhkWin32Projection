#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Extends [IXamlUIPresenterHost](ixamluipresenterhost.md) to add [ResolveDictionaryResource](ixamluipresenterhost3_resolvedictionaryresource_451490648.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.ixamluipresenterhost3
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IXamlUIPresenterHost3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlUIPresenterHost3
     * @type {Guid}
     */
    static IID => Guid("{b14292bf-7320-41bb-9f26-4d6fd34db45a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResolveDictionaryResource"]

    /**
     * Resolves a resource that is specified by a dictionary and key.
     * @param {ResourceDictionary} dictionary The dictionary that contains the resource.
     * @param {IInspectable} dictionaryKey The resource key.
     * @param {IInspectable} suggestedValue The suggested value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.ixamluipresenterhost3.resolvedictionaryresource
     */
    ResolveDictionaryResource(dictionary, dictionaryKey, suggestedValue) {
        result := ComCall(6, this, "ptr", dictionary, "ptr", dictionaryKey, "ptr", suggestedValue, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }
}
