#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpLexicon.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpContainerLexicon extends ISpLexicon{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpContainerLexicon
     * @type {Guid}
     */
    static IID => Guid("{8565572f-c094-41cc-b56e-10bd9c3ff044}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddLexicon"]

    /**
     * 
     * @param {ISpLexicon} pAddLexicon 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AddLexicon(pAddLexicon, dwFlags) {
        result := ComCall(9, this, "ptr", pAddLexicon, "uint", dwFlags, "HRESULT")
        return result
    }
}
