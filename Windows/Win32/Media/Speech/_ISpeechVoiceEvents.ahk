#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class _ISpeechVoiceEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _ISpeechVoiceEvents
     * @type {Guid}
     */
    static IID => Guid("{a372acd1-3bef-4bbd-8ffb-cb3e2b416af8}")

    /**
     * The class identifier for _ISpeechVoiceEvents
     * @type {Guid}
     */
    static CLSID => Guid("{a372acd1-3bef-4bbd-8ffb-cb3e2b416af8}")

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
