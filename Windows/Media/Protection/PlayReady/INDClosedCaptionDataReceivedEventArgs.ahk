#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Specifies arguments for a PlayReady-ND [ClosedCaptionDataReceived](ndclient_closedcaptiondatareceived.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indclosedcaptiondatareceivedeventargs
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDClosedCaptionDataReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDClosedCaptionDataReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{4738d29f-c345-4649-8468-b8c5fc357190}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClosedCaptionDataFormat", "get_PresentationTimestamp", "get_ClosedCaptionData"]

    /**
     * Gets the format of the closed caption data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indclosedcaptiondatareceivedeventargs.closedcaptiondataformat
     * @type {Integer} 
     */
    ClosedCaptionDataFormat {
        get => this.get_ClosedCaptionDataFormat()
    }

    /**
     * Gets the timestamp of the closed caption data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indclosedcaptiondatareceivedeventargs.presentationtimestamp
     * @type {Integer} 
     */
    PresentationTimestamp {
        get => this.get_PresentationTimestamp()
    }

    /**
     * Gets the closed caption data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indclosedcaptiondatareceivedeventargs.closedcaptiondata
     */
    ClosedCaptionData {
        get => this.get_ClosedCaptionData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClosedCaptionDataFormat() {
        result := ComCall(6, this, "int*", &ccForamt := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ccForamt
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PresentationTimestamp() {
        result := ComCall(7, this, "int64*", &presentationTimestamp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return presentationTimestamp
    }

    /**
     * 
     * @param {Pointer<Pointer>} ccDataBytes 
     * @returns {HRESULT} 
     */
    get_ClosedCaptionData(ccDataBytes) {
        result := ComCall(8, this, "ptr", ccDataBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
