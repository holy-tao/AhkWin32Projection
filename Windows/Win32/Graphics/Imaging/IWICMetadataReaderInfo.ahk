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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPatterns", "MatchesPattern", "CreateInstance"]

    /**
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {Integer} cbSize 
     * @param {Pointer} pPattern 
     * @param {Pointer<Integer>} pcCount 
     * @param {Pointer<Integer>} pcbActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareaderinfo-getpatterns
     */
    GetPatterns(guidContainerFormat, cbSize, pPattern, pcCount, pcbActual) {
        result := ComCall(18, this, "ptr", guidContainerFormat, "uint", cbSize, "ptr", pPattern, "uint*", pcCount, "uint*", pcbActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {IStream} pIStream 
     * @param {Pointer<BOOL>} pfMatches 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareaderinfo-matchespattern
     */
    MatchesPattern(guidContainerFormat, pIStream, pfMatches) {
        result := ComCall(19, this, "ptr", guidContainerFormat, "ptr", pIStream, "ptr", pfMatches, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICMetadataReader>} ppIReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareaderinfo-createinstance
     */
    CreateInstance(ppIReader) {
        result := ComCall(20, this, "ptr*", ppIReader, "HRESULT")
        return result
    }
}
