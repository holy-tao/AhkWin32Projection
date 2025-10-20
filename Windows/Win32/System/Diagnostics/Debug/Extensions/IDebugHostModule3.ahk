#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostModule2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostModule3 extends IDebugHostModule2{
    /**
     * The interface identifier for IDebugHostModule3
     * @type {Guid}
     */
    static IID => Guid("{68576417-9fab-4c69-8977-3a4d87cf08fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * 
     * @param {Pointer<Location>} moduleStart 
     * @param {Pointer<Location>} moduleEnd 
     * @returns {HRESULT} 
     */
    GetRange(moduleStart, moduleEnd) {
        result := ComCall(17, this, "ptr", moduleStart, "ptr", moduleEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
