#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Represents a description of a media format.
 * @remarks
 * 
  * To create a new media type, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
  *       
  * 
  * All of the information in a media type is stored as attributes. To clone a media type, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-copyallitems">IMFAttributes::CopyAllItems</a>.
  *       
  * 
  * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
  * 
  * <ul>
  * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
  * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfmediatype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaType extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaType
     * @type {Guid}
     */
    static IID => Guid("{44ae0fa8-ea31-4109-8d2e-4cae4997c555}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMajorType", "IsCompressedFormat", "IsEqual", "GetRepresentation", "FreeRepresentation"]

    /**
     * 
     * @param {Pointer<Guid>} pguidMajorType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediatype-getmajortype
     */
    GetMajorType(pguidMajorType) {
        result := ComCall(33, this, "ptr", pguidMajorType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCompressed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediatype-iscompressedformat
     */
    IsCompressedFormat(pfCompressed) {
        result := ComCall(34, this, "ptr", pfCompressed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaType} pIMediaType 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediatype-isequal
     */
    IsEqual(pIMediaType, pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, "ptr", pIMediaType, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guidRepresentation 
     * @param {Pointer<Pointer<Void>>} ppvRepresentation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediatype-getrepresentation
     */
    GetRepresentation(guidRepresentation, ppvRepresentation) {
        result := ComCall(36, this, "ptr", guidRepresentation, "ptr*", ppvRepresentation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guidRepresentation 
     * @param {Pointer<Void>} pvRepresentation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediatype-freerepresentation
     */
    FreeRepresentation(guidRepresentation, pvRepresentation) {
        pvRepresentationMarshal := pvRepresentation is VarRef ? "ptr" : "ptr"

        result := ComCall(37, this, "ptr", guidRepresentation, pvRepresentationMarshal, pvRepresentation, "HRESULT")
        return result
    }
}
