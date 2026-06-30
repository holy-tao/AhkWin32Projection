#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\REOBJECT_FLAGS.ahk
#Include ..\..\..\System\Com\StructuredStorage\IStorage.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Ole\IOleClientSite.ahk
#Include ..\..\..\Foundation\SIZE.ahk
#Include ..\..\..\System\Ole\IOleObject.ahk

/**
 * Contains information about an OLE or image object in a rich edit control.
 * @remarks
 * An OLE or image object  in a rich edit control occupies one character position in the plain text part of the in-memory backing store and have the value U+FFFC. They differ from "in-line objects" such as math objects. In-line objects occupy at least two character positions because they have an in-line object start delimiter (U+FDD0) and end delimiter  (U+FDEF).
 * @see https://learn.microsoft.com/windows/win32/api/richole/ns-richole-reobject
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
class REOBJECT extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Structure size, in bytes.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Character position of the object.
     * @type {Integer}
     */
    cp {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>CLSID</b>
     * 
     * Class identifier of the object.
     * @type {Guid}
     */
    clsid {
        get {
            if(!this.HasProp("__clsid"))
                this.__clsid := Guid(8, this)
            return this.__clsid
        }
    }

    /**
     * Type: <b>LPOLEOBJECT</b>
     * 
     * An instance of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> interface for the object.
     * @type {IOleObject}
     */
    poleobj {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPSTORAGE</b>
     * 
     * An instance of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface. This is the storage object associated with the object.
     * @type {IStorage}
     */
    pstg {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>LPOLECLIENTSITE</b>
     * 
     * An instance of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a> interface. This is the object's client site in the rich edit control. This address must have been obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/richole/nf-richole-iricheditole-getclientsite">GetClientSite</a> method.
     * @type {IOleClientSite}
     */
    polesite {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>SIZEL</b>
     * 
     * The size of the object. The unit of measure is 0.01 millimeters, which is a HIMETRIC measurement. For more information, see function <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getmapmode">GetMapMode</a>. A 0, 0 on insertion indicates that an object is free to determine its size until the modify flag is turned off.
     * @type {SIZE}
     */
    sizel {
        get {
            if(!this.HasProp("__sizel"))
                this.__sizel := SIZE(48, this)
            return this.__sizel
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Display aspect used. See <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> for an explanation of possible values.
     * @type {Integer}
     */
    dvaspect {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {REOBJECT_FLAGS}
     */
    dwFlags {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Reserved for user-defined values.
     * @type {Integer}
     */
    dwUser {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
