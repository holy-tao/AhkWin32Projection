#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SyndicationText.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationTextFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationTextFactory
     * @type {Guid}
     */
    static IID => Guid("{ee7342f7-11c6-4b25-ab62-e596bd162946}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyndicationText", "CreateSyndicationTextEx"]

    /**
     * 
     * @param {HSTRING} text 
     * @returns {SyndicationText} 
     */
    CreateSyndicationText(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(6, this, "ptr", text, "ptr*", &syndicationText_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationText(syndicationText_)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @param {Integer} type 
     * @returns {SyndicationText} 
     */
    CreateSyndicationTextEx(text, type) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(7, this, "ptr", text, "int", type, "ptr*", &syndicationText_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationText(syndicationText_)
    }
}
