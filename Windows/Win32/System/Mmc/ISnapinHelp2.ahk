#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISnapinHelp.ahk

/**
 * Allows snap-ins to add HTML Help support.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-isnapinhelp2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class ISnapinHelp2 extends ISnapinHelp{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISnapinHelp2
     * @type {Guid}
     */
    static IID => Guid("{4861a010-20f9-11d2-a510-00c04fb6dd2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLinkedTopics"]

    /**
     * 
     * @param {Pointer<PWSTR>} lpCompiledHelpFiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinhelp2-getlinkedtopics
     */
    GetLinkedTopics(lpCompiledHelpFiles) {
        result := ComCall(4, this, "ptr", lpCompiledHelpFiles, "HRESULT")
        return result
    }
}
