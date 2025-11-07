#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumString.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for retrieving metadata blocks and items from a decoder or its image frames using a metadata query expression.
 * @remarks
 * 
 * A metadata query reader uses metadata query expressions to access embedded metadata. For more information on the metadata query language, see the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-metadataquerylanguage">Metadata Query Language Overview</a>.
 * 
 * The benefit of the query reader is the ability to access a metadata item in a single step.
 * 
 * 
 * The query reader also provides the way to traverse the whole set of metadata hierarchy with the help of the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicmetadataqueryreader-getenumerator">GetEnumerator</a> method.
 * However, it is not recommended to use this method since <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockreader">IWICMetadataBlockReader</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader">IWICMetadataReader</a> provide a more convenient and cheaper way.
 * 
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicmetadataqueryreader
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICMetadataQueryReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICMetadataQueryReader
     * @type {Guid}
     */
    static IID => Guid("{30989668-e1c9-4597-b395-458eedb808df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContainerFormat", "GetLocation", "GetMetadataByName", "GetEnumerator"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicmetadataqueryreader-getcontainerformat
     */
    GetContainerFormat() {
        pguidContainerFormat := Guid()
        result := ComCall(3, this, "ptr", pguidContainerFormat, "HRESULT")
        return pguidContainerFormat
    }

    /**
     * 
     * @param {Integer} cchMaxLength 
     * @param {PWSTR} wzNamespace 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicmetadataqueryreader-getlocation
     */
    GetLocation(cchMaxLength, wzNamespace) {
        wzNamespace := wzNamespace is String ? StrPtr(wzNamespace) : wzNamespace

        result := ComCall(4, this, "uint", cchMaxLength, "ptr", wzNamespace, "uint*", &pcchActualLength := 0, "HRESULT")
        return pcchActualLength
    }

    /**
     * 
     * @param {PWSTR} wzName 
     * @param {Pointer<PROPVARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicmetadataqueryreader-getmetadatabyname
     */
    GetMetadataByName(wzName, pvarValue) {
        wzName := wzName is String ? StrPtr(wzName) : wzName

        result := ComCall(5, this, "ptr", wzName, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicmetadataqueryreader-getenumerator
     */
    GetEnumerator() {
        result := ComCall(6, this, "ptr*", &ppIEnumString := 0, "HRESULT")
        return IEnumString(ppIEnumString)
    }
}
