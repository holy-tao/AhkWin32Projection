#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\UI\WindowsAndMessaging\HACCEL.ahk" { HACCEL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about the accelerators supported by a container during an in-place session. The structure is used in the IOleInPlaceSite::GetWindowContext method and the OleTranslateAccelerator function.
 * @remarks
 * When an object is being in-place activated, its server calls the container's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-getwindowcontext">IOleInPlaceSite::GetWindowContext</a> method, which fills in an <b>OLEINPLACEFRAMEINFO</b> structure. During an in-place session, the message loop of an EXE server passes a pointer to the <b>OLEINPLACEFRAMEINFO</b> structure to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oletranslateaccelerator">OleTranslateAccelerator</a>. OLE uses the information in this structure to determine whether a message maps to one of the container's accelerators.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ns-oleidl-oleinplaceframeinfo
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLEINPLACEFRAMEINFO {
    #StructPack 8

    /**
     * The size of this structure, in bytes. The object server must specify sizeof(<b>OLEINPLACEFRAMEINFO</b>) in the structure it passes to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-getwindowcontext">IOleInPlaceSite::GetWindowContext</a>. The container can then use this size to determine the structure's version.
     */
    cb : UInt32

    /**
     * Indicates whether the container is an MDI application.
     */
    fMDIApp : BOOL

    /**
     * A handle to the container's top-level frame window.
     */
    hwndFrame : HWND

    /**
     * A handle to the accelerator table that the container wants to use during an in-place editing session.
     */
    haccel : HACCEL

    /**
     * The number of accelerators in <b>haccel</b>.
     */
    cAccelEntries : UInt32

}
