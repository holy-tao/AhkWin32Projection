#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugInputCallbacks extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugInputCallbacks
     * @type {Guid}
     */
    static IID => Guid("{9f50e42c-f136-499e-9a97-73036c94ed2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartInput", "EndInput"]

    /**
     * 
     * @param {Integer} BufferSize 
     * @returns {HRESULT} 
     */
    StartInput(BufferSize) {
        result := ComCall(3, this, "uint", BufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndInput() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
