#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IGuideDataLoader extends IUnknown{
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
     * 
     * @param {Pointer<IGuideData>} pGuideStore 
     * @returns {HRESULT} 
     */
    Init(pGuideStore) {
        result := ComCall(3, this, "ptr", pGuideStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Terminate() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
