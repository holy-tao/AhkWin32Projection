#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncFilter extends IUnknown{
    /**
     * The interface identifier for ISyncFilter
     * @type {Guid}
     */
    static IID => Guid("{087a3f15-0fcb-44c1-9639-53c14e2b5506}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISyncFilter>} pSyncFilter 
     * @returns {HRESULT} 
     */
    IsIdentical(pSyncFilter) {
        result := ComCall(3, this, "ptr", pSyncFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbSyncFilter 
     * @param {Pointer<UInt32>} pcbSyncFilter 
     * @returns {HRESULT} 
     */
    Serialize(pbSyncFilter, pcbSyncFilter) {
        result := ComCall(4, this, "char*", pbSyncFilter, "uint*", pcbSyncFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
