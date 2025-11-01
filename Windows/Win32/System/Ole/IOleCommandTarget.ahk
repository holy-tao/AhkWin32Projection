#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables objects and their containers to dispatch commands to each other. For example, an object's toolbars may contain buttons for commands such as Print, Print Preview, Save, New, and Zoom.
 * @see https://docs.microsoft.com/windows/win32/api//docobj/nn-docobj-iolecommandtarget
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleCommandTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleCommandTarget
     * @type {Guid}
     */
    static IID => Guid("{b722bccb-4e68-101b-a2bc-00aa00404770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryStatus", "Exec"]

    /**
     * 
     * @param {Pointer<Guid>} pguidCmdGroup 
     * @param {Integer} cCmds 
     * @param {Pointer<OLECMD>} prgCmds 
     * @param {Pointer<OLECMDTEXT>} pCmdText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-iolecommandtarget-querystatus
     */
    QueryStatus(pguidCmdGroup, cCmds, prgCmds, pCmdText) {
        result := ComCall(3, this, "ptr", pguidCmdGroup, "uint", cCmds, "ptr", prgCmds, "ptr", pCmdText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidCmdGroup 
     * @param {Integer} nCmdID 
     * @param {Integer} nCmdexecopt 
     * @param {Pointer<VARIANT>} pvaIn 
     * @param {Pointer<VARIANT>} pvaOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-iolecommandtarget-exec
     */
    Exec(pguidCmdGroup, nCmdID, nCmdexecopt, pvaIn, pvaOut) {
        result := ComCall(4, this, "ptr", pguidCmdGroup, "uint", nCmdID, "uint", nCmdexecopt, "ptr", pvaIn, "ptr", pvaOut, "HRESULT")
        return result
    }
}
