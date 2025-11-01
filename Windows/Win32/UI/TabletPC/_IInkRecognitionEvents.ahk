#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class _IInkRecognitionEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _IInkRecognitionEvents
     * @type {Guid}
     */
    static IID => Guid("{17bce92f-2e21-47fd-9d33-3c6afbfd8c59}")

    /**
     * The class identifier for _IInkRecognitionEvents
     * @type {Guid}
     */
    static CLSID => Guid("{17bce92f-2e21-47fd-9d33-3c6afbfd8c59}")

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
