#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPartFont.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPartFont2 extends IPartFont{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPartFont2
     * @type {Guid}
     */
    static IID => Guid("{511e025f-d6cb-43be-bf65-63fe88515a39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontRestriction"]

    /**
     * 
     * @param {Pointer<Integer>} pRestriction 
     * @returns {HRESULT} 
     */
    GetFontRestriction(pRestriction) {
        pRestrictionMarshal := pRestriction is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pRestrictionMarshal, pRestriction, "HRESULT")
        return result
    }
}
