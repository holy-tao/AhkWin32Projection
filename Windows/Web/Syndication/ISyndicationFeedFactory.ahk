#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SyndicationFeed.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationFeedFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationFeedFactory
     * @type {Guid}
     */
    static IID => Guid("{23472232-8be9-48b7-8934-6205131d9357}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyndicationFeed"]

    /**
     * 
     * @param {HSTRING} title 
     * @param {HSTRING} subtitle 
     * @param {Uri} uri_ 
     * @returns {SyndicationFeed} 
     */
    CreateSyndicationFeed(title, subtitle, uri_) {
        if(title is String) {
            pin := HSTRING.Create(title)
            title := pin.Value
        }
        title := title is Win32Handle ? NumGet(title, "ptr") : title
        if(subtitle is String) {
            pin := HSTRING.Create(subtitle)
            subtitle := pin.Value
        }
        subtitle := subtitle is Win32Handle ? NumGet(subtitle, "ptr") : subtitle

        result := ComCall(6, this, "ptr", title, "ptr", subtitle, "ptr", uri_, "ptr*", &feed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationFeed(feed)
    }
}
