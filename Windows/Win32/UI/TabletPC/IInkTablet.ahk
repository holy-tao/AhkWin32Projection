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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablet-get_name
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
     * 
     * @returns {IInkRectangle} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablet-get_maximuminputrectangle
     */
    get_MaximumInputRectangle() {
        result := ComCall(9, this, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablet-get_hardwarecapabilities
     */
    get_HardwareCapabilities() {
        result := ComCall(10, this, "int*", &Capabilities := 0, "HRESULT")
        return Capabilities
    }

    /**
     * 
     * @param {BSTR} packetPropertyName 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablet-ispacketpropertysupported
     */
    IsPacketPropertySupported(packetPropertyName) {
        packetPropertyName := packetPropertyName is String ? BSTR.Alloc(packetPropertyName).Value : packetPropertyName

        result := ComCall(11, this, "ptr", packetPropertyName, "short*", &Supported := 0, "HRESULT")
        return Supported
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @param {Pointer<Integer>} Minimum 
     * @param {Pointer<Integer>} Maximum 
     * @param {Pointer<Integer>} Units 
     * @param {Pointer<Float>} Resolution 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablet-getpropertymetrics
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
