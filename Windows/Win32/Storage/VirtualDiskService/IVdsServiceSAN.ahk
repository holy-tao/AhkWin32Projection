#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for managing disk online and offline SAN policy for the operating system.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsservicesan
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsServiceSAN extends IUnknown{
    /**
     * The interface identifier for IVdsServiceSAN
     * @type {Guid}
     */
    static IID => Guid("{fc5d23e8-a88b-41a5-8de0-2d2f73c5a630}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pSanPolicy 
     * @returns {HRESULT} 
     */
    GetSANPolicy(pSanPolicy) {
        result := ComCall(3, this, "int*", pSanPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SanPolicy 
     * @returns {HRESULT} 
     */
    SetSANPolicy(SanPolicy) {
        result := ComCall(4, this, "int", SanPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
