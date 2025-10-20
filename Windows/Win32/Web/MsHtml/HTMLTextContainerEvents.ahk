#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class HTMLTextContainerEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for HTMLTextContainerEvents
     * @type {Guid}
     */
    static IID => Guid("{1ff6aa72-5842-11cf-a707-00aa00c0098d}")

    /**
     * The class identifier for HTMLTextContainerEvents
     * @type {Guid}
     */
    static CLSID => Guid("{1ff6aa72-5842-11cf-a707-00aa00c0098d}")

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
