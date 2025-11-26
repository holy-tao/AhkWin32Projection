#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFVideoMediaType.ahk
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
     * Sends a message to the video presenter. Messages are used to signal the presenter that it must perform some action, or that some event has occurred.
     * @param {Integer} eMessage Specifies the message as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvp_message_type">MFVP_MESSAGE_TYPE</a> enumeration.
     * @param {Pointer} ulParam Message parameter. The meaning of this parameter depends on the message type.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideopresenter-processmessage
     */
    ProcessMessage(eMessage, ulParam) {
        result := ComCall(8, this, "int", eMessage, "ptr", ulParam, "HRESULT")
        return result
    }

    /**
     * Retrieves the presenter's media type.
     * @returns {IMFVideoMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfvideomediatype">IMFVideoMediaType</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideopresenter-getcurrentmediatype
     */
    GetCurrentMediaType() {
        result := ComCall(9, this, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFVideoMediaType(ppMediaType)
    }
}
