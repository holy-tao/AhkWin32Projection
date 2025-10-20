#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreAnchorEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoreAnchorEx
     * @type {Guid}
     */
    static IID => Guid("{a2de3bc1-3d8e-11d3-81a9-f753fbe61a00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ScrollToRect"]

    /**
     * 
     * @param {IAnchor} pStart 
     * @param {IAnchor} pEnd 
     * @param {RECT} rc 
     * @param {Integer} dwPosition 
     * @returns {HRESULT} 
     */
    ScrollToRect(pStart, pEnd, rc, dwPosition) {
        result := ComCall(3, this, "ptr", pStart, "ptr", pEnd, "ptr", rc, "uint", dwPosition, "HRESULT")
        return result
    }
}
