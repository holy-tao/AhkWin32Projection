#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMRebuild extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMRebuild
     * @type {Guid}
     */
    static IID => Guid("{02ef04dd-7580-11d1-bece-00c04fb6e937}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RebuildNow"]

    /**
     * 
     * @returns {HRESULT} 
     */
    RebuildNow() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
