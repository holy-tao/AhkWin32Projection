#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugOutputStream extends IUnknown{
    /**
     * The interface identifier for IDebugOutputStream
     * @type {Guid}
     */
    static IID => Guid("{7782d8f2-2b85-4059-ab88-28ceddca1c80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    Write(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(3, this, "ptr", psz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
