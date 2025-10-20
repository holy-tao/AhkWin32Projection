#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IObjectHandle extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectHandle
     * @type {Guid}
     */
    static IID => Guid("{c460e2b4-e199-412a-8456-84dc3e4838c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Unwrap"]

    /**
     * 
     * @param {Pointer<VARIANT>} ppv 
     * @returns {HRESULT} 
     */
    Unwrap(ppv) {
        result := ComCall(3, this, "ptr", ppv, "HRESULT")
        return result
    }
}
