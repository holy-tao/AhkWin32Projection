#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ICaretPositionProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICaretPositionProvider
     * @type {Guid}
     */
    static IID => Guid("{58da43a2-108e-4d5b-9f75-e5f74f93fff5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCaretPosition"]

    /**
     * 
     * @param {Pointer<POINT>} pptCaret 
     * @param {Pointer<Float>} pflHeight 
     * @returns {HRESULT} 
     */
    GetCaretPosition(pptCaret, pflHeight) {
        pflHeightMarshal := pflHeight is VarRef ? "float*" : "ptr"

        result := ComCall(3, this, "ptr", pptCaret, pflHeightMarshal, pflHeight, "HRESULT")
        return result
    }
}
