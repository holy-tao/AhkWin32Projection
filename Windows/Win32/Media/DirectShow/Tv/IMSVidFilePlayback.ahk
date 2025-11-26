#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IMSVidPlayback.ahk

/**
 * The IMSVidFilePlayback interface enables the client to specify a local file for playback. It is implemented by the MSVidFilePlaybackDevice object.
 * @remarks
 * 
 * To play a media file using the Video Control, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method with the name of the file. The <b>View</b> method automatically loads the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidfileplaybackdevice">MSVidFilePlayback</a> object.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidFilePlayback)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidfileplayback
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidFilePlayback extends IMSVidPlayback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidFilePlayback
     * @type {Guid}
     */
    static IID => Guid("{37b03539-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FileName", "put_FileName"]

    /**
     * @type {BSTR} 
     */
    FileName {
        get => this.get_FileName()
        set => this.put_FileName(value)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidfileplayback-get_filename
     */
    get_FileName() {
        FileName := BSTR()
        result := ComCall(32, this, "ptr", FileName, "HRESULT")
        return FileName
    }

    /**
     * 
     * @param {BSTR} FileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidfileplayback-put_filename
     */
    put_FileName(FileName) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(33, this, "ptr", FileName, "HRESULT")
        return result
    }
}
