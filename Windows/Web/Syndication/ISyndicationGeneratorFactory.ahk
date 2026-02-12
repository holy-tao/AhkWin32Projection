#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SyndicationGenerator.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationGeneratorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationGeneratorFactory
     * @type {Guid}
     */
    static IID => Guid("{a34083e3-1e26-4dbc-ba9d-1ab84beff97b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyndicationGenerator"]

    /**
     * 
     * @param {HSTRING} text 
     * @returns {SyndicationGenerator} 
     */
    CreateSyndicationGenerator(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(6, this, "ptr", text, "ptr*", &generator := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationGenerator(generator)
    }
}
