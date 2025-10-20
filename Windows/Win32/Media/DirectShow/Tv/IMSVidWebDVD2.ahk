#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidWebDVD.ahk

/**
 * Contains methods that save and load the current location and state for DVD playback.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidWebDVD2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidwebdvd2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidWebDVD2 extends IMSVidWebDVD{
    /**
     * The interface identifier for IMSVidWebDVD2
     * @type {Guid}
     */
    static IID => Guid("{7027212f-ee9a-4a7c-8b67-f023714cdaff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 127

    /**
     * 
     * @param {Pointer<Byte>} ppData 
     * @param {Pointer<UInt32>} pDataLength 
     * @returns {HRESULT} 
     */
    get_Bookmark(ppData, pDataLength) {
        result := ComCall(127, this, "char*", ppData, "uint*", pDataLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} dwDataLength 
     * @returns {HRESULT} 
     */
    put_Bookmark(pData, dwDataLength) {
        result := ComCall(128, this, "char*", pData, "uint", dwDataLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
