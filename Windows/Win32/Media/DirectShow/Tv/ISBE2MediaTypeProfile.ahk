#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements a media type profile.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2MediaTypeProfile)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-isbe2mediatypeprofile
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2MediaTypeProfile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISBE2MediaTypeProfile
     * @type {Guid}
     */
    static IID => Guid("{f238267d-4671-40d7-997e-25dc32cfed2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetStream", "AddStream", "DeleteStream"]

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2mediatypeprofile-getstreamcount
     */
    GetStreamCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2mediatypeprofile-getstream
     */
    GetStream(Index, ppMediaType) {
        ppMediaTypeMarshal := ppMediaType is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", Index, ppMediaTypeMarshal, ppMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2mediatypeprofile-addstream
     */
    AddStream(pMediaType) {
        result := ComCall(5, this, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2mediatypeprofile-deletestream
     */
    DeleteStream(Index) {
        result := ComCall(6, this, "uint", Index, "HRESULT")
        return result
    }
}
