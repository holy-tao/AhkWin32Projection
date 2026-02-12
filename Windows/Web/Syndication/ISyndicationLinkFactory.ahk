#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SyndicationLink.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationLinkFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationLinkFactory
     * @type {Guid}
     */
    static IID => Guid("{5ed863d4-5535-48ac-98d4-c190995080b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyndicationLink", "CreateSyndicationLinkEx"]

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {SyndicationLink} 
     */
    CreateSyndicationLink(uri_) {
        result := ComCall(6, this, "ptr", uri_, "ptr*", &link := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationLink(link)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {HSTRING} relationship 
     * @param {HSTRING} title 
     * @param {HSTRING} mediaType_ 
     * @param {Integer} length 
     * @returns {SyndicationLink} 
     */
    CreateSyndicationLinkEx(uri_, relationship, title, mediaType_, length) {
        if(relationship is String) {
            pin := HSTRING.Create(relationship)
            relationship := pin.Value
        }
        relationship := relationship is Win32Handle ? NumGet(relationship, "ptr") : relationship
        if(title is String) {
            pin := HSTRING.Create(title)
            title := pin.Value
        }
        title := title is Win32Handle ? NumGet(title, "ptr") : title
        if(mediaType_ is String) {
            pin := HSTRING.Create(mediaType_)
            mediaType_ := pin.Value
        }
        mediaType_ := mediaType_ is Win32Handle ? NumGet(mediaType_, "ptr") : mediaType_

        result := ComCall(7, this, "ptr", uri_, "ptr", relationship, "ptr", title, "ptr", mediaType_, "uint", length, "ptr*", &link := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationLink(link)
    }
}
