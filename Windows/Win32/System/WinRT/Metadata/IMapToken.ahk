#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMapToken extends IUnknown{
    /**
     * The interface identifier for IMapToken
     * @type {Guid}
     */
    static IID => Guid("{06a3ea8b-0225-11d1-bf72-00c04fc31e12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} tkImp 
     * @param {Integer} tkEmit 
     * @returns {HRESULT} 
     */
    Map(tkImp, tkEmit) {
        result := ComCall(3, this, "uint", tkImp, "uint", tkEmit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
