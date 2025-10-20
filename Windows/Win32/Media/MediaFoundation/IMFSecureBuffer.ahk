#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSecureBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSecureBuffer
     * @type {Guid}
     */
    static IID => Guid("{c1209904-e584-4752-a2d6-7f21693f8b21}")

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
     * @param {Pointer<Guid>} pGuidIdentifier 
     * @returns {HRESULT} 
     */
    GetIdentifier(pGuidIdentifier) {
        result := ComCall(3, this, "ptr", pGuidIdentifier, "HRESULT")
        return result
    }
}
