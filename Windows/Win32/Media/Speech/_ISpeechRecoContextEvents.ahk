#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class _ISpeechRecoContextEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _ISpeechRecoContextEvents
     * @type {Guid}
     */
    static IID => Guid("{7b8fcb42-0e9d-4f00-a048-7b04d6179d3d}")

    /**
     * The class identifier for _ISpeechRecoContextEvents
     * @type {Guid}
     */
    static CLSID => Guid("{7b8fcb42-0e9d-4f00-a048-7b04d6179d3d}")

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
