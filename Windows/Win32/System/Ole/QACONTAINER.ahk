#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IOleUndoManager.ahk" { IOleUndoManager }
#Import ".\IOleClientSite.ahk" { IOleClientSite }
#Import ".\IFont.ahk" { IFont }
#Import ".\IPropertyNotifySink.ahk" { IPropertyNotifySink }
#Import ".\IOleControlSite.ahk" { IOleControlSite }
#Import "..\..\Graphics\Gdi\HPALETTE.ahk" { HPALETTE }
#Import "..\Com\IServiceProvider.ahk" { IServiceProvider }
#Import "..\Com\IBindHost.ahk" { IBindHost }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IAdviseSinkEx.ahk" { IAdviseSinkEx }

/**
 * Specifies container information for IQuickActivate::QuickActivate.
 * @remarks
 * If an interface pointer in the <b>QACONTAINER</b> structure is <b>NULL</b> it does not indicate that the interface is not supported. In this situation, the control should use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to obtain the interface pointer in the standard manner.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-qacontainer
 * @namespace Windows.Win32.System.Ole
 */
export default struct QACONTAINER {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a> interface in the container.
     */
    pClientSite : IOleClientSite

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iadvisesinkex">IAdviseSinkEx</a> interface in the container.
     */
    pAdviseSink : IAdviseSinkEx

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipropertynotifysink">IPropertyNotifySink</a> interface in the container.
     */
    pPropertyNotifySink : IPropertyNotifySink

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the container's sink object.
     */
    pUnkEventSink : IUnknown

    /**
     * The number of ambient properties supplied by the container using values from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-qacontainerflags">QACONTAINERFLAGS</a> enumeration.
     */
    dwAmbientFlags : UInt32

    /**
     * Specifies ForeColor, an ambient property supplied by the container with a DISPID = -704.
     */
    colorFore : UInt32

    /**
     * Specifies BackColor, an ambient property supplied by the container with a DISPID = -701.
     */
    colorBack : UInt32

    /**
     * Specifies Font, an ambient property supplied by the container with a DISPID = -703.
     */
    pFont : IFont

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleundomanager">IOleUndoManager</a> interface in the container.
     */
    pUndoMgr : IOleUndoManager

    /**
     * Specifies Appearance, an ambient property supplied by the container with a DISPID = -716.
     */
    dwAppearance : UInt32

    /**
     * Specifies LocaleIdentifier, an ambient property supplied by the container with a DISPID = -705.
     */
    lcid : Int32

    /**
     * Specifies Palette, an ambient property supplied by the container with a DISPID = -726.
     */
    hpal : HPALETTE

    /**
     * A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775076(v=vs.85)">IBindHost</a> interface in the container.
     */
    pBindHost : IBindHost

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iolecontrolsite">IOleControlSite</a> interface in the container's site object.
     */
    pOleControlSite : IOleControlSite

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678965(v=vs.85)">IServiceProvider</a> interface in the container.
     */
    pServiceProvider : IServiceProvider

}
