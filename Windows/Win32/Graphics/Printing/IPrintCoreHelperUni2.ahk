#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\IPrintCoreHelperUni.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class IPrintCoreHelperUni2 extends IPrintCoreHelperUni {

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
     * @param {Integer} pDevmode 
     * @param {Integer} cbSize 
     * @param {PWSTR} pszCommandName 
     * @param {Pointer<Pointer<Integer>>} ppCommandBytes 
     * @param {Pointer<Integer>} pcbCommandSize 
     * @returns {HRESULT} 
     */
    GetNamedCommand(pDevmode, cbSize, pszCommandName, ppCommandBytes, pcbCommandSize) {
        pszCommandName := pszCommandName is String ? StrPtr(pszCommandName) : pszCommandName

        ppCommandBytesMarshal := ppCommandBytes is VarRef ? "ptr*" : "ptr"
        pcbCommandSizeMarshal := pcbCommandSize is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", pDevmode, "uint", cbSize, "ptr", pszCommandName, ppCommandBytesMarshal, ppCommandBytes, pcbCommandSizeMarshal, pcbCommandSize, "HRESULT")
        return result
    }
}
