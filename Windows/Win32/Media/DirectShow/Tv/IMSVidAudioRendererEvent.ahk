#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidOutputDeviceEvent.ahk

/**
 * This topic applies to Windows XP or later.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidAudioRendererEvent)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidaudiorendererevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidAudioRendererEvent extends IMSVidOutputDeviceEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidAudioRendererEvent
     * @type {Guid}
     */
    static IID => Guid("{37b03541-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
