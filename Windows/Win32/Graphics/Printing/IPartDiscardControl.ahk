#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPartDiscardControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPartDiscardControl
     * @type {Guid}
     */
    static IID => Guid("{cc350c00-095b-42a5-bf0f-c8780edadb3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDiscardProperties"]

    /**
     * 
     * @param {Pointer<BSTR>} uriSentinelPage 
     * @param {Pointer<BSTR>} uriPartToDiscard 
     * @returns {HRESULT} 
     */
    GetDiscardProperties(uriSentinelPage, uriPartToDiscard) {
        result := ComCall(3, this, "ptr", uriSentinelPage, "ptr", uriPartToDiscard, "HRESULT")
        return result
    }
}
