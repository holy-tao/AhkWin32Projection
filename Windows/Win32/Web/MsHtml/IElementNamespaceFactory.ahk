#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementNamespaceFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementNamespaceFactory
     * @type {Guid}
     */
    static IID => Guid("{3050f672-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * The Create Time/Date Summary property conveys the time and date when an author created the installation package, transform, or patch package.
     * @param {IElementNamespace} pNamespace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Msi/create-time-date-summary
     */
    Create(pNamespace) {
        result := ComCall(3, this, "ptr", pNamespace, "HRESULT")
        return result
    }
}
