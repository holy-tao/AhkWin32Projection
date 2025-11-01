#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Manages configuration settings for each listener for the dynamic virtual channel (DVC) connection.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtslistener
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSListener extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSListener
     * @type {Guid}
     */
    static IID => Guid("{a1230206-9a39-4d58-8674-cdb4dff4e73b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConfiguration"]

    /**
     * 
     * @param {Pointer<IPropertyBag>} ppPropertyBag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtslistener-getconfiguration
     */
    GetConfiguration(ppPropertyBag) {
        result := ComCall(3, this, "ptr*", ppPropertyBag, "HRESULT")
        return result
    }
}
