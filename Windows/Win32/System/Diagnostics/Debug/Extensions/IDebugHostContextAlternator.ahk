#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostContextAlternator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostContextAlternator
     * @type {Guid}
     */
    static IID => Guid("{6301eee8-85e3-4058-a7c0-d37e0ea65f75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SwitchTo", "SwitchBack"]

    /**
     * 
     * @param {Integer} fullSwitch 
     * @returns {HRESULT} 
     */
    SwitchTo(fullSwitch) {
        result := ComCall(3, this, "char", fullSwitch, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SwitchBack() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
