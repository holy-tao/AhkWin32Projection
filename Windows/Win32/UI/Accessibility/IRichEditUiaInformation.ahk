#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides Microsoft UI Automation accessibility information about a windowless rich edit control.
 * @see https://docs.microsoft.com/windows/win32/api//textserv/nn-textserv-irichedituiainformation
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRichEditUiaInformation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichEditUiaInformation
     * @type {Guid}
     */
    static IID => Guid("{23969a9d-8546-4032-a1bb-73750cbf3333}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBoundaryRectangle", "IsVisible"]

    /**
     * 
     * @param {Pointer<UiaRect>} pUiaRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-irichedituiainformation-getboundaryrectangle
     */
    GetBoundaryRectangle(pUiaRect) {
        result := ComCall(3, this, "ptr", pUiaRect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-irichedituiainformation-isvisible
     */
    IsVisible() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
