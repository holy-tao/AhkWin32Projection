#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumItemIds extends IUnknown{
    /**
     * The interface identifier for IEnumItemIds
     * @type {Guid}
     */
    static IID => Guid("{43aa3f61-4b2e-4b60-83df-b110d3e148f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<UInt32>} pcbItemIdSize 
     * @returns {HRESULT} 
     */
    Next(pbItemId, pcbItemIdSize) {
        result := ComCall(3, this, "char*", pbItemId, "uint*", pcbItemIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
