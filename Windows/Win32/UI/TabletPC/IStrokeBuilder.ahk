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
     * 
     * @param {Integer} cPktBuffLength 
     * @param {Pointer<Integer>} pPackets 
     * @param {Integer} cPacketProperties 
     * @param {Pointer<PACKET_PROPERTY>} pPacketProperties 
     * @param {Float} fInkToDeviceScaleX 
     * @param {Float} fInkToDeviceScaleY 
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istrokebuilder-createstroke
     */
    CreateStroke(cPktBuffLength, pPackets, cPacketProperties, pPacketProperties, fInkToDeviceScaleX, fInkToDeviceScaleY, ppIInkStroke) {
        pPacketsMarshal := pPackets is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", cPktBuffLength, pPacketsMarshal, pPackets, "uint", cPacketProperties, "ptr", pPacketProperties, "float", fInkToDeviceScaleX, "float", fInkToDeviceScaleY, "ptr*", ppIInkStroke, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @param {Pointer<Integer>} pPacket 
     * @param {Integer} cPacketProperties 
     * @param {Pointer<PACKET_PROPERTY>} pPacketProperties 
     * @param {Float} fInkToDeviceScaleX 
     * @param {Float} fInkToDeviceScaleY 
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istrokebuilder-beginstroke
     */
    BeginStroke(tcid, sid, pPacket, cPacketProperties, pPacketProperties, fInkToDeviceScaleX, fInkToDeviceScaleY, ppIInkStroke) {
        pPacketMarshal := pPacket is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", tcid, "uint", sid, pPacketMarshal, pPacket, "uint", cPacketProperties, "ptr", pPacketProperties, "float", fInkToDeviceScaleX, "float", fInkToDeviceScaleY, "ptr*", ppIInkStroke, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @param {Integer} cPktBuffLength 
     * @param {Pointer<Integer>} pPackets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istrokebuilder-appendpackets
     */
    AppendPackets(tcid, sid, cPktBuffLength, pPackets) {
        pPacketsMarshal := pPackets is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "uint", tcid, "uint", sid, "uint", cPktBuffLength, pPacketsMarshal, pPackets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke 
     * @param {Pointer<RECT>} pDirtyRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istrokebuilder-endstroke
     */
    EndStroke(tcid, sid, ppIInkStroke, pDirtyRect) {
        result := ComCall(6, this, "uint", tcid, "uint", sid, "ptr*", ppIInkStroke, "ptr", pDirtyRect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istrokebuilder-get_ink
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
