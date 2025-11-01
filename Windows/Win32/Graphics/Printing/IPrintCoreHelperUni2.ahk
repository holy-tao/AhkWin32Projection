#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintCoreHelperUni.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintCoreHelperUni2 extends IPrintCoreHelperUni{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintCoreHelperUni2
     * @type {Guid}
     */
    static IID => Guid("{6c8afdfc-ead0-4d2d-8071-9bf0175a6c3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNamedCommand"]

    /**
     * 
     * @param {Pointer} pDevmode 
     * @param {Integer} cbSize 
     * @param {PWSTR} pszCommandName 
     * @param {Pointer<Pointer<Integer>>} ppCommandBytes 
     * @param {Pointer<Integer>} pcbCommandSize 
     * @returns {HRESULT} 
     */
    GetNamedCommand(pDevmode, cbSize, pszCommandName, ppCommandBytes, pcbCommandSize) {
        pszCommandName := pszCommandName is String ? StrPtr(pszCommandName) : pszCommandName

        result := ComCall(14, this, "ptr", pDevmode, "uint", cbSize, "ptr", pszCommandName, "ptr*", ppCommandBytes, "uint*", pcbCommandSize, "HRESULT")
        return result
    }
}
