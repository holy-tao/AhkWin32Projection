#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SyndicationContent.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationContentFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationContentFactory
     * @type {Guid}
     */
    static IID => Guid("{3d2fbb93-9520-4173-9388-7e2df324a8a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyndicationContent", "CreateSyndicationContentWithSourceUri"]

    /**
     * 
     * @param {HSTRING} text 
     * @param {Integer} type 
     * @returns {SyndicationContent} 
     */
    CreateSyndicationContent(text, type) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(6, this, "ptr", text, "int", type, "ptr*", &content := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationContent(content)
    }

    /**
     * 
     * @param {Uri} sourceUri 
     * @returns {SyndicationContent} 
     */
    CreateSyndicationContentWithSourceUri(sourceUri) {
        result := ComCall(7, this, "ptr", sourceUri, "ptr*", &content := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationContent(content)
    }
}
