#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a single method that retrieves the status of a folder's System.IsPinnedToNameSpaceTree filtering support.
 * @remarks
 * 
  * The namespace tree control checks all the nodes it enumerates to see if they support filtering. This is done by retrieving the <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-ispinnedtonamespacetree">System.IsPinnedToNameSpaceTree</a> property for the shell folders that support this interface. Nodes that do not support this interface do not have filtering support and are shown by default.
  * 
  * Use this interface to retrieve the filtering support status of a shell folder.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-inamespacetreecontrolfoldercapabilities
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INameSpaceTreeControlFolderCapabilities extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INameSpaceTreeControlFolderCapabilities
     * @type {Guid}
     */
    static IID => Guid("{e9701183-e6b3-4ff2-8568-813615fec7be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFolderCapabilities"]

    /**
     * 
     * @param {Integer} nfcMask 
     * @param {Pointer<Integer>} pnfcValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrolfoldercapabilities-getfoldercapabilities
     */
    GetFolderCapabilities(nfcMask, pnfcValue) {
        result := ComCall(3, this, "int", nfcMask, "int*", pnfcValue, "HRESULT")
        return result
    }
}
