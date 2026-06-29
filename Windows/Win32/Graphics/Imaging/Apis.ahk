#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWICMetadataWriter.ahk" { IWICMetadataWriter }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IWICBitmap.ahk" { IWICBitmap }
#Import ".\WICSectionAccessLevel.ahk" { WICSectionAccessLevel }
#Import ".\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */

;@region Functions
/**
 * Obtains a IWICBitmapSource in the desired pixel format from a given IWICBitmapSource.
 * @remarks
 * If the <i>pISrc</i> bitmap is already in the desired format, then <i>pISrc</i> is copied to the destination bitmap pointer and a reference is added. If it is not in the desired format however, <b>WICConvertBitmapSource</b> will instantiate a <i>dstFormat</i> format converter and initialize it with <i>pISrc</i>.
 * @param {Pointer<Guid>} dstFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">REFWICPixelFormatGUID</a></b>
 * 
 * The pixel format to convert to.
 * @param {IWICBitmapSource} pISrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
 * 
 * The source bitmap.
 * @returns {IWICBitmapSource} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
 * 
 * A pointer to the <b>null</b>-initialized destination bitmap pointer.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wicconvertbitmapsource
 * @since windows5.1.2600
 */
export WICConvertBitmapSource(dstFormat, pISrc) {
    result := DllCall("WindowsCodecs.dll\WICConvertBitmapSource", Guid.Ptr, dstFormat, "ptr", pISrc, "ptr*", &ppIDst := 0, "HRESULT")
    return IWICBitmapSource(ppIDst)
}

/**
 * Returns a IWICBitmapSource that is backed by the pixels of a Windows Graphics Device Interface (GDI) section handle. (WICCreateBitmapFromSection)
 * @remarks
 * The <b>WICCreateBitmapFromSection</b> function calls the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-wiccreatebitmapfromsectionex">WICCreateBitmapFromSectionEx</a> function with the <i>desiredAccessLevel</i> parameter set to <b>WICSectionAccessLevelRead</b>.
 * @param {Integer} width Type: <b>UINT</b>
 * 
 * The width of the bitmap pixels.
 * @param {Integer} height Type: <b>UINT</b>
 * 
 * The height of the bitmap pixels.
 * @param {Pointer<Guid>} pixelFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">REFWICPixelFormatGUID</a></b>
 * 
 * The pixel format of the bitmap.
 * @param {HANDLE} hSection Type: <b>HANDLE</b>
 * 
 * The section handle. This is a file mapping object handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> function.
 * @param {Integer} stride Type: <b>UINT</b>
 * 
 * The byte count of each scanline.
 * @param {Integer} offset Type: <b>UINT</b>
 * 
 * The offset into the section.
 * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
 * 
 * A pointer that receives the bitmap.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wiccreatebitmapfromsection
 * @since windows5.1.2600
 */
export WICCreateBitmapFromSection(width, height, pixelFormat, hSection, stride, offset) {
    result := DllCall("WindowsCodecs.dll\WICCreateBitmapFromSection", "uint", width, "uint", height, Guid.Ptr, pixelFormat, HANDLE, hSection, "uint", stride, "uint", offset, "ptr*", &ppIBitmap := 0, "HRESULT")
    return IWICBitmap(ppIBitmap)
}

/**
 * Returns a IWICBitmapSource that is backed by the pixels of a Windows Graphics Device Interface (GDI) section handle. (WICCreateBitmapFromSectionEx)
 * @param {Integer} width Type: <b>UINT</b>
 * 
 * The width of the bitmap pixels.
 * @param {Integer} height Type: <b>UINT</b>
 * 
 * The height of the bitmap pixels.
 * @param {Pointer<Guid>} pixelFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">REFWICPixelFormatGUID</a></b>
 * 
 * The pixel format of the bitmap.
 * @param {HANDLE} hSection Type: <b>HANDLE</b>
 * 
 * The section handle. This is a file mapping object handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> function.
 * @param {Integer} stride Type: <b>UINT</b>
 * 
 * The byte count of each scanline.
 * @param {Integer} offset Type: <b>UINT</b>
 * 
 * The offset into the section.
 * @param {WICSectionAccessLevel} desiredAccessLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicsectionaccesslevel">WICSectionAccessLevel</a></b>
 * 
 * The desired access level.
 * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
 * 
 * A pointer that receives the bitmap.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wiccreatebitmapfromsectionex
 * @since windows6.1
 */
export WICCreateBitmapFromSectionEx(width, height, pixelFormat, hSection, stride, offset, desiredAccessLevel) {
    result := DllCall("WindowsCodecs.dll\WICCreateBitmapFromSectionEx", "uint", width, "uint", height, Guid.Ptr, pixelFormat, HANDLE, hSection, "uint", stride, "uint", offset, WICSectionAccessLevel, desiredAccessLevel, "ptr*", &ppIBitmap := 0, "HRESULT")
    return IWICBitmap(ppIBitmap)
}

/**
 * Obtains the short name associated with a given GUID.
 * @remarks
 * Windows Imaging Component (WIC) short name mappings can be found within the following registry key:
 *             <pre><b>HKEY_CLASSES_ROOT</b>
 *    <b>CLSID</b>
 *       <b>{FAE3D380-FEA4-4623-8C75-C6B61110B681}</b>
 *          <b>Namespace</b>
 *             <b>...</b></pre>
 * @param {Pointer<Guid>} guid Type: <b>REFGUID</b>
 * 
 * The GUID to retrieve the short name for.
 * @param {Integer} cchName Type: <b>UINT</b>
 * 
 * The size of the <i>wzName</i> buffer.
 * @param {PWSTR} wzName Type: <b>WCHAR*</b>
 * 
 * A pointer that receives the short name associated with the GUID.
 * @returns {Integer} Type: <b>UINT*</b>
 * 
 * The actual size needed to retrieve the entire short name associated with the GUID.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wicmapguidtoshortname
 * @since windows5.1.2600
 */
export WICMapGuidToShortName(guid, cchName, wzName) {
    wzName := wzName is String ? StrPtr(wzName) : wzName

    result := DllCall("WindowsCodecs.dll\WICMapGuidToShortName", Guid.Ptr, guid, "uint", cchName, "ptr", wzName, "uint*", &pcchActual := 0, "HRESULT")
    return pcchActual
}

/**
 * Obtains the GUID associated with the given short name.
 * @remarks
 * You can extend the short name mapping by adding to  the following registry key:
 * 
 * 
 * <pre><b>HKEY_CLASSES_ROOT</b>
 *    <b>CLSID</b>
 *       <b>{FAE3D380-FEA4-4623-8C75-C6B61110B681}</b>
 *          <b>Namespace</b>
 *             <b>...</b></pre>
 * 
 * 
 * For more information, see <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-howtowriteacodec">How to Write a WIC-Enabled Codec</a>.
 * @param {PWSTR} wzName Type: <b>const WCHAR*</b>
 * 
 * A pointer to the short name.
 * @param {Pointer<Guid>} pguid Type: <b>GUID*</b>
 * 
 * A pointer that receives the GUID associated with the given short name.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wicmapshortnametoguid
 * @since windows5.1.2600
 */
export WICMapShortNameToGuid(wzName, pguid) {
    wzName := wzName is String ? StrPtr(wzName) : wzName

    result := DllCall("WindowsCodecs.dll\WICMapShortNameToGuid", "ptr", wzName, Guid.Ptr, pguid, "HRESULT")
    return result
}

/**
 * Obtains the name associated with a given schema.
 * @remarks
 * You can extend the schema name mapping by adding to the following registry key:
 * 
 * 
 * <pre><b>HKEY_CLASSES_ROOT</b>
 *    <b>CLSID</b>
 *       <b>{FAE3D380-FEA4-4623-8C75-C6B61110B681}</b>
 *          <b>Schemas</b>
 *             <b>BB5ACC38-F216-4CEC-A6C5-5F6E739763A9</b>
 *                <b>...</b></pre>
 * 
 * 
 * For more information, see <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-howtowriteacodec">How to Write a WIC-Enabled Codec</a>.
 * @param {Pointer<Guid>} guidMetadataFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/wic/-wic-guids-clsids">REFGUID</a></b>
 * 
 * The metadata format GUID.
 * @param {PWSTR} pwzSchema Type: <b>LPWSTR</b>
 * 
 * The URI string of the schema for which the name is to be retrieved.
 * @param {Integer} cchName Type: <b>UINT</b>
 * 
 * The size of the <i>wzName</i> buffer.
 * @param {PWSTR} wzName Type: <b>WCHAR*</b>
 * 
 * A pointer to a buffer that receives the schema's name.
 * 
 * To obtain the required buffer size, call <b>WICMapSchemaToName</b> with <i>cchName</i> set to 0 and <i>wzName</i> set to <b>NULL</b>.
 * @returns {Integer} Type: <b>UINT</b>
 * 
 * The actual buffer size needed to retrieve the entire schema name.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wicmapschematoname
 * @since windows5.1.2600
 */
export WICMapSchemaToName(guidMetadataFormat, pwzSchema, cchName, wzName) {
    pwzSchema := pwzSchema is String ? StrPtr(pwzSchema) : pwzSchema
    wzName := wzName is String ? StrPtr(wzName) : wzName

    result := DllCall("WindowsCodecs.dll\WICMapSchemaToName", Guid.Ptr, guidMetadataFormat, "ptr", pwzSchema, "uint", cchName, "ptr", wzName, "uint*", &pcchActual := 0, "HRESULT")
    return pcchActual
}

/**
 * Obtains a metadata format GUID for a specified container format and vendor that best matches the content within a given stream.
 * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
 * 
 * The container format GUID.
 * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
 * 
 * The vendor GUID.
 * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
 * 
 * The content stream in which to match a metadata format.
 * @param {Pointer<Guid>} pguidMetadataFormat Type: <b>GUID*</b>
 * 
 * A pointer that receives a metadata format GUID for the given parameters.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-wicmatchmetadatacontent
 * @since windows5.1.2600
 */
export WICMatchMetadataContent(guidContainerFormat, pguidVendor, pIStream, pguidMetadataFormat) {
    result := DllCall("WindowsCodecs.dll\WICMatchMetadataContent", Guid.Ptr, guidContainerFormat, Guid.Ptr, pguidVendor, "ptr", pIStream, Guid.Ptr, pguidMetadataFormat, "HRESULT")
    return result
}

/**
 * Writes metadata into a given stream.
 * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
 * 
 * The container format GUID.
 * @param {IWICMetadataWriter} pIWriter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>*</b>
 * 
 * The metadata writer to write metadata to the stream.
 * @param {Integer} dwPersistOptions Type: <b>DWORD</b>
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a> options to use when writing the metadata.
 * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
 * 
 * A pointer to the stream in which to write the metadata.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-wicserializemetadatacontent
 * @since windows5.1.2600
 */
export WICSerializeMetadataContent(guidContainerFormat, pIWriter, dwPersistOptions, pIStream) {
    result := DllCall("WindowsCodecs.dll\WICSerializeMetadataContent", Guid.Ptr, guidContainerFormat, "ptr", pIWriter, "uint", dwPersistOptions, "ptr", pIStream, "HRESULT")
    return result
}

/**
 * Returns the size of the metadata content contained by the specified IWICMetadataWriter. The returned size accounts for the header and the length of the metadata.
 * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
 * 
 * The container GUID.
 * @param {IWICMetadataWriter} pIWriter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>*</b>
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a> that contains the content.
 * @returns {Integer} Type: <b>ULARGE_INTEGER*</b>
 * 
 * A pointer that receives the size of the metadata content.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-wicgetmetadatacontentsize
 * @since windows5.1.2600
 */
export WICGetMetadataContentSize(guidContainerFormat, pIWriter) {
    result := DllCall("WindowsCodecs.dll\WICGetMetadataContentSize", Guid.Ptr, guidContainerFormat, "ptr", pIWriter, "uint*", &pcbSize := 0, "HRESULT")
    return pcbSize
}

;@endregion Functions
