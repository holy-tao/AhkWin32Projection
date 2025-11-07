#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PREVIEWHANDLERFRAMEINFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables preview handlers to pass keyboard shortcuts to the host. This interface retrieves a list of keyboard shortcuts and directs the host to handle a keyboard shortcut.
 * @remarks
 * 
 * This is an interface that preview handlers use to communicate keyboard shortcuts to the host. Preview handlers obtain this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the pointer passed as a parameter to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iobjectwithsite-setsite">SetSite</a>. Preview handlers do not need to implement this interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ipreviewhandlerframe
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPreviewHandlerFrame extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPreviewHandlerFrame
     * @type {Guid}
     */
    static IID => Guid("{fec87aaf-35f9-447a-adb7-20234491401a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWindowContext", "TranslateAccelerator"]

    /**
     * 
     * @returns {PREVIEWHANDLERFRAMEINFO} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlerframe-getwindowcontext
     */
    GetWindowContext() {
        pinfo := PREVIEWHANDLERFRAMEINFO()
        result := ComCall(3, this, "ptr", pinfo, "HRESULT")
        return pinfo
    }

    /**
     * 
     * @param {Pointer<MSG>} pmsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlerframe-translateaccelerator
     */
    TranslateAccelerator(pmsg) {
        result := ComCall(4, this, "ptr", pmsg, "HRESULT")
        return result
    }
}
