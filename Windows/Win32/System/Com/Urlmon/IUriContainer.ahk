#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IUriContainer extends IUnknown{
    /**
     * The interface identifier for IUriContainer
     * @type {Guid}
     */
    static IID => Guid("{a158a630-ed6f-45fb-b987-f68676f57752}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUri>} ppIUri 
     * @returns {HRESULT} 
     */
    GetIUri(ppIUri) {
        result := ComCall(3, this, "ptr", ppIUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
