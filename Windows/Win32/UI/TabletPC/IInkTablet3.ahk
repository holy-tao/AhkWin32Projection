#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinktablet3
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkTablet3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkTablet3
     * @type {Guid}
     */
    static IID => Guid("{7e313997-1327-41dd-8ca9-79f24be17250}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsMultiTouch", "get_MaximumCursors"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablet3-get_ismultitouch
     */
    get_IsMultiTouch() {
        result := ComCall(7, this, "short*", &pIsMultiTouch := 0, "HRESULT")
        return pIsMultiTouch
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablet3-get_maximumcursors
     */
    get_MaximumCursors() {
        result := ComCall(8, this, "uint*", &pMaximumCursors := 0, "HRESULT")
        return pMaximumCursors
    }
}
