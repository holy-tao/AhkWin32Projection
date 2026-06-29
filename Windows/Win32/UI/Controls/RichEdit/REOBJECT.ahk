#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\System\Ole\IOleClientSite.ahk" { IOleClientSite }
#Import "..\..\..\System\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import ".\REOBJECT_FLAGS.ahk" { REOBJECT_FLAGS }
#Import "..\..\..\System\Ole\IOleObject.ahk" { IOleObject }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Contains information about an OLE or image object in a rich edit control.
 * @remarks
 * An OLE or image object  in a rich edit control occupies one character position in the plain text part of the in-memory backing store and have the value U+FFFC. They differ from "in-line objects" such as math objects. In-line objects occupy at least two character positions because they have an in-line object start delimiter (U+FDD0) and end delimiter  (U+FDEF).
 * @see https://learn.microsoft.com/windows/win32/api/richole/ns-richole-reobject
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct REOBJECT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Structure size, in bytes.
     */
    cbStruct : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Character position of the object.
     */
    cp : Int32

    /**
     * Type: <b>CLSID</b>
     * 
     * Class identifier of the object.
     */
    clsid : Guid

    /**
     * Type: <b>LPOLEOBJECT</b>
     * 
     * An instance of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> interface for the object.
     */
    poleobj : IOleObject

    /**
     * Type: <b>LPSTORAGE</b>
     * 
     * An instance of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface. This is the storage object associated with the object.
     */
    pstg : IStorage

    /**
     * Type: <b>LPOLECLIENTSITE</b>
     * 
     * An instance of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a> interface. This is the object's client site in the rich edit control. This address must have been obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/richole/nf-richole-iricheditole-getclientsite">GetClientSite</a> method.
     */
    polesite : IOleClientSite

    /**
     * Type: <b>SIZEL</b>
     * 
     * The size of the object. The unit of measure is 0.01 millimeters, which is a HIMETRIC measurement. For more information, see function <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getmapmode">GetMapMode</a>. A 0, 0 on insertion indicates that an object is free to determine its size until the modify flag is turned off.
     */
    sizel : SIZE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Display aspect used. See <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> for an explanation of possible values.
     */
    dvaspect : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwFlags : REOBJECT_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Reserved for user-defined values.
     */
    dwUser : UInt32

}
