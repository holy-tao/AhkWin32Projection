#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WMP/-wmpocxevents-interface
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class _WMPOCXEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _WMPOCXEvents
     * @type {Guid}
     */
    static IID => Guid("{6bf52a51-394a-11d3-b153-00c04f79faa6}")

    /**
     * The class identifier for _WMPOCXEvents
     * @type {Guid}
     */
    static CLSID => Guid("{6bf52a51-394a-11d3-b153-00c04f79faa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
