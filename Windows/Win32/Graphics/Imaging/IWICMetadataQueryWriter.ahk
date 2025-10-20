#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataQueryReader.ahk

/**
 * Exposes methods for setting or removing metadata blocks and items to an encoder or its image frames using a metadata query expression.
 * @remarks
 * 
  * A metadata query writer uses metadata query expressions to set or remove metadata. For more information on the metadata query language, see the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-metadataquerylanguage">Metadata Query Language Overview</a>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicmetadataquerywriter
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICMetadataQueryWriter extends IWICMetadataQueryReader{
    /**
     * The interface identifier for IWICMetadataQueryWriter
     * @type {Guid}
     */
    static IID => Guid("{a721791a-0def-4d06-bd91-2118bf1db10b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {PWSTR} wzName 
     * @param {Pointer<PROPVARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    SetMetadataByName(wzName, pvarValue) {
        wzName := wzName is String ? StrPtr(wzName) : wzName

        result := ComCall(7, this, "ptr", wzName, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wzName 
     * @returns {HRESULT} 
     */
    RemoveMetadataByName(wzName) {
        wzName := wzName is String ? StrPtr(wzName) : wzName

        result := ComCall(8, this, "ptr", wzName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
