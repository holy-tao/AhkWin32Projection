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
     * 
     * @param {Pointer<UInt32>} pcImages 
     * @returns {HRESULT} 
     */
    GetImageCount(pcImages) {
        result := ComCall(3, this, "uint*", pcImages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {Pointer<UInt16>} pcchMIMEType 
     * @param {PWSTR} pwszMIMEType 
     * @param {Pointer<UInt16>} pcchDescription 
     * @param {PWSTR} pwszDescription 
     * @param {Pointer<UInt16>} pImageType 
     * @param {Pointer<UInt32>} pcbImageData 
     * @param {Pointer<Byte>} pbImageData 
     * @returns {HRESULT} 
     */
    GetImage(wIndex, pcchMIMEType, pwszMIMEType, pcchDescription, pwszDescription, pImageType, pcbImageData, pbImageData) {
        pwszMIMEType := pwszMIMEType is String ? StrPtr(pwszMIMEType) : pwszMIMEType
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(4, this, "uint", wIndex, "ushort*", pcchMIMEType, "ptr", pwszMIMEType, "ushort*", pcchDescription, "ptr", pwszDescription, "ushort*", pImageType, "uint*", pcbImageData, "char*", pbImageData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
