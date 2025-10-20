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
     * 
     * @param {Pointer<Guid>} pguidMajorType 
     * @returns {HRESULT} 
     */
    GetMajorType(pguidMajorType) {
        result := ComCall(33, this, "ptr", pguidMajorType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCompressed 
     * @returns {HRESULT} 
     */
    IsCompressedFormat(pfCompressed) {
        result := ComCall(34, this, "ptr", pfCompressed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaType>} pIMediaType 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    IsEqual(pIMediaType, pdwFlags) {
        result := ComCall(35, this, "ptr", pIMediaType, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidRepresentation 
     * @param {Pointer<Void>} ppvRepresentation 
     * @returns {HRESULT} 
     */
    GetRepresentation(guidRepresentation, ppvRepresentation) {
        result := ComCall(36, this, "ptr", guidRepresentation, "ptr", ppvRepresentation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidRepresentation 
     * @param {Pointer<Void>} pvRepresentation 
     * @returns {HRESULT} 
     */
    FreeRepresentation(guidRepresentation, pvRepresentation) {
        result := ComCall(37, this, "ptr", guidRepresentation, "ptr", pvRepresentation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
