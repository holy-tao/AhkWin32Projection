#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugOutputCallbacks extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugOutputCallbacks
     * @type {Guid}
     */
    static IID => Guid("{4bf58045-d654-4c40-b0af-683090f356dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Output"]

    /**
     * 
     * @param {Integer} Mask 
     * @param {PSTR} Text 
     * @returns {HRESULT} 
     */
    Output(Mask, Text) {
        result := ComCall(3, this, "uint", Mask, "ptr", Text, "HRESULT")
        return result
    }
}
