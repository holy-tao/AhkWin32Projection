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
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetStreamCount(pCount) {
        result := ComCall(3, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<AM_MEDIA_TYPE>} ppMediaType 
     * @returns {HRESULT} 
     */
    GetStream(Index, ppMediaType) {
        result := ComCall(4, this, "uint", Index, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     */
    AddStream(pMediaType) {
        result := ComCall(5, this, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    DeleteStream(Index) {
        result := ComCall(6, this, "uint", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
