#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncMergeTombstoneChange extends IUnknown{
    /**
     * The interface identifier for ISyncMergeTombstoneChange
     * @type {Guid}
     */
    static IID => Guid("{6ec62597-0903-484c-ad61-36d6e938f47b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbWinnerItemId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetWinnerItemId(pbWinnerItemId, pcbIdSize) {
        result := ComCall(3, this, "char*", pbWinnerItemId, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
