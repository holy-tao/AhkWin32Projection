#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugOutputStream extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Write"]

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    Write(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(3, this, "ptr", psz, "HRESULT")
        return result
    }
}
