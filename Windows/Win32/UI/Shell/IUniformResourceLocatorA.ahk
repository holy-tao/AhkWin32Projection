#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class IUniformResourceLocatorA extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUniformResourceLocatorA
     * @type {Guid}
     */
    static IID => Guid("{fbf23b80-e3f0-101b-8488-00aa003e56f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetURL", "GetURL", "InvokeCommand"]

    /**
     * 
     * @param {PSTR} pcszURL 
     * @param {Integer} dwInFlags 
     * @returns {HRESULT} 
     */
    SetURL(pcszURL, dwInFlags) {
        pcszURL := pcszURL is String ? StrPtr(pcszURL) : pcszURL

        result := ComCall(3, this, "ptr", pcszURL, "uint", dwInFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} ppszURL 
     * @returns {HRESULT} 
     */
    GetURL(ppszURL) {
        result := ComCall(4, this, "ptr", ppszURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<URLINVOKECOMMANDINFOA>} purlici 
     * @returns {HRESULT} 
     */
    InvokeCommand(purlici) {
        result := ComCall(5, this, "ptr", purlici, "HRESULT")
        return result
    }
}
