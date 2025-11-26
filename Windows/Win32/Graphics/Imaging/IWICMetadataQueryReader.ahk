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
     * Gets the metadata query readers container format.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * Pointer that receives the cointainer format GUID.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicmetadataqueryreader-getcontainerformat
     */
    GetContainerFormat() {
        pguidContainerFormat := Guid()
        result := ComCall(3, this, "ptr", pguidContainerFormat, "HRESULT")
        return pguidContainerFormat
    }

    /**
     * Retrieves the current path relative to the root metadata block.
     * @param {Integer} cchMaxLength Type: <b>UINT</b>
     * 
     * The length of the <i>wzNamespace</i> buffer.
     * @param {PWSTR} wzNamespace Type: <b>WCHAR*</b>
     * 
     * Pointer that receives the current namespace location.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual buffer length that was needed to retrieve the current namespace location.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicmetadataqueryreader-getlocation
     */
    GetLocation(cchMaxLength, wzNamespace) {
        wzNamespace := wzNamespace is String ? StrPtr(wzNamespace) : wzNamespace

        result := ComCall(4, this, "uint", cchMaxLength, "ptr", wzNamespace, "uint*", &pcchActualLength := 0, "HRESULT")
        return pcchActualLength
    }

    /**
     * Retrieves the metadata block or item identified by a metadata query expression.
     * @param {PWSTR} wzName Type: <b>LPCWSTR</b>
     * 
     * The query expression to the requested metadata block or item.
     * @param {Pointer<PROPVARIANT>} pvarValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this method returns, contains the metadata block or item requested.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicmetadataqueryreader-getmetadatabyname
     */
    GetMetadataByName(wzName, pvarValue) {
        wzName := wzName is String ? StrPtr(wzName) : wzName

        result := ComCall(5, this, "ptr", wzName, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of all metadata items at the current relative location within the metadata hierarchy.
     * @returns {IEnumString} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> interface for the enumerator that contains query strings that can be used in the current <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataqueryreader">IWICMetadataQueryReader</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicmetadataqueryreader-getenumerator
     */
    GetEnumerator() {
        result := ComCall(6, this, "ptr*", &ppIEnumString := 0, "HRESULT")
        return IEnumString(ppIEnumString)
    }
}
