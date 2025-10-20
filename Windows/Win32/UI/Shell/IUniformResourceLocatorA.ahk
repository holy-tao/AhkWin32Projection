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
     * 
     * @param {PSTR} pcszURL 
     * @param {Integer} dwInFlags 
     * @returns {HRESULT} 
     */
    SetURL(pcszURL, dwInFlags) {
        result := ComCall(3, this, "ptr", pcszURL, "uint", dwInFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} ppszURL 
     * @returns {HRESULT} 
     */
    GetURL(ppszURL) {
        result := ComCall(4, this, "ptr", ppszURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<URLINVOKECOMMANDINFOA>} purlici 
     * @returns {HRESULT} 
     */
    InvokeCommand(purlici) {
        result := ComCall(5, this, "ptr", purlici, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
