#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a property used in the lattice.
 * @remarks
 * 
 * Properties can be stored on a column or an element. For example, the recognizer can store ink line break information about an alternate.
 * 
 * There are some predefined property GUIDs defined in the Msinkaut.h header file.
 * 
 * <table>
 * <tr>
 * <th>GUID</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * INKRECOGNITIONPROPERTY_CONFIDENCELEVEL
 * 
 * </td>
 * <td>
 * Describes whether the element contains wide string or wide character data.
 * <c>enum enumCONFIDENCE_LEVEL</code><code>{</code><code>CFL_STRONG = 0,</code><code>CFL_INTERMEDIATE = 1,</code><code>CFL_POOR = 2</code><code>} CONFIDENCE_LEVEL;</c></td>
 * </tr>
 * <tr>
 * <td>
 * INKRECOGNITIONPROPERTY_HOTPOINT
 * 
 * </td>
 * <td>
 * For gestures, identifies the part of the stroke that is the hot point. The hot point is the part of the stroke where the associated action is being applied.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * INKRECOGNITIONPROPERTY_LINEMETRICS
 * 
 * </td>
 * <td>
 * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-lattice_metrics">LATTICE_METRICS</a> structure that holds details about the baseline and midline for the element. To set this property, your recognizer must also set the INKRECOGNITIONPROPERTY_LINENUMBER property.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * INKRECOGNITIONPROPERTY_LINENUMBER
 * 
 * </td>
 * <td>
 * A ULONG value containing the line that the element belongs to as determined by the recognizer.
 * 
 * </td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rectypes/ns-rectypes-reco_lattice_property
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class RECO_LATTICE_PROPERTY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * GUID for the property value that is being assigned.
     * @type {Pointer<Guid>}
     */
    guidProperty {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Length in bytes of the <i>pPropertyValue</i> byte array.
     * @type {Integer}
     */
    cbPropertyValue {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Byte array that points to the property data.
     * @type {Pointer<Integer>}
     */
    pPropertyValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
