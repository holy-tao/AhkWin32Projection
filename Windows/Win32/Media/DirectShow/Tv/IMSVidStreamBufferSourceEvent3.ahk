#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IMSVidStreamBufferSourceEvent2.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSourceEvent3)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersourceevent3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSourceEvent3 extends IMSVidStreamBufferSourceEvent2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSourceEvent3
     * @type {Guid}
     */
    static IID => Guid("{ceabd6ab-9b90-4570-adf1-3ce76e00a763}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BroadcastEvent", "BroadcastEventEx", "COPPBlocked", "COPPUnblocked", "ContentPrimarilyAudio"]

    /**
     * 
     * @param {BSTR} Guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent3-broadcastevent
     */
    BroadcastEvent(Guid) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(18, this, "ptr", Guid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Guid 
     * @param {Integer} Param1 
     * @param {Integer} Param2 
     * @param {Integer} Param3 
     * @param {Integer} Param4 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent3-broadcasteventex
     */
    BroadcastEventEx(Guid, Param1, Param2, Param3, Param4) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(19, this, "ptr", Guid, "uint", Param1, "uint", Param2, "uint", Param3, "uint", Param4, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent3-coppblocked
     */
    COPPBlocked() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent3-coppunblocked
     */
    COPPUnblocked() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent3-contentprimarilyaudio
     */
    ContentPrimarilyAudio() {
        result := ComCall(22, this, "HRESULT")
        return result
    }
}
