#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ITxProxyHolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITxProxyHolder
     * @type {Guid}
     */
    static IID => Guid("{13d86f31-0139-41af-bcad-c7d50435fe9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIdentifier"]

    /**
     * 
     * @param {Pointer<Guid>} pGuidLtx 
     * @returns {String} Nothing - always returns an empty string
     */
    GetIdentifier(pGuidLtx) {
        ComCall(3, this, "ptr", pGuidLtx)
    }
}
