#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} cPktBuffLength 
     * @param {Pointer<Int32>} pPackets 
     * @param {Integer} cPacketProperties 
     * @param {Pointer<PACKET_PROPERTY>} pPacketProperties 
     * @param {Float} fInkToDeviceScaleX 
     * @param {Float} fInkToDeviceScaleY 
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke 
     * @returns {HRESULT} 
     */
    CreateStroke(cPktBuffLength, pPackets, cPacketProperties, pPacketProperties, fInkToDeviceScaleX, fInkToDeviceScaleY, ppIInkStroke) {
        result := ComCall(3, this, "uint", cPktBuffLength, "int*", pPackets, "uint", cPacketProperties, "ptr", pPacketProperties, "float", fInkToDeviceScaleX, "float", fInkToDeviceScaleY, "ptr", ppIInkStroke, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @param {Pointer<Int32>} pPacket 
     * @param {Integer} cPacketProperties 
     * @param {Pointer<PACKET_PROPERTY>} pPacketProperties 
     * @param {Float} fInkToDeviceScaleX 
     * @param {Float} fInkToDeviceScaleY 
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke 
     * @returns {HRESULT} 
     */
    BeginStroke(tcid, sid, pPacket, cPacketProperties, pPacketProperties, fInkToDeviceScaleX, fInkToDeviceScaleY, ppIInkStroke) {
        result := ComCall(4, this, "uint", tcid, "uint", sid, "int*", pPacket, "uint", cPacketProperties, "ptr", pPacketProperties, "float", fInkToDeviceScaleX, "float", fInkToDeviceScaleY, "ptr", ppIInkStroke, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @param {Integer} cPktBuffLength 
     * @param {Pointer<Int32>} pPackets 
     * @returns {HRESULT} 
     */
    AppendPackets(tcid, sid, cPktBuffLength, pPackets) {
        result := ComCall(5, this, "uint", tcid, "uint", sid, "uint", cPktBuffLength, "int*", pPackets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke 
     * @param {Pointer<RECT>} pDirtyRect 
     * @returns {HRESULT} 
     */
    EndStroke(tcid, sid, ppIInkStroke, pDirtyRect) {
        result := ComCall(6, this, "uint", tcid, "uint", sid, "ptr", ppIInkStroke, "ptr", pDirtyRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDisp>} ppiInkObj 
     * @returns {HRESULT} 
     */
    get_Ink(ppiInkObj) {
        result := ComCall(7, this, "ptr", ppiInkObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDisp>} piInkObj 
     * @returns {HRESULT} 
     */
    putref_Ink(piInkObj) {
        result := ComCall(8, this, "ptr", piInkObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
