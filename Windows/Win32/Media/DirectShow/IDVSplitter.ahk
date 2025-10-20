#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Downgrades the frame rate on a digital video (DV) stream.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvsplitter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDVSplitter extends IUnknown{
    /**
     * The interface identifier for IDVSplitter
     * @type {Guid}
     */
    static IID => Guid("{92a3a302-da7c-4a1f-ba7e-1802bb5d2d02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} nDiscard 
     * @returns {HRESULT} 
     */
    DiscardAlternateVideoFrames(nDiscard) {
        result := ComCall(3, this, "int", nDiscard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
