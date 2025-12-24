#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkDisp.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use interface to programmatically create strokes from packet data.
 * @remarks
 * 
 * This interface is implemented by the <a href="https://docs.microsoft.com/windows/desktop/tablet/strokebuilder-class">StrokeBuilder Class</a>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/tablet/strokebuilder-class">StrokeBuilder Class</a> provides an alternative method of creating a stroke for applications that manage the data. It has methods that can be called from <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusdown">StylusDown</a>, <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-packets">Packets</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusup">StylusUp</a> notifications.
 * 
 * The following two models are supported.
 * 
 * <ul>
 * <li>Converting custom stroke information to a stroke in an atomic fashion by using the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istrokebuilder-createstroke">IStrokeBuilder::CreateStroke Method</a> method.</li>
 * <li>Building the stroke by using the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istrokebuilder-beginstroke">IStrokeBuilder::BeginStroke Method</a>, <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istrokebuilder-appendpackets">IStrokeBuilder::AppendPackets Method</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istrokebuilder-endstroke">IStrokeBuilder::EndStroke Method</a> methods, which mirror the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusdown">StylusDown</a>, <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-packets">Packets</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusup">StylusUp</a> notifications.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/nn-rtscom-istrokebuilder
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IStrokeBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStrokeBuilder
     * @type {Guid}
     */
    static IID => Guid("{a5fd4e2d-c44b-4092-9177-260905eb672b}")

    /**
     * The class identifier for StrokeBuilder
     * @type {Guid}
     */
    static CLSID => Guid("{e810cee7-6e51-4cb0-aa3a-0b985b70daf7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStroke", "BeginStroke", "AppendPackets", "EndStroke", "get_Ink", "putref_Ink"]

    /**
     * @type {IInkDisp} 
     */
    Ink {
        get => this.get_Ink()
    }

    /**
     * Creates strokes on an ink object by using packet data that came from a RealTimeStylus Class object.
     * @param {Integer} cPktBuffLength The number of LONGs in the <i>pPackets</i> array not the size in bytes. Valid values are between 0 and 0x000FFFFF, inclusive.
     * @param {Pointer<Integer>} pPackets A pointer to the start of the packet data.
     * @param {Integer} cPacketProperties The count of longs in the <i>pPacketProperties</i> buffer. This is the number of packets multiplied by the number of properties. Valid values are between 0 and 32, inclusive.
     * @param {Pointer<PACKET_PROPERTY>} pPacketProperties The buffer containing the packet properties.
     * @param {Float} fInkToDeviceScaleX The horizontal, or x-axis, conversion factor for the horizontal axis from ink space to digitizer coordinates.
     * @param {Float} fInkToDeviceScaleY The vertical, or y-axis, conversion factor for the vertical axis from ink space to digitizer coordinates.
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke A pointer to the newly created stroke. This value can be <b>NULL</b>.
     * @returns {HRESULT} For a description of the return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istrokebuilder-createstroke
     */
    CreateStroke(cPktBuffLength, pPackets, cPacketProperties, pPacketProperties, fInkToDeviceScaleX, fInkToDeviceScaleY, ppIInkStroke) {
        pPacketsMarshal := pPackets is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", cPktBuffLength, pPacketsMarshal, pPackets, "uint", cPacketProperties, "ptr", pPacketProperties, "float", fInkToDeviceScaleX, "float", fInkToDeviceScaleY, "ptr*", ppIInkStroke, "HRESULT")
        return result
    }

    /**
     * Begins a stroke on an ink object by using packet data from a RealTimeStylus Class object.
     * @param {Integer} tcid The tablet context identifier.
     * @param {Integer} sid The stylus identifier.
     * @param {Pointer<Integer>} pPacket The start of the packet data. It is read-only.
     * @param {Integer} cPacketProperties The count of LONGs, which is the number of packets multiplied by the number of properties, in the <i>pPacketProperties</i> buffer.
     * @param {Pointer<PACKET_PROPERTY>} pPacketProperties The buffer containing the packet properties.
     * @param {Float} fInkToDeviceScaleX The horizontal, or x-axis, conversion factor for the horizontal axis from ink space to digitizer coordinates.
     * @param {Float} fInkToDeviceScaleY The vertical, or y-axis, conversion factor for the vertical axis from ink space to digitizer coordinates.
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke A a pointer to the new stroke. This value can be <b>NULL</b>.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istrokebuilder-beginstroke
     */
    BeginStroke(tcid, sid, pPacket, cPacketProperties, pPacketProperties, fInkToDeviceScaleX, fInkToDeviceScaleY, ppIInkStroke) {
        pPacketMarshal := pPacket is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", tcid, "uint", sid, pPacketMarshal, pPacket, "uint", cPacketProperties, "ptr", pPacketProperties, "float", fInkToDeviceScaleX, "float", fInkToDeviceScaleY, "ptr*", ppIInkStroke, "HRESULT")
        return result
    }

    /**
     * Adds a packet to the end of the digitizer input packet list.
     * @param {Integer} tcid The context identifier for the tablet device to which the stylus belongs.
     * @param {Integer} sid The identifier of the stylus object.
     * @param {Integer} cPktBuffLength The number of LONGs in the <i>pPackets</i> array not the size in bytes. Valid values are betwwen 0 and 0x7FFF, inclusive.
     * @param {Pointer<Integer>} pPackets The start of the packet data. It is read-only.
     * @returns {HRESULT} For a description of the return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istrokebuilder-appendpackets
     */
    AppendPackets(tcid, sid, cPktBuffLength, pPackets) {
        pPacketsMarshal := pPackets is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "uint", tcid, "uint", sid, "uint", cPktBuffLength, pPacketsMarshal, pPackets, "HRESULT")
        return result
    }

    /**
     * Ends a stroke and returns the stroke object.
     * @param {Integer} tcid The tablet context identifier.
     * @param {Integer} sid The stylus identifier.
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke A pointer to the new stroke. This value can be <b>NULL</b>.
     * @param {Pointer<RECT>} pDirtyRect The dirty, or changed, rectangle of the tablet. This value can be <b>NULL</b>.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>..
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istrokebuilder-endstroke
     */
    EndStroke(tcid, sid, ppIInkStroke, pDirtyRect) {
        result := ComCall(6, this, "uint", tcid, "uint", sid, "ptr*", ppIInkStroke, "ptr", pDirtyRect, "HRESULT")
        return result
    }

    /**
     * Gets or sets the ink object that is associated with the IStrokeBuilder object.
     * @returns {IInkDisp} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istrokebuilder-get_ink
     */
    get_Ink() {
        result := ComCall(7, this, "ptr*", &ppiInkObj := 0, "HRESULT")
        return IInkDisp(ppiInkObj)
    }

    /**
     * 
     * @param {IInkDisp} piInkObj 
     * @returns {HRESULT} 
     */
    putref_Ink(piInkObj) {
        result := ComCall(8, this, "ptr", piInkObj, "HRESULT")
        return result
    }
}
