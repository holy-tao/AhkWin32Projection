#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITimer.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITimerEx extends ITimer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimerEx
     * @type {Guid}
     */
    static IID => Guid("{30510414-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMode"]

    /**
     * 
     * @param {Integer} dwMode 
     * @returns {HRESULT} 
     */
    SetMode(dwMode) {
        result := ComCall(7, this, "uint", dwMode, "HRESULT")
        return result
    }
}
