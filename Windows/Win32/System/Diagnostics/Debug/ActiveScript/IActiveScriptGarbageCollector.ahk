#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptGarbageCollector extends IUnknown{
    /**
     * The interface identifier for IActiveScriptGarbageCollector
     * @type {Guid}
     */
    static IID => Guid("{6aa2c4a0-2b53-11d4-a2a0-00104bd35090}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} scriptgctype 
     * @returns {HRESULT} 
     */
    CollectGarbage(scriptgctype) {
        result := ComCall(3, this, "int", scriptgctype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
