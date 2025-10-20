#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpSRAlternates.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpSRAlternates2 extends ISpSRAlternates{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpSRAlternates2
     * @type {Guid}
     */
    static IID => Guid("{f338f437-cb33-4020-9cab-c71ff9ce12d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CommitText"]

    /**
     * 
     * @param {Pointer<SPPHRASEALTREQUEST>} pAltRequest 
     * @param {PWSTR} pcszNewText 
     * @param {Integer} commitFlags 
     * @returns {HRESULT} 
     */
    CommitText(pAltRequest, pcszNewText, commitFlags) {
        pcszNewText := pcszNewText is String ? StrPtr(pcszNewText) : pcszNewText

        result := ComCall(5, this, "ptr", pAltRequest, "ptr", pcszNewText, "int", commitFlags, "HRESULT")
        return result
    }
}
