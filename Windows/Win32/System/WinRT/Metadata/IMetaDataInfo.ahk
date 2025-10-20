#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataInfo
     * @type {Guid}
     */
    static IID => Guid("{7998ea64-7f95-48b8-86fc-17caf48bf5cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileMapping"]

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ppvData 
     * @param {Pointer<Integer>} pcbData 
     * @param {Pointer<Integer>} pdwMappingType 
     * @returns {HRESULT} 
     */
    GetFileMapping(ppvData, pcbData, pdwMappingType) {
        result := ComCall(3, this, "ptr*", ppvData, "uint*", pcbData, "uint*", pdwMappingType, "HRESULT")
        return result
    }
}
