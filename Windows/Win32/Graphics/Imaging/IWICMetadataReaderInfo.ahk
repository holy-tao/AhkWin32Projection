#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataHandlerInfo.ahk

/**
 * Exposes methods that provide basic information about the registered metadata reader.
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwicmetadatareaderinfo
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICMetadataReaderInfo extends IWICMetadataHandlerInfo{
    /**
     * The interface identifier for IWICMetadataReaderInfo
     * @type {Guid}
     */
    static IID => Guid("{eebf1f5b-07c1-4447-a3ab-22acaf78a804}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {Integer} cbSize 
     * @param {Pointer} pPattern 
     * @param {Pointer<UInt32>} pcCount 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {HRESULT} 
     */
    GetPatterns(guidContainerFormat, cbSize, pPattern, pcCount, pcbActual) {
        result := ComCall(18, this, "ptr", guidContainerFormat, "uint", cbSize, "ptr", pPattern, "uint*", pcCount, "uint*", pcbActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {Pointer<IStream>} pIStream 
     * @param {Pointer<BOOL>} pfMatches 
     * @returns {HRESULT} 
     */
    MatchesPattern(guidContainerFormat, pIStream, pfMatches) {
        result := ComCall(19, this, "ptr", guidContainerFormat, "ptr", pIStream, "ptr", pfMatches, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICMetadataReader>} ppIReader 
     * @returns {HRESULT} 
     */
    CreateInstance(ppIReader) {
        result := ComCall(20, this, "ptr", ppIReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
