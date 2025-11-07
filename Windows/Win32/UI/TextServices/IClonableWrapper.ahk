#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IClonableWrapper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClonableWrapper
     * @type {Guid}
     */
    static IID => Guid("{b33e75ff-e84c-4dca-a25c-33b8dc003374}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CloneNewWrapper"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CloneNewWrapper(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
