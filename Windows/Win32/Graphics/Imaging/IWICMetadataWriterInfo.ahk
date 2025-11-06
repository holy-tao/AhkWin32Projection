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
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {Integer} cbSize 
     * @param {Pointer} pHeader 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriterinfo-getheader
     */
    GetHeader(guidContainerFormat, cbSize, pHeader) {
        result := ComCall(18, this, "ptr", guidContainerFormat, "uint", cbSize, "ptr", pHeader, "uint*", &pcbActual := 0, "HRESULT")
        return pcbActual
    }

    /**
     * 
     * @returns {IWICMetadataWriter} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriterinfo-createinstance
     */
    CreateInstance() {
        result := ComCall(19, this, "ptr*", &ppIWriter := 0, "HRESULT")
        return IWICMetadataWriter(ppIWriter)
    }
}
