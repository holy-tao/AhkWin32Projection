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
     * 
     * @param {Pointer<IPropertyBag>} ppPropertyBag 
     * @returns {HRESULT} 
     */
    GetConfiguration(ppPropertyBag) {
        result := ComCall(3, this, "ptr", ppPropertyBag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
