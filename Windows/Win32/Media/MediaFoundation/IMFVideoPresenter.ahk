#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFClockStateSink.ahk

/**
 * Represents a video presenter. A video presenter is an object that receives video frames, typically from a video mixer, and presents them in some way, typically by rendering them to the display.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imfvideopresenter
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoPresenter extends IMFClockStateSink{
    /**
     * The interface identifier for IMFVideoPresenter
     * @type {Guid}
     */
    static IID => Guid("{29aff080-182a-4a5d-af3b-448f3a6346cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Integer} eMessage 
     * @param {Pointer} ulParam 
     * @returns {HRESULT} 
     */
    ProcessMessage(eMessage, ulParam) {
        result := ComCall(8, this, "int", eMessage, "ptr", ulParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFVideoMediaType>} ppMediaType 
     * @returns {HRESULT} 
     */
    GetCurrentMediaType(ppMediaType) {
        result := ComCall(9, this, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
