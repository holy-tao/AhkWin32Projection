#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataReader.ahk
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
     * Gets the metadata patterns associated with the metadata reader.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The cointainer format GUID.
     * @param {Integer} cbSize Type: <b>UINT</b>
     * 
     * The size, in bytes, of the <i>pPattern</i> buffer.
     * @param {Pointer} pPattern Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ns-wincodecsdk-wicmetadatapattern">WICMetadataPattern</a>*</b>
     * 
     * Pointer that receives the metadata patterns.
     * @param {Pointer<Integer>} pcCount Type: <b>UINT*</b>
     * 
     * Pointer that receives the number of metadata patterns.
     * @param {Pointer<Integer>} pcbActual Type: <b>UINT*</b>
     * 
     * Pointer that receives the size, in bytes, needed to obtain the metadata patterns.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatareaderinfo-getpatterns
     */
    GetPatterns(guidContainerFormat, cbSize, pPattern, pcCount, pcbActual) {
        pcCountMarshal := pcCount is VarRef ? "uint*" : "ptr"
        pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr", guidContainerFormat, "uint", cbSize, "ptr", pPattern, pcCountMarshal, pcCount, pcbActualMarshal, pcbActual, "HRESULT")
        return result
    }

    /**
     * Determines if a stream contains a metadata item pattern.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The container format of the metadata item.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream to search for the metadata pattern.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Pointer that receives <c>TRUE</code> if the stream contains the pattern; otherwise, <code>FALSE</c>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatareaderinfo-matchespattern
     */
    MatchesPattern(guidContainerFormat, pIStream) {
        result := ComCall(19, this, "ptr", guidContainerFormat, "ptr", pIStream, "int*", &pfMatches := 0, "HRESULT")
        return pfMatches
    }

    /**
     * Creates an instance of an IWICMetadataReader.
     * @returns {IWICMetadataReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader">IWICMetadataReader</a>**</b>
     * 
     * Pointer that receives a pointer to a metadata reader.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatareaderinfo-createinstance
     */
    CreateInstance() {
        result := ComCall(20, this, "ptr*", &ppIReader := 0, "HRESULT")
        return IWICMetadataReader(ppIReader)
    }
}
