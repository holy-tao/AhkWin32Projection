#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to query the interconnect types that are supported by a subsystem.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdssubsysteminterconnect
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsSubSystemInterconnect extends IUnknown{
    /**
     * The interface identifier for IVdsSubSystemInterconnect
     * @type {Guid}
     */
    static IID => Guid("{9e6fa560-c141-477b-83ba-0b6c38f7febf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pulSupportedInterconnectsFlag 
     * @returns {HRESULT} 
     */
    GetSupportedInterconnects(pulSupportedInterconnectsFlag) {
        result := ComCall(3, this, "uint*", pulSupportedInterconnectsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
