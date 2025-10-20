#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICImagingFactory.ahk

/**
 * Exposes methods that create components used by component developers. This includes metadata readers, writers and other services for use by codec and metadata handler developers.
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwiccomponentfactory
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICComponentFactory extends IWICImagingFactory{
    /**
     * The interface identifier for IWICComponentFactory
     * @type {Guid}
     */
    static IID => Guid("{412d0c3a-9650-44fa-af5b-dd2a06c8e8fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * 
     * @param {Pointer<Guid>} guidMetadataFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} dwOptions 
     * @param {Pointer<IStream>} pIStream 
     * @param {Pointer<IWICMetadataReader>} ppIReader 
     * @returns {HRESULT} 
     */
    CreateMetadataReader(guidMetadataFormat, pguidVendor, dwOptions, pIStream, ppIReader) {
        result := ComCall(28, this, "ptr", guidMetadataFormat, "ptr", pguidVendor, "uint", dwOptions, "ptr", pIStream, "ptr", ppIReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} dwOptions 
     * @param {Pointer<IStream>} pIStream 
     * @param {Pointer<IWICMetadataReader>} ppIReader 
     * @returns {HRESULT} 
     */
    CreateMetadataReaderFromContainer(guidContainerFormat, pguidVendor, dwOptions, pIStream, ppIReader) {
        result := ComCall(29, this, "ptr", guidContainerFormat, "ptr", pguidVendor, "uint", dwOptions, "ptr", pIStream, "ptr", ppIReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidMetadataFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} dwMetadataOptions 
     * @param {Pointer<IWICMetadataWriter>} ppIWriter 
     * @returns {HRESULT} 
     */
    CreateMetadataWriter(guidMetadataFormat, pguidVendor, dwMetadataOptions, ppIWriter) {
        result := ComCall(30, this, "ptr", guidMetadataFormat, "ptr", pguidVendor, "uint", dwMetadataOptions, "ptr", ppIWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICMetadataReader>} pIReader 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Pointer<IWICMetadataWriter>} ppIWriter 
     * @returns {HRESULT} 
     */
    CreateMetadataWriterFromReader(pIReader, pguidVendor, ppIWriter) {
        result := ComCall(31, this, "ptr", pIReader, "ptr", pguidVendor, "ptr", ppIWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICMetadataBlockReader>} pIBlockReader 
     * @param {Pointer<IWICMetadataQueryReader>} ppIQueryReader 
     * @returns {HRESULT} 
     */
    CreateQueryReaderFromBlockReader(pIBlockReader, ppIQueryReader) {
        result := ComCall(32, this, "ptr", pIBlockReader, "ptr", ppIQueryReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICMetadataBlockWriter>} pIBlockWriter 
     * @param {Pointer<IWICMetadataQueryWriter>} ppIQueryWriter 
     * @returns {HRESULT} 
     */
    CreateQueryWriterFromBlockWriter(pIBlockWriter, ppIQueryWriter) {
        result := ComCall(33, this, "ptr", pIBlockWriter, "ptr", ppIQueryWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPBAG2>} ppropOptions 
     * @param {Integer} cCount 
     * @param {Pointer<IPropertyBag2>} ppIPropertyBag 
     * @returns {HRESULT} 
     */
    CreateEncoderPropertyBag(ppropOptions, cCount, ppIPropertyBag) {
        result := ComCall(34, this, "ptr", ppropOptions, "uint", cCount, "ptr", ppIPropertyBag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
