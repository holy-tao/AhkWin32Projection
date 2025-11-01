#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IGCThreadControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGCThreadControl
     * @type {Guid}
     */
    static IID => Guid("{f31d1788-c397-4725-87a5-6af3472c2791}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ThreadIsBlockingForSuspension", "SuspensionStarting", "SuspensionEnding"]

    /**
     * 
     * @returns {HRESULT} 
     */
    ThreadIsBlockingForSuspension() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SuspensionStarting() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Generation 
     * @returns {HRESULT} 
     */
    SuspensionEnding(Generation) {
        result := ComCall(5, this, "uint", Generation, "HRESULT")
        return result
    }
}
