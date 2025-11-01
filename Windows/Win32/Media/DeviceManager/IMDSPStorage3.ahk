#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorage2.ahk

/**
 * The IMDSPStorage3 interface extends IMDSPStorage2 by supporting metadata.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspstorage3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorage3 extends IMDSPStorage2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPStorage3
     * @type {Guid}
     */
    static IID => Guid("{6c669867-97ed-4a67-9706-1c5529d2a414}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetadata", "SetMetadata"]

    /**
     * 
     * @param {IWMDMMetaData} pMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage3-getmetadata
     */
    GetMetadata(pMetadata) {
        result := ComCall(17, this, "ptr", pMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMDMMetaData} pMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage3-setmetadata
     */
    SetMetadata(pMetadata) {
        result := ComCall(18, this, "ptr", pMetadata, "HRESULT")
        return result
    }
}
