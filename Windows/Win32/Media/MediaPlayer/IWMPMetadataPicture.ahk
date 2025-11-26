#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPMetadataPicture interface provides methods for retrieving information about the WM/Picture metadata attribute.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpmetadatapicture
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPMetadataPicture extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPMetadataPicture
     * @type {Guid}
     */
    static IID => Guid("{5c29bbe0-f87d-4c45-aa28-a70f0230ffa9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_mimeType", "get_pictureType", "get_description", "get_URL"]

    /**
     */
    mimeType {
        get => this.get_mimeType()
    }

    /**
     */
    pictureType {
        get => this.get_pictureType()
    }

    /**
     */
    description {
        get => this.get_description()
    }

    /**
     */
    URL {
        get => this.get_URL()
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMimeType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmetadatapicture-get_mimetype
     */
    get_mimeType(pbstrMimeType) {
        result := ComCall(7, this, "ptr", pbstrMimeType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPictureType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmetadatapicture-get_picturetype
     */
    get_pictureType(pbstrPictureType) {
        result := ComCall(8, this, "ptr", pbstrPictureType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmetadatapicture-get_description
     */
    get_description(pbstrDescription) {
        result := ComCall(9, this, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmetadatapicture-get_url
     */
    get_URL(pbstrURL) {
        result := ComCall(10, this, "ptr", pbstrURL, "HRESULT")
        return result
    }
}
