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
     * 
     * @param {Pointer<IWMDMMetaData>} ppMetadata 
     * @returns {HRESULT} 
     */
    GetMetadata(ppMetadata) {
        result := ComCall(15, this, "ptr", ppMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMDMMetaData>} pMetadata 
     * @returns {HRESULT} 
     */
    SetMetadata(pMetadata) {
        result := ComCall(16, this, "ptr", pMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMDMMetaData>} ppMetadata 
     * @returns {HRESULT} 
     */
    CreateEmptyMetadataObject(ppMetadata) {
        result := ComCall(17, this, "ptr", ppMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMode 
     * @param {Integer} nViews 
     * @param {Pointer<WMDMMetadataView>} pViews 
     * @returns {HRESULT} 
     */
    SetEnumPreference(pMode, nViews, pViews) {
        result := ComCall(18, this, "int*", pMode, "uint", nViews, "ptr", pViews, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
