#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcSyntaxNegotiate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRpcSyntaxNegotiate
     * @type {Guid}
     */
    static IID => Guid("{58a08519-24c8-4935-b482-3fd823333a4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NegotiateSyntax"]

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {HRESULT} 
     */
    NegotiateSyntax(pMsg) {
        result := ComCall(3, this, "ptr", pMsg, "HRESULT")
        return result
    }
}
