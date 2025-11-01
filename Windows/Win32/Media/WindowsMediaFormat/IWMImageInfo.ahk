#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMImageInfo interface retrieves images stored in ID3v2 &#0034;APIC&#0034; (attached picture) frames in a file.
 * @remarks
 * 
  * If retrieving this interface from the metadata editor, you must wait until after the file has been opened to call <b>QueryInterface</b>. If you try to <b>QueryInterface</b> for <b>IWMImageInfo</b> before receiving the WMT_OPENED message in your <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> method, the call will fail.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmimageinfo
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMImageInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMImageInfo
     * @type {Guid}
     */
    static IID => Guid("{9f0aa3b6-7267-4d89-88f2-ba915aa5c4c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImageCount", "GetImage"]

    /**
     * 
     * @param {Pointer<Integer>} pcImages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmimageinfo-getimagecount
     */
    GetImageCount(pcImages) {
        result := ComCall(3, this, "uint*", pcImages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {Pointer<Integer>} pcchMIMEType 
     * @param {PWSTR} pwszMIMEType 
     * @param {Pointer<Integer>} pcchDescription 
     * @param {PWSTR} pwszDescription 
     * @param {Pointer<Integer>} pImageType 
     * @param {Pointer<Integer>} pcbImageData 
     * @param {Pointer<Integer>} pbImageData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmimageinfo-getimage
     */
    GetImage(wIndex, pcchMIMEType, pwszMIMEType, pcchDescription, pwszDescription, pImageType, pcbImageData, pbImageData) {
        pwszMIMEType := pwszMIMEType is String ? StrPtr(pwszMIMEType) : pwszMIMEType
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(4, this, "uint", wIndex, "ushort*", pcchMIMEType, "ptr", pwszMIMEType, "ushort*", pcchDescription, "ptr", pwszDescription, "ushort*", pImageType, "uint*", pcbImageData, "char*", pbImageData, "HRESULT")
        return result
    }
}
