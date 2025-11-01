#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IGuideDataLoader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuideDataLoader
     * @type {Guid}
     */
    static IID => Guid("{4764ff7c-fa95-4525-af4d-d32236db9e38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "Terminate"]

    /**
     * 
     * @param {IGuideData} pGuideStore 
     * @returns {HRESULT} 
     */
    Init(pGuideStore) {
        result := ComCall(3, this, "ptr", pGuideStore, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Terminate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
