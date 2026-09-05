#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the desired data or view aspect of the object when drawing or getting data.
 * @remarks
 * Values of this enumeration are used to define the <b>dwAspect</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure. Only one <b>DVASPECT</b> value can be used to specify a single presentation aspect in a <b>FORMATETC</b> structure. The <b>FORMATETC</b> structure is used in many OLE functions and interface methods that require information on data presentation.
 * 
 * 
 * 
 * The default value of <b>MiscStatus</b> is used if a subkey corresponding to the specified <b>DVASPECT</b> is not found. To set an OLE control, specify DVASPECT==1. This will cause the following to occur in the registry:
 * 
 * 
 * <pre><b>HKEY_CLASSES_ROOT\CLSID\ . . .</b>
 *    <b>MiscStatus</b> = 1</pre>
 * @see https://learn.microsoft.com/windows/win32/api/wtypes/ne-wtypes-dvaspect
 * @namespace Windows.Win32.System.Com
 */
class DVASPECT extends Win32Enum {

    /**
     * Provides a representation of an object so it can be displayed as an embedded object inside of a container. This value is typically specified for compound document objects. The presentation can be provided for the screen or printer.
     * Native name: DVASPECT_CONTENT
     * @type {Integer (UInt32)}
     */
    static CONTENT => 1

    /**
     * Provides a thumbnail representation of an object so it can be displayed in a browsing tool. The thumbnail is approximately a 120 by 120 pixel, 16-color (recommended) device-independent bitmap potentially wrapped in a metafile.
     * Native name: DVASPECT_THUMBNAIL
     * @type {Integer (UInt32)}
     */
    static THUMBNAIL => 2

    /**
     * Provides an iconic representation of an object.
     * Native name: DVASPECT_ICON
     * @type {Integer (UInt32)}
     */
    static ICON => 4

    /**
     * Provides a representation of the object on the screen as though it were printed to a printer using the <b>Print</b> command from the <b>File</b> menu. The described data may represent a sequence of pages.
     * Native name: DVASPECT_DOCPRINT
     * @type {Integer (UInt32)}
     */
    static DOCPRINT => 8

    /**
     * Native name: DVASPECT_OPAQUE
     * @type {Integer (UInt32)}
     */
    static OPAQUE => 16

    /**
     * Native name: DVASPECT_TRANSPARENT
     * @type {Integer (UInt32)}
     */
    static TRANSPARENT => 32
}
