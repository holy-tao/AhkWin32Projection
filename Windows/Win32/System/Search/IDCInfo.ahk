#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDCInfo extends IUnknown{
    /**
     * The interface identifier for IDCInfo
     * @type {Guid}
     */
    static IID => Guid("{0c733a9c-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cInfo 
     * @param {Pointer<UInt32>} rgeInfoType 
     * @param {Pointer<DCINFO>} prgInfo 
     * @returns {HRESULT} 
     */
    GetInfo(cInfo, rgeInfoType, prgInfo) {
        result := ComCall(3, this, "uint", cInfo, "uint*", rgeInfoType, "ptr", prgInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cInfo 
     * @param {Pointer<DCINFO>} rgInfo 
     * @returns {HRESULT} 
     */
    SetInfo(cInfo, rgInfo) {
        result := ComCall(4, this, "uint", cInfo, "ptr", rgInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
