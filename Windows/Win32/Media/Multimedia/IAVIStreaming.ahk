#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAVIStreaming interface supports preparing open data streams for playback in streaming operations. Uses IUnknown::QueryInterface, IUnknown::AddRef, IUnknown::Release in addition to the following custom methods:\_
 * @see https://docs.microsoft.com/windows/win32/api//vfw/nn-vfw-iavistreaming
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class IAVIStreaming extends IUnknown{
    /**
     * The interface identifier for IAVIStreaming
     * @type {Guid}
     */
    static IID => Guid("{00020022-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lStart 
     * @param {Integer} lEnd 
     * @param {Integer} lRate 
     * @returns {HRESULT} 
     */
    Begin(lStart, lEnd, lRate) {
        result := ComCall(3, this, "int", lStart, "int", lEnd, "int", lRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    End() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
