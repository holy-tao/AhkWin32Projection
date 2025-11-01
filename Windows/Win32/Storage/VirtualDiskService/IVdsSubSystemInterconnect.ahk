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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSupportedInterconnects"]

    /**
     * 
     * @param {Pointer<Integer>} pulSupportedInterconnectsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsysteminterconnect-getsupportedinterconnects
     */
    GetSupportedInterconnects(pulSupportedInterconnectsFlag) {
        pulSupportedInterconnectsFlagMarshal := pulSupportedInterconnectsFlag is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulSupportedInterconnectsFlagMarshal, pulSupportedInterconnectsFlag, "HRESULT")
        return result
    }
}
