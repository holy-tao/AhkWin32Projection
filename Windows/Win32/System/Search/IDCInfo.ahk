#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDCInfo extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo", "SetInfo"]

    /**
     * 
     * @param {Integer} cInfo 
     * @param {Pointer<Integer>} rgeInfoType 
     * @returns {Pointer<DCINFO>} 
     */
    GetInfo(cInfo, rgeInfoType) {
        rgeInfoTypeMarshal := rgeInfoType is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cInfo, rgeInfoTypeMarshal, rgeInfoType, "ptr*", &prgInfo := 0, "HRESULT")
        return prgInfo
    }

    /**
     * 
     * @param {Integer} cInfo 
     * @param {Pointer<DCINFO>} rgInfo 
     * @returns {HRESULT} 
     */
    SetInfo(cInfo, rgInfo) {
        result := ComCall(4, this, "uint", cInfo, "ptr", rgInfo, "HRESULT")
        return result
    }
}
