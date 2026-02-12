#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SyndicationCategory.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationCategoryFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationCategoryFactory
     * @type {Guid}
     */
    static IID => Guid("{ab42802f-49e0-4525-8ab2-ab45c02528ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyndicationCategory", "CreateSyndicationCategoryEx"]

    /**
     * 
     * @param {HSTRING} term 
     * @returns {SyndicationCategory} 
     */
    CreateSyndicationCategory(term) {
        if(term is String) {
            pin := HSTRING.Create(term)
            term := pin.Value
        }
        term := term is Win32Handle ? NumGet(term, "ptr") : term

        result := ComCall(6, this, "ptr", term, "ptr*", &category := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationCategory(category)
    }

    /**
     * 
     * @param {HSTRING} term 
     * @param {HSTRING} scheme 
     * @param {HSTRING} label 
     * @returns {SyndicationCategory} 
     */
    CreateSyndicationCategoryEx(term, scheme, label) {
        if(term is String) {
            pin := HSTRING.Create(term)
            term := pin.Value
        }
        term := term is Win32Handle ? NumGet(term, "ptr") : term
        if(scheme is String) {
            pin := HSTRING.Create(scheme)
            scheme := pin.Value
        }
        scheme := scheme is Win32Handle ? NumGet(scheme, "ptr") : scheme
        if(label is String) {
            pin := HSTRING.Create(label)
            label := pin.Value
        }
        label := label is Win32Handle ? NumGet(label, "ptr") : label

        result := ComCall(7, this, "ptr", term, "ptr", scheme, "ptr", label, "ptr*", &category := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationCategory(category)
    }
}
