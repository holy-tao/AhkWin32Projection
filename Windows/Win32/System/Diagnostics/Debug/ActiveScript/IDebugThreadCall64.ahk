#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugThreadCall64 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugThreadCall64
     * @type {Guid}
     */
    static IID => Guid("{cb3fa335-e979-42fd-9fcf-a7546a0f3905}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ThreadCallHandler"]

    /**
     * 
     * @param {Integer} dwParam1 
     * @param {Integer} dwParam2 
     * @param {Integer} dwParam3 
     * @returns {HRESULT} 
     */
    ThreadCallHandler(dwParam1, dwParam2, dwParam3) {
        result := ComCall(3, this, "uint", dwParam1, "uint", dwParam2, "uint", dwParam3, "HRESULT")
        return result
    }
}
