#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataHandlerInfo.ahk

/**
 * Exposes methods that provide basic information about the registered metadata writer.
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwicmetadatawriterinfo
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICMetadataWriterInfo extends IWICMetadataHandlerInfo{
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
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {Integer} cbSize 
     * @param {Pointer} pHeader 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {HRESULT} 
     */
    GetHeader(guidContainerFormat, cbSize, pHeader, pcbActual) {
        result := ComCall(18, this, "ptr", guidContainerFormat, "uint", cbSize, "ptr", pHeader, "uint*", pcbActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICMetadataWriter>} ppIWriter 
     * @returns {HRESULT} 
     */
    CreateInstance(ppIWriter) {
        result := ComCall(19, this, "ptr", ppIWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
