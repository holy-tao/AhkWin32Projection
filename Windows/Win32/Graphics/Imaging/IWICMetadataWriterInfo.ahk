#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataWriter.ahk
#Include .\IWICMetadataHandlerInfo.ahk

/**
 * Exposes methods that provide basic information about the registered metadata writer.
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwicmetadatawriterinfo
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICMetadataWriterInfo extends IWICMetadataHandlerInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICMetadataWriterInfo
     * @type {Guid}
     */
    static IID => Guid("{b22e3fba-3925-4323-b5c1-9ebfc430f236}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHeader", "CreateInstance"]

    /**
     * Gets the metadata header for the metadata writer.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The format container GUID to obtain the header for.
     * @param {Integer} cbSize Type: <b>UINT</b>
     * 
     * The size of the <i>pHeader</i> buffer.
     * @param {Pointer} pHeader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ns-wincodecsdk-wicmetadataheader">WICMetadataHeader</a>*</b>
     * 
     * Pointer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ns-wincodecsdk-wicmetadataheader">WICMetadataHeader</a>.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual size of the header.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatawriterinfo-getheader
     */
    GetHeader(guidContainerFormat, cbSize, pHeader) {
        result := ComCall(18, this, "ptr", guidContainerFormat, "uint", cbSize, "ptr", pHeader, "uint*", &pcbActual := 0, "HRESULT")
        return pcbActual
    }

    /**
     * Creates an instance of an IWICMetadataWriter.
     * @returns {IWICMetadataWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>**</b>
     * 
     * Pointer that receives a pointer to a metadata writer.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatawriterinfo-createinstance
     */
    CreateInstance() {
        result := ComCall(19, this, "ptr*", &ppIWriter := 0, "HRESULT")
        return IWICMetadataWriter(ppIWriter)
    }
}
