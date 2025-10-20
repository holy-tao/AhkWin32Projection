#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class _IMSVidCtlEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _IMSVidCtlEvents
     * @type {Guid}
     */
    static IID => Guid("{b0edf164-910a-11d2-b632-00c04f79498e}")

    /**
     * The class identifier for _IMSVidCtlEvents
     * @type {Guid}
     */
    static CLSID => Guid("{b0edf164-910a-11d2-b632-00c04f79498e}")

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
