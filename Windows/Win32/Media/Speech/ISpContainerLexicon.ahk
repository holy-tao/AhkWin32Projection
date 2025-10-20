#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpLexicon.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpContainerLexicon extends ISpLexicon{
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
     * 
     * @param {Pointer<ISpLexicon>} pAddLexicon 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AddLexicon(pAddLexicon, dwFlags) {
        result := ComCall(9, this, "ptr", pAddLexicon, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
