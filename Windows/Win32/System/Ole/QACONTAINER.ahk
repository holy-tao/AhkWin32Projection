#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\HPALETTE.ahk

/**
 * Specifies container information for IQuickActivate::QuickActivate.
 * @remarks
 * 
  * If an interface pointer in the <b>QACONTAINER</b> structure is <b>NULL</b> it does not indicate that the interface is not supported. In this situation, the control should use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to obtain the interface pointer in the standard manner.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/ns-ocidl-qacontainer
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class QACONTAINER extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a> interface in the container.
     * @type {Pointer<IOleClientSite>}
     */
    pClientSite {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iadvisesinkex">IAdviseSinkEx</a> interface in the container.
     * @type {Pointer<IAdviseSinkEx>}
     */
    pAdviseSink {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipropertynotifysink">IPropertyNotifySink</a> interface in the container.
     * @type {Pointer<IPropertyNotifySink>}
     */
    pPropertyNotifySink {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the container's sink object.
     * @type {Pointer<IUnknown>}
     */
    pUnkEventSink {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The number of ambient properties supplied by the container using values from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-qacontainerflags">QACONTAINERFLAGS</a> enumeration.
     * @type {Integer}
     */
    dwAmbientFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies ForeColor, an ambient property supplied by the container with a DISPID = -704.
     * @type {Integer}
     */
    colorFore {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Specifies BackColor, an ambient property supplied by the container with a DISPID = -701.
     * @type {Integer}
     */
    colorBack {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Specifies Font, an ambient property supplied by the container with a DISPID = -703.
     * @type {Pointer<IFont>}
     */
    pFont {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleundomanager">IOleUndoManager</a> interface in the container.
     * @type {Pointer<IOleUndoManager>}
     */
    pUndoMgr {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Specifies Appearance, an ambient property supplied by the container with a DISPID = -716.
     * @type {Integer}
     */
    dwAppearance {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Specifies LocaleIdentifier, an ambient property supplied by the container with a DISPID = -705.
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * Specifies Palette, an ambient property supplied by the container with a DISPID = -726.
     * @type {HPALETTE}
     */
    hpal{
        get {
            if(!this.HasProp("__hpal"))
                this.__hpal := HPALETTE(this.ptr + 80)
            return this.__hpal
        }
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775076(v=vs.85)">IBindHost</a> interface in the container.
     * @type {Pointer<IBindHost>}
     */
    pBindHost {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iolecontrolsite">IOleControlSite</a> interface in the container's site object.
     * @type {Pointer<IOleControlSite>}
     */
    pOleControlSite {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678965(v=vs.85)">IServiceProvider</a> interface in the container.
     * @type {Pointer<IServiceProvider>}
     */
    pServiceProvider {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 112
    }
}
