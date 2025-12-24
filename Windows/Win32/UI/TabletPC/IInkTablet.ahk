#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IInkRectangle.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents the digitizer device of Tablet PC that receives tablet device messages or events.
 * @remarks
 * 
 * You can use the <b>IInkTablet</b> object to determine the hardware capabilities of the tablet device. A Tablet PC may have more than one digitizer attached in addition to the built-in digitizer.
 * 
 * <b>IInkTablet</b> objects work closely with ink collector objects. An ink collector (<a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a>, <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a>, or <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a>) can be set to one of two tablet-related modes:
 * 
 * <ul>
 * <li>All tablets mode</li>
 * <li>Single tablet integrated mode</li>
 * </ul>
 * The default mode is all tablets mode (set with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setalltabletsmode">SetAllTabletsMode</a> method of the ink collector). This mode integrates all tablet devices if multiple devices are attached to the Tablet PC. Because all of the tablets are integrated, available cursors can be used on any of the tablet devices, and each tablet maps to the entire screen. This allows automatic updating of the windows.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinktablet
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkTablet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkTablet
     * @type {Guid}
     */
    static IID => Guid("{2de25eaa-6ef8-42d5-aee9-185bc81b912d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_PlugAndPlayId", "get_MaximumInputRectangle", "get_HardwareCapabilities", "IsPacketPropertySupported", "GetPropertyMetrics"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    PlugAndPlayId {
        get => this.get_PlugAndPlayId()
    }

    /**
     * @type {IInkRectangle} 
     */
    MaximumInputRectangle {
        get => this.get_MaximumInputRectangle()
    }

    /**
     * @type {Integer} 
     */
    HardwareCapabilities {
        get => this.get_HardwareCapabilities()
    }

    /**
     * Gets the name of the object.
     * @remarks
     * 
     * Accessing this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, WM_PAINT; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktablet-get_name
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablet-get_plugandplayid
     */
    get_PlugAndPlayId() {
        Id := BSTR()
        result := ComCall(8, this, "ptr", Id, "HRESULT")
        return Id
    }

    /**
     * Gets the maximum input rectangle, in tablet device coordinates that the IInkTablet object supports.
     * @remarks
     * 
     * The rectangle returned by the <b>MaximumInputRectangle</b> property specifies the maximum allowable space in which ink can be drawn.
     * 
     * <div class="alert"><b>Note</b>  Accessing this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: WM_ACTIVATE, WM_ACTIVATEAPP, WMNCACTIVATE, WM_PAINT; WM_SYSCOMMAND if <b>wParam</b> is set to SC_HOTKEY or SC_TASKLIST; and WM_SYSKEYDOWN (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * 
     * 
     * @returns {IInkRectangle} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktablet-get_maximuminputrectangle
     */
    get_MaximumInputRectangle() {
        result := ComCall(9, this, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * Gets a bitmask that defines the hardware capabilities of the tablet, such as whether a cursor must be in physical contact with the tablet to report its position.
     * @remarks
     * 
     * For a complete list of hardware capability values that you can use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-tablethardwarecapabilities">TabletHardwareCapabilities</a> enumeration type.
     * 
     * <div class="alert"><b>Note</b>  Accessing this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: WM_ACTIVATE, WM_ACTIVATEAPP, WMNCACTIVATE, WM_PAINT; WM_SYSCOMMAND if <b>wParam</b> is set to SC_HOTKEY or SC_TASKLIST; and WM_SYSKEYDOWN (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktablet-get_hardwarecapabilities
     */
    get_HardwareCapabilities() {
        result := ComCall(10, this, "int*", &Capabilities := 0, "HRESULT")
        return Capabilities
    }

    /**
     * Determines whether a property of a tablet device or a collection of tablet devices, identified with a globally unique identifier (GUID), is supported.
     * @param {BSTR} packetPropertyName The GUID for the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetproperty-guids">PacketProperty GUIDs</a> of the tablet or tablets that is requested. Use a defined BSTR constant from the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">PacketProperty</a> constants.
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if a known property is supported by the tablet or tablets; otherwise, <b>VARIANT_FALSE</b>.
     * 
     * <div class="alert"><b>Note</b>  This method can be re-entered when called within certain message handlers, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: WM_ACTIVATE, WM_ACTIVATEAPP, WM_NCACTIVATE, WM_PAINT; WM_SYSCOMMAND if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and WM_SYSKEYDOWN (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktablet-ispacketpropertysupported
     */
    IsPacketPropertySupported(packetPropertyName) {
        packetPropertyName := packetPropertyName is String ? BSTR.Alloc(packetPropertyName).Value : packetPropertyName

        result := ComCall(11, this, "ptr", packetPropertyName, "short*", &Supported := 0, "HRESULT")
        return Supported
    }

    /**
     * Retrieves the metrics data for a specified property.
     * @param {BSTR} propertyName The property for which you want to determine metrics.
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @param {Pointer<Integer>} Minimum The minimum value, in logical units, that the tablet reports for this property. For example, a tablet reporting x-values from 0 to 9000 has a logical minimum of 0.
     * @param {Pointer<Integer>} Maximum The maximum value, in logical units, that the tablet reports for this property. For example, a tablet reporting x-values from 0 to 9000 would have a logical maximum of 9000.
     * @param {Pointer<Integer>} Units The physical units of the property, such as inches or degrees. For a list of property units, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-tabletpropertymetricunit">TabletPropertyMetricUnit</a> enumeration type.
     * @param {Pointer<Float>} Resolution Specifies the resolution or increment value for the <b>units</b> member. For example, a tablet that reports 400 dots per inch (dpi) has a  resolution value of 400.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_UNKNOWN_PROPERTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The tablet does not support the specified property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_CLASSSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid GUID format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown property string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred while processing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktablet-getpropertymetrics
     */
    GetPropertyMetrics(propertyName, Minimum, Maximum, Units, Resolution) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        MinimumMarshal := Minimum is VarRef ? "int*" : "ptr"
        MaximumMarshal := Maximum is VarRef ? "int*" : "ptr"
        UnitsMarshal := Units is VarRef ? "int*" : "ptr"
        ResolutionMarshal := Resolution is VarRef ? "float*" : "ptr"

        result := ComCall(12, this, "ptr", propertyName, MinimumMarshal, Minimum, MaximumMarshal, Maximum, UnitsMarshal, Units, ResolutionMarshal, Resolution, "HRESULT")
        return result
    }
}
