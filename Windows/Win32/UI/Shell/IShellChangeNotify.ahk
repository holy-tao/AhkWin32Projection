#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that notifies a Shell namespace extension when the ID of an item has changed.
 * @remarks
 * 
 * <b>IShellChangeNotify</b> is used to let a host of a component communicate the change notifications that it receives to the objects that it hosts. This is used in Windows Explorer to communicate change notifications to band objects.
 * 
 * This interface is implemented by all namespace extensions.
 * 
 * You do not call this interface directly. <b>IShellChangeNotify</b> is used by the operating system only when it has confirmed that your application is aware of this interface.
 * 
 * <b>IShellChangeNotify</b> implements <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> as well as the listed method.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-ishellchangenotify
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellChangeNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellChangeNotify
     * @type {Guid}
     */
    static IID => Guid("{d82be2b1-5764-11d0-a96e-00c04fd705a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnChange"]

    /**
     * Informs a namespace extension that an event has taken place that affects its items.
     * @param {Integer} lEvent Type: <b>LONG</b>
     * 
     * A value that describes the event that has occurred. Typically, only one event is specified at a time. If more than one event is specified, the values contained in the <i>pidl1</i> and <i>pidl2</i> parameters must be the same, respectively, for all specified events.The <i>lEvent</i> parameter may contain one or more of the following flags.
     * @param {Pointer<ITEMIDLIST>} pidl1 Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The first event-dependent item identifier.
     * @param {Pointer<ITEMIDLIST>} pidl2 Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The second event-dependent item identifier.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellchangenotify-onchange
     */
    OnChange(lEvent, pidl1, pidl2) {
        result := ComCall(3, this, "int", lEvent, "ptr", pidl1, "ptr", pidl2, "HRESULT")
        return result
    }
}
