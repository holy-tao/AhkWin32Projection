#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INamespaceWalkCB.ahk

/**
 * Extends INamespaceWalkCB with a method that is required in order to complete a namespace walk. This method removes data collected during the walk.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-inamespacewalkcb">INamespaceWalkCB</a> interface, from which it inherits.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-inamespacewalkcb2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INamespaceWalkCB2 extends INamespaceWalkCB{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INamespaceWalkCB2
     * @type {Guid}
     */
    static IID => Guid("{7ac7492b-c38e-438a-87db-68737844ff70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WalkComplete"]

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacewalkcb2-walkcomplete
     */
    WalkComplete(hr) {
        result := ComCall(7, this, "int", hr, "HRESULT")
        return result
    }
}
