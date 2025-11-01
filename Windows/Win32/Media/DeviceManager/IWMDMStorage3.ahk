#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMStorage2.ahk

/**
 * The IWMDMStorage3 interface extends IWMDMStorage2 by exposing metadata.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstorage3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorage3 extends IWMDMStorage2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorage3
     * @type {Guid}
     */
    static IID => Guid("{97717eea-926a-464e-96a4-247b0216026e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetadata", "SetMetadata", "CreateEmptyMetadataObject", "SetEnumPreference"]

    /**
     * 
     * @param {Pointer<IWMDMMetaData>} ppMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage3-getmetadata
     */
    GetMetadata(ppMetadata) {
        result := ComCall(15, this, "ptr*", ppMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMDMMetaData} pMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage3-setmetadata
     */
    SetMetadata(pMetadata) {
        result := ComCall(16, this, "ptr", pMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMDMMetaData>} ppMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage3-createemptymetadataobject
     */
    CreateEmptyMetadataObject(ppMetadata) {
        result := ComCall(17, this, "ptr*", ppMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMode 
     * @param {Integer} nViews 
     * @param {Pointer<WMDMMetadataView>} pViews 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage3-setenumpreference
     */
    SetEnumPreference(pMode, nViews, pViews) {
        pModeMarshal := pMode is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pModeMarshal, pMode, "uint", nViews, "ptr", pViews, "HRESULT")
        return result
    }
}
