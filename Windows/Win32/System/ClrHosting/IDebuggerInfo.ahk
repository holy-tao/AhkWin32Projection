#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IDebuggerInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebuggerInfo
     * @type {Guid}
     */
    static IID => Guid("{bf24142d-a47d-4d24-a66d-8c2141944e44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDebuggerAttached"]

    /**
     * 
     * @param {Pointer<BOOL>} pbAttached 
     * @returns {HRESULT} 
     */
    IsDebuggerAttached(pbAttached) {
        result := ComCall(3, this, "ptr", pbAttached, "HRESULT")
        return result
    }
}
