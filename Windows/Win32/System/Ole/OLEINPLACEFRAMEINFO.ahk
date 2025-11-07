#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\UI\WindowsAndMessaging\HACCEL.ahk

/**
 * Contains information about the accelerators supported by a container during an in-place session. The structure is used in the IOleInPlaceSite::GetWindowContext method and the OleTranslateAccelerator function.
 * @remarks
 * 
 * When an object is being in-place activated, its server calls the container's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-getwindowcontext">IOleInPlaceSite::GetWindowContext</a> method, which fills in an <b>OLEINPLACEFRAMEINFO</b> structure. During an in-place session, the message loop of an EXE server passes a pointer to the <b>OLEINPLACEFRAMEINFO</b> structure to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oletranslateaccelerator">OleTranslateAccelerator</a>. OLE uses the information in this structure to determine whether a message maps to one of the container's accelerators.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/ns-oleidl-oleinplaceframeinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLEINPLACEFRAMEINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of this structure, in bytes. The object server must specify sizeof(<b>OLEINPLACEFRAMEINFO</b>) in the structure it passes to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-getwindowcontext">IOleInPlaceSite::GetWindowContext</a>. The container can then use this size to determine the structure's version.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates whether the container is an MDI application.
     * @type {BOOL}
     */
    fMDIApp {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A handle to the container's top-level frame window.
     * @type {HWND}
     */
    hwndFrame{
        get {
            if(!this.HasProp("__hwndFrame"))
                this.__hwndFrame := HWND(8, this)
            return this.__hwndFrame
        }
    }

    /**
     * A handle to the accelerator table that the container wants to use during an in-place editing session.
     * @type {HACCEL}
     */
    haccel{
        get {
            if(!this.HasProp("__haccel"))
                this.__haccel := HACCEL(16, this)
            return this.__haccel
        }
    }

    /**
     * The number of accelerators in <b>haccel</b>.
     * @type {Integer}
     */
    cAccelEntries {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
