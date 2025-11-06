#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSpeechCommands.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ISpeechCommandProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechCommandProvider
     * @type {Guid}
     */
    static IID => Guid("{38e09d4c-586d-435a-b592-c8a86691dec6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumSpeechCommands", "ProcessCommand"]

    /**
     * 
     * @param {Integer} langid 
     * @returns {IEnumSpeechCommands} 
     */
    EnumSpeechCommands(langid) {
        result := ComCall(3, this, "ushort", langid, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSpeechCommands(ppEnum)
    }

    /**
     * 
     * @param {PWSTR} pszCommand 
     * @param {Integer} cch 
     * @param {Integer} langid 
     * @returns {HRESULT} 
     */
    ProcessCommand(pszCommand, cch, langid) {
        pszCommand := pszCommand is String ? StrPtr(pszCommand) : pszCommand

        result := ComCall(4, this, "ptr", pszCommand, "uint", cch, "ushort", langid, "HRESULT")
        return result
    }
}
