#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the methods used to interact with the Remote Desktop Protocol (RDP) app container client control.
 * @see https://docs.microsoft.com/windows/win32/api//rdpappcontainerclient/nn-rdpappcontainerclient-iremotedesktopclientactions
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IRemoteDesktopClientActions extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDesktopClientActions
     * @type {Guid}
     */
    static IID => Guid("{7d54bc4e-1028-45d4-8b0a-b9b6bffba176}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SuspendScreenUpdates", "ResumeScreenUpdates", "ExecuteRemoteAction", "GetSnapshot"]

    /**
     * Suspends screen updates being sent to the client.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientactions-suspendscreenupdates
     */
    SuspendScreenUpdates() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Resumes screen updates being sent to the client.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientactions-resumescreenupdates
     */
    ResumeScreenUpdates() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Causes an action to be performed in the remote session.
     * @param {Integer} remoteAction 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientactions-executeremoteaction
     */
    ExecuteRemoteAction(remoteAction) {
        result := ComCall(9, this, "int", remoteAction, "HRESULT")
        return result
    }

    /**
     * Causes a snapshot of the Remote Desktop Protocol (RDP) app container client's in-session desktop to be taken.
     * @param {Integer} snapshotEncoding Specifies the encoding type for the snapshot.
     * @param {Integer} snapshotFormat Specifies the data format type for the snapshot
     * @param {Integer} snapshotWidth The width, in pixels, of the snapshot.
     * @param {Integer} snapshotHeight The height, in pixels, of the snapshot.
     * @returns {BSTR} On return points to the snapshot.
     * @see https://docs.microsoft.com/windows/win32/api//rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientactions-getsnapshot
     */
    GetSnapshot(snapshotEncoding, snapshotFormat, snapshotWidth, snapshotHeight) {
        snapshotData := BSTR()
        result := ComCall(10, this, "int", snapshotEncoding, "int", snapshotFormat, "uint", snapshotWidth, "uint", snapshotHeight, "ptr", snapshotData, "HRESULT")
        return snapshotData
    }
}
