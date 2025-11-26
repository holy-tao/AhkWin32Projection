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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin", "End"]

    /**
     * The Begin method prepares for the streaming operation. Called when an application uses the AVIStreamBeginStreaming function.
     * @param {Integer} lStart Starting frame for streaming.
     * @param {Integer} lEnd Ending frame for streaming.
     * @param {Integer} lRate Speed at which the file is read relative to its normal playback rate. Normal speed is 1000. Larger values indicate faster speeds; smaller values indicate slower speeds.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-iavistreaming-begin
     */
    Begin(lStart, lEnd, lRate) {
        result := ComCall(3, this, "int", lStart, "int", lEnd, "int", lRate, "HRESULT")
        return result
    }

    /**
     * The End method ends the streaming operation. Called when an application uses the AVIStreamEndStreaming function.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-iavistreaming-end
     */
    End() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
