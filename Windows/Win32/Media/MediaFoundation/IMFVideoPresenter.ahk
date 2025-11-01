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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProcessMessage", "GetCurrentMediaType"]

    /**
     * 
     * @param {Integer} eMessage 
     * @param {Pointer} ulParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideopresenter-processmessage
     */
    ProcessMessage(eMessage, ulParam) {
        result := ComCall(8, this, "int", eMessage, "ptr", ulParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFVideoMediaType>} ppMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideopresenter-getcurrentmediatype
     */
    GetCurrentMediaType(ppMediaType) {
        result := ComCall(9, this, "ptr*", ppMediaType, "HRESULT")
        return result
    }
}
